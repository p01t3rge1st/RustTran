#!/usr/bin/env python3
"""Smoke-test the packaged recovered engine from an unrelated working directory."""
import csv
import hashlib
import json
import re
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = ROOT / 'dist/rusttran-linux-x86_64'
CLI = PACKAGE / 'rusttran-cli'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    runs = []
    with tempfile.TemporaryDirectory(prefix='rusttran-release-') as temporary:
        work = Path(temporary)

        def execute(command, payload):
            request = work / 'request.json'
            request.write_text(json.dumps(payload))
            result = json.loads(subprocess.check_output([str(CLI), command, str(request)], cwd=work))
            runs.append(command)
            return result['solution']

        fresh = execute('fresh-thermal-startup', {'model': '4', 'ic': '1'})
        assert len(fresh['singles']) == 130 and len(fresh['integers']) == 15
        initialized = execute('fresh-initial-state', json.loads((PACKAGE / 'examples/fresh-initial-state.json').read_text()))
        assert len(initialized['globals']['singles']) == 290
        assert len(initialized['globals']['integers']) == 28
        assert len(initialized['alternate']['doubles']) == 33
        assert len(initialized['alternate']['arrays']) == 12
        alternate = execute('alternate-init', dict(globals=initialized['globals'], model_doubles=initialized['model_doubles']))
        assert alternate == initialized['alternate']
        clock = execute('native-stages', dict(model='4', ic='1', extra_singles={'0x54b414': -.0005}, stages=[dict(kind='startup_clock')]))
        assert clock['stages'][0]['solution']['0x54b700'] == -1
        for name in ('startup_constants', 'startup_geometry', 'loop_transport'):
            case = json.loads((ROOT / f'analysis/{name}_fixtures.json').read_text())['cases'][0]
            result = execute('native-stages', case['inputs'])
            actual = result['stages'][0]['solution']
            expected = case['expected']
            # Geometry/feedback expose Single maps; constants include both maps.
            if name != 'loop_transport':
                assert actual == expected, name
            else:
                assert set(actual) == set(expected)
        request = json.loads((PACKAGE / 'examples/gui-simulation-session.json').read_text())
        original = request.get('session', request)
        eight = execute('recovered-session-run', dict(session=original, steps=8))
        three = execute('recovered-session-run', dict(session=original, steps=3))
        five = execute('recovered-session-run', dict(session=three['session'], steps=5))
        assert eight['session'] == five['session']
        assert original['controls']['loop_transport']
        assert eight['session']['globals']['singles']['0x54b694'] != original['globals']['singles']['0x54b694']
        request_file = work / 'session.json'
        request_file.write_text(json.dumps(dict(session=original, steps=8)))
        report_dir = work / 'report'
        subprocess.run(['python3', str(ROOT / 'scripts/run_session_report.py'), '--state', str(request_file), '--steps', '8', '--cli', str(CLI), '--output', str(report_dir)], cwd=work, check=True, stdout=subprocess.DEVNULL)
        rows = list(csv.reader((report_dir / 'history.csv').open()))
        assert len(rows) == 9
        for row, step in zip(rows[1:], eight['steps']):
            assert float(row[1]) == step['singles']['0x54b40c']
            assert float(row[2]) == step['singles']['0x54b494']
        help_text = subprocess.check_output([str(PACKAGE / 'rusttran'), '--help'], cwd=work, text=True)
        assert '--session PATH' in help_text and '--session-steps COUNT' in help_text
        glibc = {}
        for binary in ('rusttran', 'rusttran-cli'):
            output = subprocess.check_output(['readelf', '--version-info', str(PACKAGE / binary)], text=True)
            versions = [tuple(map(int, v.split('.'))) for v in re.findall(r'GLIBC_([0-9.]+)', output)]
            maximum = max(versions)
            assert maximum <= (2, 28), (binary, maximum)
            glibc[binary] = '.'.join(map(str, maximum))
            assert digest(PACKAGE / binary) == digest(Path.home() / '.local/bin' / binary)
        result = dict(cli_runs=runs, fresh_startup_singles=130, fresh_startup_i16=15,
                      three_plus_five_equals_eight=True, loop_feedback_changes_temperature=True,
                      report_csv_matches_engine=True, gui_help_session_options=True,
                      max_glibc=glibc, installed_binaries_match=True,
                      fresh_assembled_singles=290, fresh_assembled_integers=28, alternate_double_writes=33, alternate_arrays=12, startup_clock_floor=True, double_state_recomputation_matches=True,
                      gui_widget_results=json.loads((ROOT / 'analysis/gui-interaction/results.json').read_text()),
                      windows='GUI/CLI cross-compiled; not executed on Windows',
                      whole_original_scenarios='not validated')
        (ROOT / 'analysis/fresh-state-release-smoke.json').write_text(json.dumps(result, indent=2) + '\n')
        print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
