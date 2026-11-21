# Case model, rev 0.2

`case02.scad` is the first geometry of rev 0.2, for review. It is not ready to print. The design
is in `../DESIGN-0.2.md`. Rev 0.1 is in `../case/`.

## Views

The files in `views/` show the whole case with stand-ins for the tablet and the keyboard. They
are for looking at, not for printing. GitHub shows each one in 3D.

| File | Shows |
|---|---|
| `views/stand.stl` | The case as a stand, with the unfolded keyboard in front |
| `views/closed.stl` | The case closed, with the folded keyboard and the tablet inside |

## What to look for

- **Hinge**: two pins and two links. Each half ends in a nose as thick as the half, with a
  2.9 mm pin at the middle of its thickness. A link 8 mm wide joins the two pins in a slot near
  each edge. The halves start 3.5 mm behind their pins.
- **Noses**: the inner side of each nose is a quarter round. The bed side is a 45° chamfer from
  the outer face to the tip. No surface needs supports.
- **Stop**: in the stand, the flat back of the tablet half lies on the chamfer of the keyboard
  half's nose, over the whole width. The links hold it there in tension.
- **Slots**: the end walls of the slots stop the links. They hold the closed halves in line, and
  they hold the links in the stand when the screen is steeper than 45°.
- **Pins**: four, each 13 mm long with a head, pushed in from the edges of the case. Crush ribs
  hold each pin in the nose beyond its link.
- **Plug**: the tablet half's nose has a gap at the USB-C port. A plug 25 mm long stands about
  10 mm out of the closed case.
- **Prop**: a U-shaped frame, 3 mm thick. Stowed, it lies in a slot in the back of the tablet
  half, flush. It turns on two cone pivots, 150 mm from the hinge. Its two feet go into slots
  through the floor of the keyboard half. There are slots for screen angles of 45°, 52° and 59°.
- **Web**: the back of the tablet half, between the arms of the prop, is a grid of 4 mm bars
  with 15 mm openings.
- **Snap**: a tongue in the lip on the keyboard half's free edge, with a bump that hooks over the
  edge of the tablet half's back.
- **Edges**: 1.5 mm chamfers on the outer edges of both halves.
- **Feet**: in the stand, the keyboard half lies on the round of its nose at the front, over the
  whole width, and on its lip at the back. The lip is 11 mm high, so the keyboard half slopes
  3.1° and the screen is at 48° from the table, not 45°.

| Estimate from the model | Rev 0.2 | Rev 0.1 |
|---|---|---|
| Stand, depth on the table | 224 mm | 233 mm |
| Stand, height | 163 mm | 166 mm |
| Closed case, added in front of the hinge side | 11 mm | 34 mm |
| Supports | None | Under both tapers |

The closed case is 213 mm long.

## Checks

Make these views; each must be empty, or a film of no thickness where two faces meet.

| View | Checks |
|---|---|
| `x_swing` on the path below | The two halves |
| `x_link` on the path below | The links against both halves |
| `x_prop` with `chk` = 45, 52, 59 | The prop, set up, against both halves |
| `x_stow` | The stowed prop against the tablet half |
| `x_stowk` | The stowed prop against the keyboard half, case closed |

A pose has two angles: `chk` is the angle between the halves, and `chk_a` is the angle of the
links (`-1` means the stand angle, 97.4°). The path from closed to the stand, as `chk`/`chk_a`:
360/0, 315/0, 270/0, 225/0, 180/0 (the tablet half turns on the links), 150/30, 120/60, 100/80,
83/-1 (the links turn on the keyboard half), 70/-1, 60/-1, 45/-1 (the tablet half goes down to
the stop), then 52/-1 and 59/-1.

All pass (2026-11-20). `x_swing` at 35/-1 and `x_link` at 360/30 are not empty, which shows that
the checks find a collision.

Gaps where parts pass each other: 0.5 mm between the noses at every angle, and between the
tablet half's back and the keyboard half's nose while the links turn; 0.25 mm round a link in its
slot and 0.2 mm at each side of it; 0.05 mm drawn between the two faces of the stop.

## Not done yet

- No print files. No part is checked in a slicer.
- The prop prints in place in the tablet half, with gaps of 0.4 mm round it and 0.3 mm round
  its cone pivots. This is not tested: the pivots can fuse, or be loose.
- The hinge is not tested: the 13 mm pins and their crush ribs, the links, the play of the stop
  (each pin has 0.2 mm of clearance, and the stop works on a lever of about 8 mm), and whether
  the slots hold the closed halves in line well enough for the snap.
- The snap tongue is not tested. Its bump stands 1.2 mm above the lip, so in the stand the bump
  touches the table before the lip does.
- Nothing holds the stowed prop in its slot.
- The chamfers are on the long outer edges only. The corners are square.
