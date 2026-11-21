# The hinge: what is known

This file holds the geometry that every hinge for this case must obey, and the hinges that were
drawn or printed, with what each one showed. The decisions for a revision are in its design file.

## What the hinge must do

- **Closed**: the tablet half lies on the pocket side of the keyboard half. Their inner faces
  meet. The tablet's screen faces the keyboard, so it is protected.
- **Stand**: the keyboard half lies on the table with its pocket down. The tablet half rises from
  the hinge at the screen angle (45°), with the screen up and toward the user. The outer faces
  of the two halves then face each other, at 45°.
- Between the two poses the tablet half swings the long way round the hinge: 315°.
- The hinge edge is a short edge of the case (portrait). It is 148.5 mm long.
- The USB-C port is on the tablet's lower edge, which faces the hinge. Its middle is 19.5 mm from
  the corner. A plug about 25 mm long must fit when the case is closed.

## The rule that makes every hinge long

With one pin, the pin's axis must be in the plane where the two inner faces meet (or a little
outside both faces). In the stand, both halves are inside the 45° between their inner planes,
back to back. Near the pin there is no room for both thicknesses inside that angle.

So at any one place along the hinge, only one half can have its full thickness near the pin. The
bodies of the halves must start some distance from the axis. With halves 15.5 mm and 9.7 mm thick
and a 45° screen, that distance is about 26 to 30 mm.

- A steeper screen shortens it: about 21 mm at 60°.
- Thinner halves shorten it.
- The space between the pin and the bodies can hold tapers (both halves, over the whole width) or
  tabs (one half at each place). It cannot be empty of one half and full of the other everywhere.

Formulas, with T_K and T_T the two thicknesses, HG the offset of the axis outside each inner face,
and w the screen angle:

- Tapers that meet face to face: E is the positive root of
  `E² - ((T_K + T_T + 2·HG) / tan w)·E - (T_K + HG)·(T_T + HG) = 0`.
- Tabs, with the tablet half's flat back on a chamfer of size c on the keyboard half:
  `E0 = ((T_T + HG) + (T_K + HG)·cos w) / sin w - c`.

A hinge with two pins and a spine between them avoids the rule, because the tablet half turns
about its own outer edge. Its cost is in the list below.

## Other facts

- The hinge knuckles of the half on the table are the front feet of the stand. They must be at
  both edges of that half. A lip on its free edge, as high as the knuckle radius, is the rear
  foot.
- The pin's axis is 0.25 mm outside each inner face. With the axis exactly in the plane of the
  faces, the closed halves of a test piece touched at the hinge and stood apart at the far end.
- Pin fit on this printer, PLA: a 2.9 mm printed pin in a 3.3 mm hole turns freely, and three
  crush ribs 0.25 mm high in one knuckle hold it firmly. A 3.0 mm pin is too big. A hole that is
  closed at one end, with a 1.6 mm hole through the closed end for a paper clip, keeps the pin in
  and lets it out. A 6 mm pin with the same clearances is not tested.
- A pin 2.9 mm across and 108 mm long came off the bed in printing. Ears one layer thick are in
  the model for it; they are not tested.
- The two halves cannot print in place as one job: laid open they are about 470 mm long, and the
  bed is 325 mm.
- Each half prints with its outer face on the bed. A feature that stands proud of an outer face
  cannot print as part of that half.

## Hinges tried

| Hinge | Where | Result |
|---|---|---|
| One pin, narrow arms 32 mm long | Drawn, in `case/case.scad` (`hinge="arms"`) | The owner found it too extended. |
| Two pins and a spine 26 mm long | Drawn (`hinge="spine"`) | Only 6 mm longer than the halves when closed. But the first pin is outside the keyboard half's outer face, so its lugs are separate parts on dovetail rails, and the hinge stands 6 mm proud. The owner found it bulky. |
| One pin, square tabs | Drawn (`hinge="tabs"`) | No supports. The owner preferred the look of tapers. |
| One pin, tapers of 27° and 18°, knuckles 8 mm | Printed: rev 0.1 (`hinge="bevel"`) | The owner sketched it and liked the asymmetric look. The tapers meet face to face and hold 45° without a prop. But the tapers print on supports, which are hard to remove and leave lines, and the keyboard half's one knuckle was in the middle, so the stand sagged toward a corner. |
| One pin, barrel 22 mm, full-thickness tabs, stop on a 45° chamfer | Drawn: rev 0.2 (`case02/case02.scad`) | No supports. Barrel segments of the keyboard half at both edges. Not printed. The owner wants a more elegant hinge than this. |
| A ratchet in the hinge | Test piece drawn, never printed | Dropped when a prop took over the job of holding the angle. |

## What the owner has said about the look

- "Extended" arms and a "bulky" spine were both disliked.
- A closed profile that comes to a point at the pin, with unequal tapers, was liked.
- A hinge "whose diameter is similar to the thickness of the whole work" was asked for in rev 0.2.
- A prop or brace that sits proud is acceptable as a plain, functional feature.
- The final look is science fiction and 1980s cyberpunk, possibly mixed with plants, in green silk
  PLA (refer to `DESIGN-1.0.md`).
