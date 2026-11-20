# Fit test pieces

Two L-shaped pieces cut from the rev 0.1 halves, to print before the full halves. They show
whether the tablet and the folded keyboard go in and out easily. The shapes come from
`../case/case.scad`, so the pockets, walls and lips are those of the real halves.

## Parts

`fit_test_plate.stl` holds both pieces. The smaller L lies inside the corner of the larger one. `t_fit.stl` is the
T piece alone, for a quick check of the lips and the USB-C cut-out: about 40 minutes and 27 g
by the same estimate.

| Piece | What it is |
|---|---|
| K piece, 19.8 mm high | A corner of the keyboard tray: the whole hinge-side wall, one whole side wall, and the ends of the other two walls. It checks the folded keyboard's length, width and depth. |
| T piece, 9.7 mm high | A corner of the tablet holder: the lower wall with its lip and the cut-out for the USB-C port, one whole side lip, and the start of the other side lip. It checks the tablet's width, its thickness under the lips, and how it slides. |

## Print

Print the plate as it lies, in PLA, at 0.2 mm layers, with no supports. If the slicer adds
supports by itself, turn them off. The halves of the case
will print the same way, except for supports under the tapers. The lips over the tablet overhang
by up to 2.5 mm with nothing under them; this print shows whether they come out clean.

The PrusaSlicer estimate from `../../slicer/` (2026-11-19) is 1 hour 20 minutes and 57 g. That
estimate is not a Bambu Studio time.

To make the plate again after a change:

```
openscad-nightly -o fit_test_plate.stl fit_test.scad
```

## Test

**Tablet.** Hold the T piece with the long strip on your left and the short strip toward you.
Slide the tablet in from the far end, screen up, with the touch buttons toward you, until it
meets the lower wall.

- Does it slide easily under the lips? Is it loose, or does it bind?
- Do the lips look clean, or do they sag?
- Does the lip at the lower edge hold the tablet's edge, leave the touch buttons clear, and let
  your finger reach them?
- Does the cut-out in the lower wall line up with the USB-C port? Does a plug go in?
- Does the tablet's upper edge end a little short of the end of the long strip? The model
  expects about 0.6 mm.

**Keyboard.** Lay the folded keyboard into the corner of the K piece.

- Does it fit between the two side walls, and between the hinge-side wall and the wall at the
  far end? How much play is there each way? The model allows 0.7 mm across and 1.0 mm along.
- Is its top below the top of the walls? The model expects 0.5 mm.
- The keyboard's long side in the model, 196.3 mm, is an estimate. This is the first real check
  of it.

Add the results to `../PARTS.md` (measured sizes) and to `../../PRINTER.md` (the lips).

## Results

Printed 2026-11-20. The print used supports under the lips.

- Tablet: it slides in well. The supports under the side lip did not come off cleanly.
- Lower lip: it hardly touches the bezel. The tablet's edge is rounded, about 1 mm deep, and the
  lip covers little more than that.
- USB-C cut-out: it is about 6 mm too near the corner. The port's opening starts in the middle
  of the cut-out and continues behind the wall.
- Keyboard: it fits very well. The folded keyboard is not a rectangle, because of its Alice
  layout. Two wedges of the pocket stay empty, at opposite corners.

The plate in this directory is a later version than the one that was printed. The cut-out for the
USB-C port is 6 mm farther from the corner and 4 mm wider, and the lip at the tablet's lower edge
covers 2.5 mm, not 1.5 mm.

### Second print of the T piece

Printed 2026-11-20 from `t_fit.stl`, with no supports.

- USB-C cut-out: the corrected position is good.
- Side lip: it printed clean with no supports, and the tablet is held very snugly.
- Lower lip: its thin edge printed as strings. The bevel on that lip was 1.1 mm on a lip 1.2 mm
  thick, which left a knife edge. The bevel is now 0.6 mm.
- The tablet's edges are eased, not circular. The flat lip suits them, so the edge gauge is not
  necessary.

## Edge gauge

Not printed. The second print of the T piece showed that the flat lip holds the tablet well.


`edge_gauge_plate.stl` is eight short clips, from `edge_gauge.scad`. Each has the cross-section
of the tablet holder at a side lip. They differ in the shape under the lip, in the corner where
the tablet's rounded edge leaves room.

- A **rounded** corner follows a rounded edge, so it holds the tablet best. It shows the radius
  of the tablet's edge.
- A **45° slope** prints without supports and does not sag. A rounded corner does not: near the
  tip of the lip it is almost flat.

| Mark | Shape under the lip |
|---|---|
| No notch | Flat, as in the case model |
| 1 to 4 notches on the back of the wall | Rounded, radius 0.5, 1.0, 1.5, 2.0 mm |
| 1 to 3 notches under the floor | 45° slope, 1.0, 1.5, 2.0 mm |

Print the plate as it lies, with no supports. The clips stand on end, so each profile is exact.
The print is about 15 minutes.

Slide each clip onto a long edge of the tablet, with the lip on the screen side. Report the
largest round that still slides on freely, and the largest slope that does.

## Limits of this test

- The pieces are open frames. They do not show how stiff the full halves are.
- The K piece has no finger notch, so it does not show how easily the keyboard lifts out.
