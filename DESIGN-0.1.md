# Design of rev 0.1

Rev 0.1 is the first prototype. Its purpose is to learn whether an A-frame stand is good to use at
a cafe table. Part dimensions are in `PARTS.md`.

## Decisions

- The tablet travels inside the case.
- The tablet is in landscape when it is the screen. The hinge runs along a long edge of the case.
- In the stand, the tablet's long edge near the power button is up.
- The stand is an A-frame with a one-pin hinge on arms. A brace between the legs makes it a
  rigid triangle.
- The legs are 40° apart, so the tablet leans back 20°. This is a working figure, to confirm with
  the hinge test piece.
- No external battery and no battery holder. The tablet runs on its own battery. The owner reports
  that this battery drains fast when the keyboard is connected, and accepts that for the
  prototype. The owner charges the tablet at home, in the case, through its USB-C port.
- No stylus. The case needs no stylus holder, and the tablet need not come out for handwriting.

## Stand layout

The case is a clamshell: one half carries the folded keyboard, the other half carries the tablet,
and one hinge joins them along a long edge. To make the stand, the keyboard half swings about
320° round the hinge. The hinge is then at the top and the two halves stand on their free edges
as an A-frame.

- A brace holds the angle. It is a flap that is hinged near the foot of the keyboard half, on the
  outer face. In the stand, the outer faces of the two halves face each other, so the flap swings
  across and hooks into the tablet half. The stand is then a closed triangle. The brace resists
  the weight, which pushes the feet apart, and the taps on the touch buttons, which push the
  tablet leg toward the other leg. At the feet, the legs are about 123 mm apart (estimate, from
  arms of 37 mm and halves 143 mm deep).
- When the brace is stowed, it sits proud of the outer face. No recess is necessary.
- To set up the stand takes two motions: swing the half round, then hook the brace.
- The open side of the tablet holder is the hinge side. In the stand, that side is at the top: the
  tablet lifts out upward, and its weight keeps it in.

A layout that was considered and not chosen for rev 0.1: the keyboard half lies flat on the table
behind the tablet half. The open side of the tablet holder would then be at the bottom, where the
tablet's weight rests.

## Hinge

With one pin, the two halves end up inside the angle between the legs, outer face to outer face.
Their thickness limits how close the legs can come. To reach a small angle, the bodies of the
halves must start some distance from the pin, on arms. For halves about 9 mm and 17 mm thick
(estimates: tablet and folded keyboard, each with walls) and legs 40° apart, that distance is
about 37 mm. A hinge with two pins and a spine between them needs no such arms, but it has two
joints to hold.

Rev 0.1 uses the one-pin hinge, because it has one joint. The cost is a case about 37 mm deeper.
The slot between the pin and the two halves can serve as a carry handle.

The brace carries the load, so the hinge can be a plain pin hinge. A ratchet in the hinge is
optional: it would click toward the stand position and lock against the return until a tab
releases it. `hinge-test/` is a test piece for the pin fit and for this ratchet. Its results
decide whether rev 0.1 has the ratchet.

## Tablet holder

"Top", "bottom", "left" and "right" are for the tablet in landscape with the touch buttons on the
right, as in `PARTS.md`.

- The top side, which is the hinge side, is open. The tablet slides in and out there.
- A lip on the bottom or left edge can cover up to 6 mm.
- A lip on the right short edge covers 1 to 2 mm only, because the touch buttons are 8 mm from
  that edge. Bevel this lip: the owner's finger touches it on the way to the buttons.
- The power button on the left short edge stays reachable.
- The USB-C port stays uncovered, so that the tablet charges while it is in the case.
- When the case is closed, the open side faces the gap by the pin. A lip on the keyboard half
  covers that side, so that the tablet cannot slide out.

## Keyboard half

The folded keyboard and the tablet have almost the same footprint, so the two halves of the case
can be the same size. The folded keyboard is 13 mm thick.

## Open questions

- Arm length. About 37 mm is an estimate from guessed half thicknesses. Compute it again when the
  two halves are designed.
- The exact long side of the folded keyboard.
- The results of the hinge test piece: pin fit, tooth pitch, and whether the ratchet is worth
  having.
- The brace: its hinge, its hook, and where it meets the tablet half.
- Feet that do not slide on a smooth table.
