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

Printed 2026-11-21, on the plate in `../test-plate-02/`. The numbers are the items of "What to
look for".

1. **Print**: the chamfers and the slanted slot wall are clean, with one very small string. The
   recess for the pin head in the tablet-half piece breaks into the chamfer under the nose. This
   is in the model: the round on the end of the nose leaves 2.4 mm from the pin to the chamfer,
   and the recess has a radius of 2.7 mm.
2. **Pins**: a pin holds well in one position and falls out in another. The pin has a flat, and
   the hole has three ribs. With the flat at a rib, the pin is loose. Nothing shows the correct
   position. The head stands about 0.5 mm out, which is hard to get out with a fingernail, but
   possible.
3. **Link**: it turns freely. It has more play from side to side than the owner wants; the owner
   asked for a little friction between the link and the slot walls. The link is 4.6 mm thick in a
   5.0 mm slot.
4. **Closed**: the pieces slide 1 mm at most. The gap between the inner faces is 0.4 to 0.5 mm,
   as drawn. The snap of the case has a hook of 1.2 mm, so 1 mm of slide is too much.
5. **Swing**: smooth, and the owner found the motion obvious.
6. **Stop**: firm when it is settled, with no flex. But the tablet-half piece does not lie flat
   on the chamfer: there is a gap toward the tip of the nose. Possible cause, not confirmed:
   the play of the link at its two pins (2.9 mm pins in 3.3 mm holes) lets the piece lean back
   before the link pulls. The piece does not stay on the stop when it is let go; it is 20 mm
   long, and its weight is in front of the stop. The case has the prop for this.

Changes that follow, for the model and the next test plate:

- A recess for the pin head with a flat, so that a pin goes in only in the position where all
  three ribs hold it, and the recess stays clear of the chamfer. A head that stands 1 mm out.
- Links in three thicknesses (4.8, 4.9, 5.0 mm) with pin holes of 3.1 mm, for the owner to choose.
- 0.1 mm less clearance between a link and the end walls of its slot, and a longer hook on the
  snap.
