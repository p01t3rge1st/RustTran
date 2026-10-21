#!/usr/bin/env python3
"""Generate application icons from the repository-native SVG (CairoSVG/Pillow)."""
from pathlib import Path
import cairosvg
from PIL import Image
ROOT=Path(__file__).resolve().parents[1]
ASSETS=ROOT/'rusttran/assets'
for size in [16,24,32,48,64,128,256,512]:
 cairosvg.svg2png(url=str(ASSETS/'rusttran.svg'),write_to=str(ASSETS/f'rusttran-{size}.png'),output_width=size,output_height=size)
image=Image.open(ASSETS/'rusttran-256.png')
image.save(ASSETS/'rusttran.ico',format='ICO',sizes=[(16,16),(24,24),(32,32),(48,48),(64,64),(128,128),(256,256)])
