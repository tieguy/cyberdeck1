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

- **Hinge**: a barrel 22 mm across on a 6 mm pin, over the whole width. The keyboard half has
  three barrel segments, at both edges and in the middle, and the tablet half has two between
  them. One band has no barrel: the USB-C plug
  goes there.
- **Tabs**: each half reaches its barrel segments with tabs of its full thickness. The other half
  has a notch at each tab. No surface slopes over the print bed.
- **Stop**: in the stand, the flat back of the tablet half rests on a 45° chamfer on the keyboard
  half, 4 mm wide, at two places.
- **Prop**: a U-shaped frame, 3 mm thick. Stowed, it lies in a slot in the back of the tablet
  half, flush. It turns on two cone pivots, 150 mm from the hinge. Its two feet go into slots
  through the floor of the keyboard half. There are slots for screen angles of 45°, 52° and 59°.
- **Web**: the back of the tablet half, between the arms of the prop, is a grid of 4 mm bars
  with 15 mm openings.
- **Snap**: a tongue in the lip on the keyboard half's free edge, with a bump that hooks over the
  edge of the tablet half's back.
- **Edges**: 1.5 mm chamfers on the outer edges of both halves.
- **Feet**: in the stand, the keyboard half stands on its own barrel segments at the front, at
  both edges, and on its lip at the back, 11 mm above the table.

| Estimate from the model | Rev 0.2 | Rev 0.1 |
|---|---|---|
| Stand, depth on the table | 239 mm | 233 mm |
| Stand, height | 170 mm | 166 mm |
| Closed case, added in front of the hinge side | 37 mm | 34 mm |
| Supports | None | Under both tapers |

## Checks

Make these views; each must be empty, or a film of no thickness where two faces meet.

| View | Checks |
|---|---|
| `x_swing` with `chk` = 360, 270, 180, 90, 45, 52, 59 | The two halves, at that angle between them |
| `x_prop` with `chk` = 45, 52, 59 | The prop, set up, against both halves |
| `x_stow` | The stowed prop against the tablet half |
| `x_stowk` | The stowed prop against the keyboard half, case closed |

All pass (2026-11-20).

## Not done yet

- No print files. No part is checked in a slicer.
- The prop prints in place in the tablet half, with gaps of 0.4 mm round it and 0.3 mm round
  its cone pivots. This is not tested: the pivots can fuse, or be loose.
- The snap tongue and the 45° stop are not tested.
- Nothing holds the stowed prop in its slot.
- The chamfers are on the long outer edges only. The corners are square.
