# Ratchet hinge test piece

A small hinge to print before the case is designed. It answers three questions:

1. Does a printed ratchet click, and does it hold?
2. Which pin diameter turns freely in a 5.2 mm hole on this printer?
3. Is a 10° tooth pitch printable, or is 15° the practical limit?

## What it is

Two leaves, 10 mm thick, turn on one pin. A toothed wheel is keyed to leaf A. A spring finger on
leaf B rides on the wheel.

- The hinge turns freely from closed (0°) through flat (180°) to about 240°.
- From there to the stop at 320°, the teeth click. The hinge turns toward the stop, but the teeth
  block it from turning back. This is the direction in which the weight of an A-frame stand pushes.
- To turn the hinge back, push the tab on the end of the finger away from the wheel.
- A small hump holds the hinge closed at 0°.
- At 320° the outer edges of the leaves meet. The leaf bodies start 27.5 mm from the pin so that
  they can come this close.

## Angle marks

The outer face of each wheel has one tick for each click. The long tick is the stop. To name an
angle, count the clicks back from the stop.

| Clicks back from the stop | Wheel with one dot (10°) | Wheel with two dots (15°) |
|---|---|---|
| 0 (the stop) | hinge 320°, legs 40° apart | hinge 320°, legs 40° apart |
| 1 | 310°, 50° | 305°, 55° |
| 2 | 300°, 60° | 290°, 70° |
| 3 | 290°, 70° | 275°, 85° |
| 4 | 280°, 80° | 260°, 100° |
| 5 | 270°, 90° | |
| 6 | 260°, 100° | |
| 7 | 250°, 110° | |

In a symmetric A-frame, the screen leans back from vertical by half of the angle between the legs.

## Print

`hinge_test_plate.stl` holds all the parts: leaf A, leaf B, two wheels and three pins. Print it as
it lies, in PLA, at 0.2 mm layers, with no supports. The PrusaSlicer estimate from `../../slicer/`
(2026-11-19) is 33 minutes and 17 g. That estimate is not a Bambu Studio time.

To make the plate again after a change:

```
openscad-nightly -D 'part="plate"' -o hinge_test_plate.stl hinge_test.scad
```

## Assemble

1. Put the square key of a wheel into the socket at the end of leaf A's knuckle. The key fits one
   way only.
2. Lay leaf B flat next to leaf A so that the knuckles line up. The finger goes under the wheel.
3. Push a pin through from leaf B's side. The pins have 1, 2 or 3 notches on the head, for
   4.6, 4.8 and 5.0 mm.

## What to report

- Which pin turns freely with the least play.
- For each wheel: does each click feel distinct? Does the hinge hold when you push it back by
  hand? Does the finger jump a tooth?
- Does the tab release the ratchet easily?
- Any part that broke or did not print cleanly. The teeth are 0.6 mm deep, which is near the
  limit of a 0.4 mm nozzle.

Add the results to `../../PRINTER.md`, in the fits table.

## Limits of this test

- The finger is 7 mm wide. The real case can use wider fingers, or two of them, to hold more.
- The model was checked for collisions through the full turn, in steps of 10°. It was not checked
  for strength.
