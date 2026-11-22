# cyberdeck1

Read `../CLAUDE.md` and `../PRINTER.md` first. They hold the printer limits and the rule on
OpenGL programs for all projects in `3D-Printing/`.

Then read, in this order: `README.md` (status and file index), `DESIGN-0.3.md` (the revision
that is next, and what it starts from), `DESIGN-0.2.md` (the revision that is printed last: its
design, what its tests showed, and the results of its print), and `HINGE.md` (what is known
about the hinge).

## Where things are

| Path | Contents |
|---|---|
| `PARTS.md` | The bought parts and their dimensions. Each dimension has a source tag. |
| `DESIGN-0.1.md` | Rev 0.1: complete, printed 2026-11-20. Its results. Git tag `rev-0.1`. |
| `DESIGN-0.2.md` | Rev 0.2: designed; its first full print started 2026-11-21. Decisions, the design, what the tests showed, the results of the print. |
| `DESIGN-0.3.md` | Rev 0.3: not started. What it starts from. |
| `DESIGN-1.0.md` | Ideas for rev 1.0: the look, the material. |
| `HINGE.md` | The geometry that every hinge for this case must obey, and the hinges tried so far. |
| `case/` | Rev 0.1 model (`case.scad`), views and print files. Do not change it. |
| `case02/` | Rev 0.2 model (`case02.scad`), views, print files, the list of checks, the assembly. |
| `hinge-test-02/`, `prop-test-02/` | Test pieces for the rev 0.2 hinge and prop, with the results of three test plates. They include `case02/case02.scad`. |
| `test-plate-02/` | One print plate that takes pieces from both. |
| `hinge-test/`, `fit-test/` | Test pieces for rev 0.1, with their results. They include `case/case.scad`. |

## Documents

- When the owner measures a part, replace the [spec] or [unknown] figure in `PARTS.md` with the
  [measured] one, with the date.
- Each revision has one design file, `DESIGN-<revision>.md`. It holds the decisions, the reasons
  and the open questions for that revision, and later the results of the print. Put an idea for a
  later revision in that revision's file.
- Put a result that applies to the printer, not to this case, in `../PRINTER.md`.
- Mark each statement about a cause as confirmed or not confirmed. In this project several
  confident explanations were wrong (refer to "Mistakes to avoid").

## Models: OpenSCAD first

- Write each model in OpenSCAD (`.scad`) when OpenSCAD can do the job.
- Generate each STL from its `.scad` file with the OpenSCAD command line. Do not edit an STL by
  hand. On deepthought the command is `openscad-nightly`: `openscad-nightly -o part.stl part.scad`.
- Commit each STL with its `.scad` source, and regenerate the STL when the source changes.
- A test piece takes its shapes from the case model with `include`, so that a change in the model
  changes the test piece.

## How to show the owner a design

The owner reviews geometry in the 3D viewer on GitHub. Commit a view STL of the whole case in each
pose (closed, stand), with plain blocks for the tablet and the keyboard, and give the links. The
viewer shows one colour.

To look at a model yourself, render it with matplotlib; do not use OpenGL. The Python at
`../koinobori-skeleton/.venv/bin/python` has trimesh, manifold3d, numpy and matplotlib. It has no
scipy, so `mesh.section()` and `body_count` fail. Run it with `-I`.

## How to check a model

Do these before you tell the owner that a model is ready.

1. **Collisions.** Add views to the model that are the `intersection()` of two parts in a pose.
   OpenSCAD prints "Current top level object is empty" when they do not touch. Check the closed
   pose, the stand at each angle, the swing between them (270°, 180°, 90°), and each moving part
   in each of its positions. `case02/README.md` lists the checks for rev 0.2.
2. **Clearance, not only collision.** An empty intersection can hide a gap of 0.01 mm. Where two
   parts pass each other, state the gap in millimetres. A printed part needs at least 0.3 mm, and
   more next to a face that prints on supports.
3. **The plate.** Check that separate parts on a print plate do not touch or overlap. Check the
   size of the plate against `../PRINTER.md`.
4. **The slicer.** `../slicer/README.md` gives the command for a PrusaSlicer estimate of time and
   filament. State that it is not a Bambu Studio time.
5. **Contact with the bed.** A long thin part with a narrow flat on the bed comes loose.

A trimesh report of "not watertight" for an OpenSCAD STL can be points that differ by less than
0.001 mm. Weld the points (`merge_vertices(digits_vertex=3)`) before you conclude that the mesh is
open.

More checks, from rev 0.2:

6. **Loose pieces.** Count the solid bodies of each print file: weld the points, make a
   `manifold3d.Manifold` from the mesh, and call `decompose()`. A plate must have exactly the
   bodies that you put on it. A pattern of holes can cut pieces of a floor free, and a part that
   prints in place must be a body of its own.
7. **Moving parts through their whole travel.** Check a part that turns at several angles
   between its end positions, not only at the ends.
8. **Look at it.** After each change of shape, render the part and look at the picture before
   you tell the owner. A cut through the model for a test piece can leave thin bars or chips.
9. **Check that a check can fail.** Run a collision check on a pose that must collide.

Use dimensions from the model, not from memory, when you place a cut or state a size.

In a file that takes modules from another file with `use`, set `$fn` again: `use` does not
bring it.

## Print before you trust

The owner prefers a small test print to a long explanation. Before a print of several hours, cut a
small piece from the real model that tests the new or doubtful features, and say what to look for
and what to report. The results go in the README of the test piece.

Draw a test piece so that the owner can choose: three links of different thickness, with small
holes as marks, settled the fit of the links in one print. Walk the owner through the items of
a test one at a time, and write each result in the README of the test piece on the same day.

The owner prints in Bambu Studio. Supports under a face are hard to remove and leave lines; avoid
them in the design. Lips that overhang a pocket by 2.5 mm print without supports, with some
strings.

## Mistakes to avoid

Each of these happened in this project.

- A part placed on a print plate inside the footprint of another part: they printed as one.
- A number from the owner used with the wrong reference: "13.6 mm to the USB-C port" was to its
  near end, not to its middle; "40 degrees" was the screen's angle from the table, not the angle
  between the halves. Ask what a number is measured from and to.
- A part assumed to be a box: the tablet's edge is round, and the folded keyboard is not a
  rectangle. Ask for a photo with a known length in it.
- A design feature with no clearance: a pin axis exactly in the plane where two faces meet.
- A request read too broadly: "portrait and landscape" meant two cases, not one case for both.
- A cause stated as fact: the "outgrowth" on the test hinge, the strings on the lips, the sag of
  the stand. The owner found the real cause of each by looking at the part.
- A feature that helps printing but breaks something else: the bevel on a lip made a knife edge
  and cut a notch in the next lip.
- The half that lies on the table needs its hinge segments, which are its feet, at its edges.
- A cause stated as fact, again: a gap on the 45° stop was put down to play at the pins, and
  then to a slot wall in the wrong half. The owner pointed at the real place both times. Ask
  the owner for a simple test that separates the causes before you change the model.
- A fix made without a test of its cause, which made the fault worse: the slot walls were moved
  further away, and the tablet half leaned back more.
- A pivot drawn in a floor that is too thin for it: a socket 3.2 mm across in a floor of 3 mm
  breaks through the face. Add up the hole, the gap and the walls before you draw a pivot.
- A test piece cut through a lip: two thin bars of the lip stayed in the air, on three plates.
- A mechanism with a free angle that the drawing did not show: a link and one contact do not
  hold a part. Count the free angles of a linkage, and say what stops each one.
