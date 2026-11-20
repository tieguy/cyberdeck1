# Design of rev 0.1

Rev 0.1 is the first prototype. Its purpose is to learn whether a case that folds into a stand is
good to use at a cafe table. Part dimensions are in `PARTS.md`.

## Decisions

- The tablet travels inside the case.
- The screen is about 45° up from the table. The owner read this from a phone's level on the stand
  that the owner uses now, and found the level hard to read (2026-11-19). Treat it as approximate.
- The case is a clamshell: one half carries the folded keyboard, the other half carries the
  tablet, and a hinge joins them along a short edge.
- A prop holds the angle of the stand. It sits proud of the case when it is stowed.
- No external battery and no battery holder. The tablet runs on its own battery. The owner reports
  that this battery drains fast when the keyboard is connected, and accepts that for the
  prototype. The owner charges the tablet at home, in the case, through its USB-C port.
- No stylus. The case needs no stylus holder, and the tablet need not come out for handwriting.

## Orientation

Rev 0.1 holds the tablet in portrait. The owner uses the tablet in portrait on the present stand.
The hinge runs along a short edge of the case, the screen is 191 mm tall, and each half is about
200 mm long from the hinge side. A landscape case is an idea for later (refer to
`DESIGN-0.2.md`).

## Stand layout

The keyboard half lies on the table with its pocket down. The tablet half swings the long way
round the hinge and rises at 45°. The outer faces of the two halves
then face each other. The model is in `case/`.

- The keyboard half rests on feet at the front and on a lip along its free edge at the back. When the case is closed, the same lip covers the open side of the tablet holder.
- A bail holds the angle. It is a U-shaped prop that pivots in the side walls of the keyboard
  half. Its cross bar sits in a groove in the back of the tablet half, square to it, as on a
  beach chair. A tap on the
  screen presses the bail down onto its pivots. More grooves give steeper screen angles.
- When the bail is stowed, it lies on the outside of the keyboard half, proud of the case.
- To set up the stand takes two motions: swing the tablet half round, then lift the bail into a
  groove.

The stand is about 170 mm high. Its depth on the table depends on the hinge.

A layout that was considered and not chosen: an A-frame, with the hinge at the top and the two
halves standing on their free edges. At a 45° screen it is about 295 mm deep, its feet can slide apart, and a brace across its feet is longer than a half.

## Hinge

Not decided. The model in `case/` draws two candidates.

Both must do the same thing. When the case is closed, the tablet half lies on the pocket side of
the keyboard half. In the stand, it is on the other side, 45° from the keyboard half's back. Near
the hinge there is no room for the thickness of both halves inside that 45°.

- **Bevel**: one pin, like a door hinge, in the plane where the two halves meet. The owner
  sketched this. Each half tapers to the pin over its whole width, so the closed case comes to a
  point at the hinge. The two tapers together must fill the 45° of the stand. The owner proposed
  22.5° each. The model uses 27° on the keyboard half and 18° on the tablet half: the thicker half
  has the steeper taper, so both tapers end at the same distance from the pin, 30 mm. With 22.5°
  each, the taper of the keyboard half is 37 mm long.
  In the stand, the taper of the tablet half lies on the taper of the keyboard half. That contact
  holds the screen at 45° with no bail; the bail adds stiffness and gives the steeper angles.
  The hinge adds no printed part, and nothing stands proud of the case. Its costs: the closed
  case is 34 mm longer than its halves, the stand is about 235 mm deep on the table, and each
  taper is an overhang on the print bed that needs supports. The owner accepts supports there.
- **Spine**: two pins and a plate about 26 mm long between them, like the spine of a book. The
  plate is 2.4 mm thick, with a barrel 5.5 mm across at each edge. Each pin is a piece of 1.75 mm
  filament. When the case is closed, the spine stands in front of the hinge-side walls. In the
  stand, it lies flat on the back of the keyboard half, and the tablet half rises from its far
  edge. The closed case is 6 mm longer than its halves, and the stand is about 200 mm deep.
  Its cost is parts: the first pin is outside the keyboard half's outer face, and that half
  prints with its outer face on the bed. The lugs for that pin are two separate parts that slide
  onto dovetail rails on the hinge-side wall, with no glue. The hinge stands 6 mm proud of the
  closed case.

A one-pin hinge with square tabs in place of the tapers was also drawn. It needs no supports,
but the owner prefers the look of the tapers.

Another way to make the spine hinge, not chosen for now: print the keyboard half with its pocket
down, on supports, so that the lugs are part of it. The owner has no support filament for PLA
(2026-11-19).

A ratchet in the hinge is not planned: the bail holds the angle. `hinge-test/` is a test piece for
the pin fit and for a ratchet.

## Tablet holder

The tablet stands with the short edge that has the touch buttons down. "Left" and "right" are as
the user sees them.

- The side away from the hinge is open. The tablet slides in and out there. It is the upper side
  in the stand, so the tablet's weight keeps it in.
- The lower edge carries the tablet's weight. The lip in front of it covers 1.5 mm only, because
  the touch buttons are 8 mm from that edge. This lip has a bevel: the owner's finger touches it
  on the way to the buttons.
- The lips on the left and right edges cover 2.5 mm. The bezel there is 6 mm.
- The power button is on the upper edge, which is open.
- The USB-C port is on the lower edge, 13.6 mm from the left corner. A cut-out in the lower wall
  keeps it uncovered, so that the tablet charges while it is in the closed case.
- When the case is closed, a lip on the keyboard half covers the open side, so that the tablet
  cannot slide out.

## Keyboard half

The folded keyboard and the tablet have almost the same footprint, so the two halves of the case
can be the same size. The folded keyboard is 13 mm thick.

## Open questions

- The owner's review of the model in `case/`.
- The choice of hinge.
- For the spine hinge: a catch that keeps each lug on its rail when the case is closed.
- A catch that holds the case shut, and one that holds the stowed bail.
- The screen angle, measured.
- The exact long side of the folded keyboard.
- The results of the hinge test piece: pin fit, tooth pitch, and whether the ratchet is worth
  having.
- Feet that do not slide on a smooth table.
