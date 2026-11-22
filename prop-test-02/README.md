# Prop test piece, rev 0.2

A test of the prop's axle and of the click that holds the stowed prop. The piece is the four corners of the prop and of its opening, cut from
the real tablet half (`../case02/case02.scad`) and moved together. The middle of the panel is
left out.

| File | Contents |
|---|---|
| `prop_test.scad` | The model. `tpart="frame"` and `tpart="prop"` show the two bodies alone. |
| `prop_test_plate.stl` | The print plate, 73 × 48 mm, about 12 cm³ |

The plate has the frame with the prop inside it, printed in place, and three axle pins (two are
needed). The prop lies on the bed, as in the case. No part needs supports. The gap round the
prop is 0.4 mm, and 0.3 mm at the outer faces of its knuckles and round the click bumps. The
plate is not checked in a slicer.

## How to put it together

At the end of the prop away from its feet, each side has a knuckle inside the side wall of the
frame. Push an axle pin through the hole in each side wall into the knuckle, with the flat of
the pin toward the back face (the face that was on the bed). The hole in the knuckle has the
same flat. The head of the pin stays outside, 1 mm proud.

## Differences from the case

- The prop is 39 mm long from pivot to feet; in the case it is 105.5 mm. A pull at the feet has
  the same effect on the click in both. The axle carries less leverage here.
- The prop is 30 mm wide; in the case it is 118.6 mm. The frame is stiffer across this width, so
  the click can feel a little harder here than in the case.
- The finger notch is in the part that is left out. Push the prop out from the pocket side.

## What to look for, and what to report

1. **Free or fused**: does the prop come free, also at the knuckles inside the side walls?
2. **Axle**: do the pins go in by hand, and do the ribs in the knuckles hold them? Does the prop
   turn freely to about 85°, where the frame stops it? Does it stay in when you pull on it?
3. **Click**: is the click clear at both feet? Does the prop stay in when you shake the piece
   with the back down? Is it still easy enough to push out?
4. **Springs**: after ten clicks, are the two thin springs beside the feet whole?
5. **The back**: is the stowed prop flush with the back of the frame? There is a groove 3 mm
   wide along the axle; the end of the prop needs it to turn. Is its look acceptable?

## Results

### Third plate

Printed 2026-11-21, with printed axle pins in knuckles, click bumps 0.9 mm high and springs 9 mm
long.

1. **Free or fused**: free.
2. **Axle**: pass. The pins go in by hand and stay in, and the prop stays on when it is pulled.
   The owner noted that the heads of the pins stand out of the sides; on this plate they stood
   1 mm out. In the model they now sit 0.6 mm deep in a round recess, and stand 0.4 mm out.
3. **Click**: pass. A clear click, and the prop is easy to push out.
4. **Springs**: no cracks.
5. **The back**: the groove along the axle is acceptable to the owner.

All items of the prop test now pass. The recess for the heads of the axle pins is not tested.

### Second plate

Printed 2026-11-21, with a filament axle: a 2.2 mm hole along the end of the prop, in a floor
3 mm thick.

1. **Free or fused**: the prop comes free.
2. **Axle**: the hole breaks through the surfaces at the end of the prop, because the walls
   round it are 0.4 mm. The axle works otherwise. The owner wants a printed axle, not filament.

The click, the springs and the back were not checked on this plate.

### First plate

Printed 2026-11-21. That plate had cone pivots, not an axle, and click bumps 0.7 mm high. Its
items were: free or fused, pivots, click, springs, the back.

1. **Free or fused**: the prop is very free. Nothing fused.
2. **Pivots**: the prop turns freely, but it comes out of its pivots very easily. The owner saw
   that the sockets are open at the back face. This is in the model: the axis is 1.5 mm above
   the back face and a socket has a radius of 1.6 mm, so each socket breaks through the back as
   a slit about 1 mm wide. A floor of 3 mm is too thin for a cone that holds.
3. **Click**: a very small click. The prop stays in when the piece is shaken, but only just: one
   bump lets go while the other holds. It is easy to push out. Each bump goes 0.3 mm into its
   dimple, and the prop has 0.4 mm of play to each side, so the prop can move until one bump is
   out of its dimple.
4. **Springs**: no cracks after about ten clicks.
5. **The back**: the stowed prop is about 0.25 mm below the back face of the frame. The owner's
   explanation: the play of the cone pivots, which was 0.3 mm. Not confirmed. The gap round the prop is even everywhere.

Changes made in the model for the second plate:

- An axle in place of the cone pivots: a 2 mm hole through each side wall into the ear of the
  prop, for a piece of 1.75 mm filament.
- Higher click bumps, which go about 0.5 mm into their dimples.
