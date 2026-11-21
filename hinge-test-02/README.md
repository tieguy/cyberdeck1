# Hinge test piece, rev 0.2

A slice of the real case at one edge, 30 mm wide, for the two-pin link hinge. The shapes come
from `../case02/case02.scad`.

| File | Contents |
|---|---|
| `hinge_test.scad` | The model. `tpart="assembly"` shows the piece put together. |
| `hinge_test_plate.stl` | The print plate, 97 × 70 mm |

## The plate

- The keyboard-half piece and the tablet-half piece, each with its outer face on the bed.
- Three links, 4.8, 4.9 and 5.0 mm thick, with one, two and three small holes as marks. The
  slot is 5.0 mm wide. One link is needed.
- Three pins. Two are needed.

No part needs supports. The plate is not checked in a slicer.

## How to put it together

1. Put a link in the slot of the keyboard-half piece. Push a pin in from the edge, through the
   link, with the flat of its head toward the outer face (the face that was on the bed). The
   recess lets the head in only in that position.
2. Put the other end of the link in the slot of the tablet-half piece, and push the second pin in.

## What to look for, and what to report

1. **Pins**: does the head go into its recess in one position only? Do the ribs hold the pin in
   that position? Can you pull it out by its head, which stands 1 mm out?
2. **Links**: try each of the three links. Which thickness gives the feel that you want: a
   little friction, and no play from side to side? Are the 3.1 mm holes free on the pins?
3. **Closed**: put the inner faces together. How far can one piece slide along the other? It
   was 1 mm at most on the first plate; the snap of the case needs less.
4. **Stop**: with the keyboard-half piece flat on the table, inner face down, press the
   tablet-half piece back onto the chamfer. Is the gap toward the tip of the nose gone?
5. **Swing**: is it still smooth with the link that you chose?

The piece has one link, so it twists more than the case, which has two.

## Results

### Second plate

Not printed yet. It has the changes that are listed at the end of the first plate's results.

### First plate

Printed 2026-11-21. That plate had links 4.6 mm thick with 3.3 mm holes, a round recess for the
pin head, and ribs at other angles. Its items were: print, pins, link, closed, swing, stop.

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

Changes made in the model for the second plate:

- A recess for the pin head with a flat, so that a pin goes in only in the position where all
  three ribs hold it, and the recess stays clear of the chamfer. A head that stands 1 mm out.
- Links in three thicknesses (4.8, 4.9, 5.0 mm) with pin holes of 3.1 mm, for the owner to choose.
- 0.1 mm less clearance between a link and the end walls of its slot, and a longer hook on the
  snap.
