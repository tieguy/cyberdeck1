# Design of rev 0.1

Rev 0.1 is the first prototype. Its purpose is to learn whether a case that folds into a stand is
good to use at a cafe table. Part dimensions are in `PARTS.md`.

## Decisions

- The tablet travels inside the case.
- The screen is about 45° up from the table. The owner read this from a phone's level on the stand
  that the owner uses now, and found the level hard to read (2026-11-19). Treat it as approximate.
- The case is a clamshell: one half carries the folded keyboard, the other half carries the
  tablet, and a one-pin hinge joins them along a long edge.
- A brace holds the angle of the stand. It sits proud of the case when it is stowed.
- No external battery and no battery holder. The tablet runs on its own battery. The owner reports
  that this battery drains fast when the keyboard is connected, and accepts that for the
  prototype. The owner charges the tablet at home, in the case, through its USB-C port.
- No stylus. The case needs no stylus holder, and the tablet need not come out for handwriting.

## Two prototypes

Rev 0.1 is two cases, one for each screen orientation, so that the owner can compare them in use.
The owner uses the tablet in portrait on the present stand and may prefer it.

| | Landscape prototype | Portrait prototype |
|---|---|---|
| Hinge runs along | A long edge of the case | A short edge of the case |
| Screen height | 138 mm | 191 mm |
| Depth of a half, from the hinge side | About 143 mm | About 196 mm |

The two halves have the same footprint in both prototypes, because the folded keyboard and the
tablet have almost the same footprint. The prototypes differ in the edge that has the hinge and in
the lips of the tablet holder.

## Not decided: stand layout

Two layouts are candidates. In each, the keyboard half swings the long way round the hinge, so
that the outer faces of the two halves face each other, and a brace sets the angle. The figures
are estimates for the landscape prototype. They assume halves about 9 mm and 17 mm thick and
143 mm deep. For the portrait prototype, the halves are about 196 mm deep: the A-frame is then
about 295 mm deep on the table and the flat base about 225 mm.

| | A-frame | Flat base |
|---|---|---|
| Shape | The hinge is at the top. The two halves stand on their free edges. | The keyboard half lies flat on the table. The tablet half rises from the hinge at 45°. |
| Angle between the halves | 90° | 45° |
| Arm length (refer to Hinge) | About 12 mm | About 31 mm |
| Depth on the table | About 220 mm | About 175 mm |
| Brace | Across the feet it is about 220 mm long. That is longer than a half, so it cannot stow flat as one flap. A shorter brace must sit higher. | A prop about 85 mm long between the base and the back of the tablet half. A tap on the screen presses the prop down. |
| Sliding | The feet can slide apart or across the table. | The base lies flat. Nothing spreads. |
| Tablet's weight | Rests on the edge away from the hinge | Rests on the hinge edge |

## Hinge

With one pin, the two halves end up inside the angle between them, outer face to outer face.
Their thickness limits how small that angle can be. To reach a small angle, the bodies of the
halves must start some distance from the pin, on arms. A hinge with two pins and a spine between
them needs no such arms, but it has two joints to hold. Rev 0.1 uses the one-pin hinge, because
it has one joint.

The brace carries the load, so the hinge can be a plain pin hinge. A ratchet in the hinge is
optional: it would click toward the stand position and lock against the return until a tab
releases it. `hinge-test/` is a test piece for the pin fit and for this ratchet. Its stop is at
40° between the halves, which is near the flat-base angle.

## Tablet holder

"Top", "bottom", "left" and "right" are for the tablet in landscape with the touch buttons on the
right, as in `PARTS.md`.

- One side is open. The tablet slides in and out there. It must be the upper side in the stand,
  so that the tablet's weight keeps it in. In the landscape prototype it is a long side. In the
  portrait prototype it is a short side. Which of the two depends on the stand layout.
- A lip on the bottom or left edge can cover up to 6 mm.
- A lip on the right short edge covers 1 to 2 mm only, because the touch buttons are 8 mm from
  that edge. Bevel this lip: the owner's finger touches it on the way to the buttons.
- The power button on the left short edge stays reachable.
- The USB-C port stays uncovered, so that the tablet charges while it is in the case.
- When the case is closed, a lip on the keyboard half covers the open side, so that the tablet
  cannot slide out.
- In the landscape prototype, the tablet's long edge near the power button is up.
- In the portrait prototype, the short edge with the touch buttons is down. The tablet's weight
  rests on that edge, and the lip in front of it covers 1 to 2 mm only.

## Keyboard half

The folded keyboard and the tablet have almost the same footprint, so the two halves of the case
can be the same size. The folded keyboard is 13 mm thick.

## Open questions

- The stand layout (refer to the section above).
- The screen angle, measured.
- Arm length. Compute it again when the two halves are designed.
- The exact long side of the folded keyboard.
- The results of the hinge test piece: pin fit, tooth pitch, and whether the ratchet is worth
  having.
- The brace: its hinge, its hook, and where it meets the other half.
- Feet that do not slide on a smooth table.
