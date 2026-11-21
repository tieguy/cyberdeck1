# Hinge test piece, rev 0.2

A slice of the real case at one edge, 30 mm wide, for the two-pin link hinge. The shapes come
from `../case02/case02.scad`.

| File | Contents |
|---|---|
| `hinge_test.scad` | The model. `tpart="assembly"` shows the piece put together. |
| `hinge_test_plate.stl` | The print plate, 97 × 70 mm |

## The plate

- The keyboard-half piece and the tablet-half piece, each with its outer face on the bed.
- Three links and three pins. One link and two pins are needed; the others are spares.

No part needs supports. The plate is not checked in a slicer.

## How to put it together

1. Put a link in the slot of the keyboard-half piece. Push a pin in from the edge, through the
   link, until its head is in its recess.
2. Put the other end of the link in the slot of the tablet-half piece, and push the second pin in.

## What to look for, and what to report

1. **Print**: do the chamfers under the noses and the slanted wall of the slot in the tablet-half
   piece print clean, with no supports?
2. **Pins**: does each pin go in by hand, and do the crush ribs hold it? Can you pull it out by
   its head? The ribs are 3.5 mm long; the ribs of the rev 0.1 test were longer.
3. **Link**: does the link turn freely on both pins?
4. **Closed**: put the inner faces together. How far can one piece slide along the other? The
   slot walls must stop it; the snap of the case needs less than about 1 mm.
5. **Swing**: turn the tablet-half piece over the hinge, then the link down, then the tablet-half
   piece onto the chamfer of the other nose. Does anything rub or catch?
6. **Stop**: with the keyboard-half piece flat on the table, inner face down, press the
   tablet-half piece back onto the chamfer. Is it at about 45°? How many degrees does it rock?

The piece has one link, so it twists more than the case, which has two.

## Results

Not printed yet.
