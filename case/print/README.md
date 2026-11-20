# Print files, rev 0.1

The four printed parts of the case, each in the pose in which it prints. They come from
`../case.scad`.

| File | Part | Size on the bed | Quantity |
|---|---|---|---|
| `k_half.stl` | Keyboard half | 149 × 237 × 20 mm | 1 |
| `t_half.stl` | Tablet half | 149 × 234 × 14 mm | 1 |
| `bail.stl` | Bail (the prop) | 157 × 122 × 6 mm | 1 |
| `pin.stl` | Hinge pin, 2.9 mm | 108 × 3 × 3 mm | 1, and 1 spare |

## Print

PLA, 0.2 mm layers, 0.4 mm nozzle.

- **Supports: on the build plate only.** The tapers at the hinge and the hinge knuckles hang over
  the bed and need supports. The lips over the tablet hang over the pocket floor; with this
  setting they print bare. In the fit test, supports under those lips did not come off cleanly.
- Do not turn or flip the parts. Each lies with the correct face on the bed.
- The two halves fit on one plate, side by side: 307 × 240 mm. With the filament in the right
  nozzle, keep the plate inside X = 25 to 350 mm (refer to `../../../PRINTER.md`).
- The bail and the pins go on a second plate, or beside the halves if there is room.

PrusaSlicer estimates from `../../../slicer/` (2026-11-20), with its own supports: the two halves
take 5 hours 19 minutes and 213 g; the bail and two pins take 15 minutes and 10 g. These are not
Bambu Studio times.

## Assemble

1. Remove the supports from the tapers and from under the knuckles. Clear the pin holes.
2. Lay the two halves flat, pockets up, with the knuckles together. The tablet half's two
   knuckles go on each side of the keyboard half's one knuckle.
3. Push the pin in from the side with the cut-out for the USB-C port, until it meets the closed
   end. The keyboard half's knuckle grips it.
4. Spring the bail's arms apart and snap its two stubs into the holes in the side walls of the
   keyboard half. The cross bar lies on the outside of that half.

To take the pin out, push a paper clip through the small hole in the closed end.

## Use

1. Slide the tablet into the tablet half from the free end, screen toward the pocket's open
   face, touch buttons toward the hinge.
2. Lay the folded keyboard in the keyboard half and close the case. Nothing holds the case shut:
   use an elastic band.
3. To set up: open the case and take the keyboard out. Lay the keyboard half on the table with
   its pocket down. Swing the tablet half the long way round until its taper rests on the taper of
   the keyboard half. Lift the bail and set its cross bar in a groove on the back of the tablet
   half.

## What to report

- Do the supports come off the tapers, and do the halves close flat?
- Does the tablet slide in, and does the lower lip hold it? Does the cut-out meet the USB-C port?
- Does the stand hold at 45° on the tapers alone? With the bail? How much does it move when you
  tap the touch buttons?
- How stiff are the halves?
- Do the bail's stubs stay in their holes?
- What is awkward in use.

## Known limits

- The STL files have points that differ by less than 0.001 mm where a taper joins its half. A
  slicer joins them. If a slicer reports errors in a file, let it repair the file.
- The position of the USB-C cut-out is an estimate from a photo.
- The model was checked for collisions closed, as a stand, with the bail up and with the bail
  stowed. It was not checked for strength.
