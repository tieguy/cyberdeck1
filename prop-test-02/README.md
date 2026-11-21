# Prop test piece, rev 0.2

A test of the two features of the prop that print in place: the cone pivots, and the click that
holds the stowed prop. The piece is the four corners of the prop and of its opening, cut from
the real tablet half (`../case02/case02.scad`) and moved together. The middle of the panel is
left out.

| File | Contents |
|---|---|
| `prop_test.scad` | The model. `tpart="frame"` and `tpart="prop"` show the two bodies alone. |
| `prop_test_plate.stl` | The print plate, 60 × 50 mm, about 12 cm³ |

The plate is one job with two bodies: the frame, and the prop inside it. The prop lies on the
bed, as in the case. No part needs supports. The gap round the prop is 0.4 mm, and 0.3 mm round
the cone pivots and the click bumps. The plate is not checked in a slicer.

## Differences from the case

- The prop is 39 mm long from pivot to feet; in the case it is 105.5 mm. A pull at the feet has
  the same effect on the click in both. The pivots carry less leverage here.
- The prop is 30 mm wide; in the case it is 118.6 mm. The frame is stiffer across this width, so
  the click can feel a little harder here than in the case.
- The finger notch is in the part that is left out. Push the prop out from the pocket side.

## What to look for, and what to report

1. **Free or fused**: after the print, push the feet end of the prop out from the pocket side.
   Does the prop come free, or is it fused at the pivots, at the click bumps, or along an edge?
2. **Pivots**: does the prop turn freely to 90°? How much does it rattle from side to side? Does
   it stay in its pivots when you pull on it?
3. **Click**: push the prop back in. Do you feel a click at both feet? Does the prop stay in
   when you shake the piece with the back down? How hard is it to push out: easy with one
   finger, hard, or not possible without a tool?
4. **Springs**: after ten clicks, are the two thin springs beside the feet whole, and are the
   bumps still there?
5. **The back**: is the prop flush with the back of the frame? Is the bed-side face clean round
   the 0.4 mm gap?

## Results

Not printed yet.
