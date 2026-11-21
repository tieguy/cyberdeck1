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
- **Prop**: a solid panel, 118 × 100 mm and 3 mm thick, for a sticker or art. Stowed, it lies
  flush in an opening in the back of the tablet half. It turns on two cone pivots, 127.5 mm from
  the tablet half's pin; at the pivot, two ears reach the side walls. Two feet, 5 mm long, stand
  out of its edge and go into slots through the floor of the keyboard half. There are slots for
  screen angles of 45°, 52° and 59°. A notch in its edge, 20 mm wide, is for a finger.
- **Click**: a bump on the outer side of each foot, 0.7 mm high, sits in a dimple in the wall of
  the opening and holds the stowed prop. A slit beside each bump makes that side of the foot a
  spring, 1.2 mm thick and 7 mm long. The bump must pass 0.3 mm of wall to come out.
- **Ledges**: 10 mm of floor stays under each long edge of the tablet and 12 mm under its lower
  edge, so the tablet has support on all sides when the prop is out.
- **Web**: the back of the tablet half between the prop's pivot and the free edge is a grid of
  4 mm bars with 15 mm openings.
- **Snap**: a tongue in the lip on the keyboard half's free edge, with a bump that hooks over the
  edge of the tablet half's back.
- **Edges**: the outer edges of both halves are round, with a 1 mm radius: the edges of the inner
  faces, the lip, and the ends of the noses. The vertical corners are round: 4 mm at the free
  end, 3 mm and 2 mm at the noses. An edge on the print bed has a 45° chamfer in place of a
  round: 1.5 mm on the long edges, 1 mm on the corners. The edges of the openings are square.
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
- The snap tongue is not tested. Its bump ends at the top of the lip, and the chamfer on the
  tablet half's free edge leads it over the bump.
- The click that holds the stowed prop is not tested: it can be too weak or too stiff, and the
  bump prints with a gap of 0.3 mm round it, so it can fuse to its dimple.
