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

## Not tested yet

The lips have not printed without supports. They are flat overhangs of 2.5 mm, and the pocket
has only 0.3 mm of room above the tablet, so a lip that sags can make the tablet bind. Print
`t_fit.stl` with supports on the build plate only (which gives this piece none) to find out.

## Edge gauge

`edge_gauge_plate.stl` is five short clips, from `edge_gauge.scad`. Each has the cross-section of
the tablet holder at a side lip. They differ in the shape under the lip, in the corner where the
tablet's rounded edge leaves room. A fuller corner holds the tablet better, and a sloped corner
prints without supports.

| Notches on the back | Shape under the lip |
|---|---|
| 1 | Flat, as in the case model |
| 2 | 45° slope, 1.0 mm |
| 3 | 45° slope, 1.5 mm |
| 4 | 45° slope, 2.0 mm |
| 5 | Rounded, 1.5 mm radius |

Print the plate as it lies, with no supports. The clips stand on end, so each profile is exact.
The estimate is 11 minutes and 4 g.

Slide each clip onto a long edge of the tablet, with the lip on the screen side. Report the
highest-numbered slope (2, 3 or 4) that still slides on freely, and whether clip 5 does.

## Limits of this test

- The pieces are open frames. They do not show how stiff the full halves are.
- The K piece has no finger notch, so it does not show how easily the keyboard lifts out.
