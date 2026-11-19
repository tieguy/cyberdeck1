# cyberdeck1

Read `../CLAUDE.md` and `../PRINTER.md` first. They hold the printer limits and the rule on
OpenGL programs for all projects in `3D-Printing/`.

`README.md` lists the parts and their dimensions. Each dimension has a source tag. When the owner
measures a part, replace the [spec] or [unknown] figure with the [measured] one.

## Models: OpenSCAD first

- Write each model in OpenSCAD (`.scad`) when OpenSCAD can do the job.
- Generate each STL from its `.scad` file with the OpenSCAD command line. Do not edit an STL by
  hand. On deepthought the command is `openscad-nightly`: `openscad-nightly -o part.stl part.scad`.
- Commit each STL with its `.scad` source, and regenerate the STL when the source changes.
- Keep the part dimensions in one shared `.scad` file that the other models include, so that a
  new measurement changes every part.
