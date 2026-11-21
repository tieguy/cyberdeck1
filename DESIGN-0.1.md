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

- The keyboard half rests on the hinge knuckles at the front and on a lip along its free edge at
  the back. When the case is closed, the same lip covers the open side of the tablet holder.
- A bail holds the angle. It is a U-shaped prop that pivots in the side walls of the keyboard
  half. Its cross bar sits in a groove in the back of the tablet half, square to it, as on a
  beach chair. A tap on the
  screen presses the bail down onto its pivots. More grooves give steeper screen angles.
- When the bail is stowed, it lies on the outside of the keyboard half, proud of the case.
- To set up the stand takes two motions: swing the tablet half round, then lift the bail into a
  groove.

The stand is about 165 mm high and 235 mm deep on the table.

A layout that was considered and not chosen: an A-frame, with the hinge at the top and the two
halves standing on their free edges. At a 45° screen it is about 295 mm deep, its feet can slide apart, and a brace across its feet is longer than a half.

## Hinge

The hinge has one pin, like a door hinge, in the plane where the two halves meet. The owner
sketched it.

When the case is closed, the tablet half lies on the pocket side of the keyboard half. In the
stand, it is on the other side, 45° from the keyboard half's back. Near the pin there is no room
for the full thickness of both halves inside that 45°. So each half tapers to the pin over its
whole width, and the closed case comes to a point at the hinge.

- The two tapers together fill the 45°. The keyboard half tapers at 27° and the tablet half at
  18°: the thicker half has the steeper taper, so both tapers end 30 mm from the pin. The owner
  prefers this to equal tapers of 22.5°, which make the keyboard half's taper 37 mm long.
- In the stand, the taper of the tablet half lies on the taper of the keyboard half. That contact
  holds the screen at 45° with no bail. The bail adds stiffness and gives the steeper angles.
- The hinge adds no printed part except the pin, and nothing stands proud of the case.
- Its costs: the closed case is 34 mm longer than its halves, the stand is about 235 mm deep on
  the table, and each taper is an overhang on the print bed that needs supports. The owner
  accepts supports there.
- The pin's axis is 0.25 mm outside the inner face of each half, so the closed halves are 0.5 mm
  apart at the hinge. On the first test piece the axis was in the plane of the inner faces, and
  the closed faces touched near the hinge and stood up to 1 mm apart at the far end. The probable
  cause is that the knuckles sag a little on their supports; this is not confirmed.
- The hinge has three knuckles, 8 mm across, over 110 mm of the width. They stop short of the
  corner with the USB-C port,
  and a slot through the tablet half's taper leaves room for the plug.

### Pin

The pin is 2.9 mm across and 108 mm long, printed with a flat side on the bed. On the test piece
a 2.9 mm pin fits well and a 3.0 mm pin is too big (2026-11-19). It goes in from the
side of the USB-C port.

- Its hole is closed at the far end, so the pin cannot leave that way.
- Three crush ribs in the keyboard half's knuckle grip the pin. The tablet half's two knuckles
  turn on it, in holes of 3.3 mm. On the test piece the ribs hold the pin firmly and the outer
  knuckles turn freely.
- A 1.6 mm hole through the closed end lets a paper clip push the pin out. This works on the test
  piece.
- A rod of another material must also be about 2.9 mm. A 3 mm rod is probably too big.

### Hinges that were considered and not chosen

- A spine: two pins and a plate about 26 mm long between them, like the spine of a book. The
  closed case is only 6 mm longer than its halves. But the first pin is outside the keyboard
  half's outer face, so its lugs are separate parts that slide onto dovetail rails, and the hinge
  stands 6 mm proud of the closed case.
- One pin with square tabs, or with narrow arms, in place of the tapers. They need no supports.
  The owner prefers the look of the tapers.
- A ratchet in the hinge. The tapers and the bail hold the angle.

`case/case.scad` can still draw the spine, the tabs and the arms.

## Tablet holder

The tablet stands with the short edge that has the touch buttons down. "Left" and "right" are as
the user sees them.

- The side away from the hinge is open. The tablet slides in and out there. It is the upper side
  in the stand, so the tablet's weight keeps it in.
- The lower edge carries the tablet's weight. The lip in front of it covers 2.5 mm. The tablet's
  rounded edge takes most of that, and the touch buttons are 8 mm from the edge. The lip has a
  square edge with no bevel: the owner finds enough room between it and the buttons.
- The lips on the left and right edges cover 2.5 mm. The bezel there is 6 mm.
- The power button is on the upper edge, which is open.
- The USB-C port is on the lower edge, with its middle about 19.5 mm from the left corner. A
  cut-out 22 mm wide in the lower wall keeps it uncovered, so that the tablet charges while it is in the closed case.
- When the case is closed, a lip on the keyboard half covers the open side, so that the tablet
  cannot slide out.

## Keyboard half

The folded keyboard and the tablet have almost the same footprint, so the two halves of the case
can be the same size. The folded keyboard is 13 mm thick.

## Results of the first print

Printed and assembled 2026-11-20. The owner's first notes:

- A lip over the tablet still prints as strings, with no bevel on it. The bevel was not the
  cause, or not the only cause.
- The stand is not stable. When the owner presses the screen, the tablet half sags toward the
  corner with the slot for the USB-C plug. Probable cause, not confirmed: the hinge has no
  knuckle on that side of the slot, and the slot cuts the tablet half's taper, so that corner of
  the tablet half is not held to the pin.
- The bail does very little. Probable cause, not confirmed: the tapers already hold the angle,
  and the bail's cross bar sits in its groove with clearance, on thin arms and short stubs, so it
  takes no load until the tablet half has already moved.

## Open questions

- The owner's review of the model in `case/`.
- Whether the closed halves lie parallel. A reprint of the test piece shows it.
- The supports leave visible lines on the tapers (refer to `hinge-test/README.md`). Rev 0.1
  accepts this. Ways to a smooth taper are in `DESIGN-1.0.md`.
- Whether the lower lip prints clean now that it has no bevel. The side lips print clean with no
  supports (fit test, 2026-11-20).
- Stiffness of the hollow halves. The solid test piece does not show it.
- A catch that holds the case shut, and one that holds the stowed bail.
- The screen angle, measured.
- The exact long side of the folded keyboard.
- Feet that do not slide on a smooth table.
