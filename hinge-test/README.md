# Hinge test piece

A slice of the rev 0.1 hinge, 40 mm wide, to print before the two halves of the case. The hinge
design is in `../DESIGN-0.1.md`. The shapes come from `../case/case.scad`.

It answers these questions:

1. Do the tapers print cleanly on supports, and do the supports come off?
2. Which pin diameter do the crush ribs grip, while the outer knuckles still turn freely?
3. Does the taper of one leaf seat on the taper of the other at 45°, and hold there?
4. Are the knuckles and their necks strong enough?
5. Does a paper clip through the small hole push the pin out?

## Parts

`hinge_test_plate.stl` holds all the parts.

| Part | What it is |
|---|---|
| K leaf | The keyboard half's side: 15.5 mm thick, tapered at 27°, with the centre knuckle and its three crush ribs |
| T leaf | The tablet half's side: 9.7 mm thick, tapered at 18°, with the two outer knuckles. The pin's hole is closed at one end, with a 1.6 mm hole through the closed end. |
| Pins | Three pins. The shortest is 2.9 mm across, the middle one 3.0 mm, the longest 3.1 mm. The case design uses 2.9 mm. |

## Print

Print the plate as it lies, in PLA, at 0.2 mm layers, **with supports on the build plate**. The
tapers are overhangs. The pins and the holes need no supports.

The PrusaSlicer estimate from `../../slicer/` (2026-11-19) is 46 minutes and 21 g, with
PrusaSlicer's own supports. That estimate is not a Bambu Studio time.

To make the plate again after a change:

```
openscad-nightly -o hinge_test_plate.stl hinge_test.scad
```

## Assemble

1. Lay the two leaves flat, tapered faces down, with the knuckles together.
2. Push a pin in from the open end of the hole. Start with the 2.9 mm pin.

## Results

- 2026-11-19: the 2.9 mm pin fits well. The 3.0 mm pin is too big.

## What to report

- The surface of the tapers after the supports come off.
- For each pin: how hard it goes in, whether the K leaf's knuckle grips it, and whether the T
  leaf turns freely.
- Fold the leaves back until the tapers touch. Does the hinge stop firmly? Push on the T leaf as
  a tap on the screen would: does anything flex or creak?
- Whether a paper clip pushes the pin out.
- Any part that broke or did not print cleanly. The crush ribs are 0.25 mm high, which is near
  the limit of a 0.4 mm nozzle.

Add the results to `../../PRINTER.md`, in the fits table.

## Limits of this test

- In the stand position, the taper of each leaf passes 2 mm from the neck of the other leaf's
  knuckle. Rough surfaces from the supports can use up part of that gap.
- The real hinge is 116 mm wide. This slice is 40 mm wide, so it twists more easily.
- The leaves were checked for collisions at 45°, 90°, 180°, 270° and closed. They were not
  checked for strength.
