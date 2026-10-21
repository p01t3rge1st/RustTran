#!/usr/bin/env python3
"""Reproducible, read-only MDB extraction using locally unpacked mdbtools."""
import csv
import hashlib
import json
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / '.tools/mdb/usr/bin'
ENV = dict(os.environ)
ENV['LD_LIBRARY_PATH'] = str(ROOT / '.tools/mdb/usr/lib/x86_64-linux-gnu')


def run(name, *args):
    return subprocess.run([str(TOOLS / name), *map(str, args)], env=ENV,
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    manifest = {'format_version': 1, 'tool': 'mdbtools', 'databases': []}
    for db in sorted((ROOT / 'analysis/program').glob('*.mdb')):
        dest = ROOT / 'analysis/data' / db.stem
        dest.mkdir(parents=True, exist_ok=True)
        item = {'source': str(db.relative_to(ROOT)), 'sha256': digest(db), 'tables': [], 'failures': []}
        schema = run('mdb-schema', db, 'postgres')
        (dest / 'schema.sql').write_bytes(schema.stdout)
        if schema.returncode or schema.stderr:
            item['failures'].append({'operation': 'schema', 'returncode': schema.returncode,
                                     'stderr': schema.stderr.decode(errors='replace')})
        listing = run('mdb-tables', '-1', db)
        if listing.returncode:
            item['failures'].append({'operation': 'list', 'returncode': listing.returncode,
                                     'stderr': listing.stderr.decode(errors='replace')})
        for table in listing.stdout.decode().splitlines():
            result = run('mdb-export', '-b', 'hex', db, table)
            filename = table.replace('/', '_').replace('\\', '_') + '.csv'
            target = dest / filename
            target.write_bytes(result.stdout)
            entry = {'name': table, 'csv': str(target.relative_to(ROOT)), 'sha256': digest(target),
                     'returncode': result.returncode}
            if result.returncode or result.stderr:
                item['failures'].append({'operation': 'export', 'table': table,
                                         'returncode': result.returncode,
                                         'stderr': result.stderr.decode(errors='replace')})
            try:
                with target.open(newline='', encoding='utf-8') as stream:
                    rows = csv.reader(stream)
                    entry['columns'] = next(rows, [])
                    entry['row_count'] = sum(1 for _ in rows)
            except (UnicodeError, csv.Error) as error:
                item['failures'].append({'operation': 'parse_csv', 'table': table, 'error': str(error)})
            item['tables'].append(entry)
        (dest / 'metadata.json').write_text(json.dumps(item, indent=2) + '\n')
        manifest['databases'].append(item)
    (ROOT / 'analysis/data/manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({d['source']: {'tables': len(d['tables']), 'rows': sum(t.get('row_count', 0) for t in d['tables']),
                                 'failures': len(d['failures'])} for d in manifest['databases']}, indent=2))


if __name__ == '__main__':
    main()
