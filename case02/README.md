# Case model, rev 0.2

`case02.scad` is the model of rev 0.2. Its hinge and its prop passed their tests on small
pieces, and the first print of the whole case started on 2026-11-21. The design is in
`../DESIGN-0.2.md`, and the results of the print go there. Rev 0.1 is in `../case/`.

## Views

The files in `views/` show the whole case with stand-ins for the tablet and the keyboard. They
are for looking at, not for printing. GitHub shows each one in 3D.

| File | Shows |
|---|---|
| `views/stand.stl` | The case as a stand, with the unfolded keyboard in front |
| `views/closed.stl` | The case closed, with the folded keyboard and the tablet inside |
| `views/web-options.png` | The back of the tablet half with each of the four web patterns |

## What to look for

- **Hinge**: two pins and two links. Each half ends in a nose as thick as the half, with a
  2.9 mm pin at the middle of its thickness. A link 8 mm wide and 4.9 mm thick joins the two pins
  in a slot near each edge. The halves start 3.5 mm behind their pins.
- **Noses**: the inner side of each nose is a quarter round. The bed side is a 45° chamfer from
  the outer face to the tip. No surface needs supports.
- **Stop**: in the stand, the flat back of the tablet half lies on the chamfer of the keyboard
  half's nose, over the whole width. The far wall of each slot in the keyboard half meets its
  link at that position, so the tablet half cannot lean back further.
- **Slots**: the end walls of the slots stop the links. The near walls hold the closed halves in
  line. The far wall in the keyboard half is part of the 45° stop.
- **Pins**: four, each 13 mm long with a head, pushed in from the edges of the case. Crush ribs
  hold each pin in the nose beyond its link. The head and its recess have a flat, so a pin goes
  in only in the position where all three ribs hold it. The head stands 1 mm out.
- **Plug**: the tablet half's nose has a gap at the USB-C port. A plug 25 mm long stands about
  10 mm out of the closed case.
- **Prop**: a solid panel, 118 × 100 mm and 3 mm thick, for a sticker or art. Stowed, it lies
  flush in an opening in the back of the tablet half. Its axle is two printed pins, 2.9 mm
  across and 5 mm long, pushed in from the edges of the case, 127.5 mm from the tablet half's pin. Each pin is in a knuckle on the prop that lies
  inside the side wall, because the 3 mm floor is too thin for a pin hole. The axis is 2.7 mm
  above the back face, so the end of the prop swings back as it turns, and the floor is cut
  back for it: a groove 3 mm wide along the axle shows in the back. The prop turns 86°. The
  heads of the axle pins sit 0.6 mm deep in the side walls and stand 0.4 mm out. Two feet, 5 mm
  long, stand out of its edge and go into slots through the floor of the keyboard half. There are slots for
  screen angles of 45°, 52° and 59°. A notch in its edge, 20 mm wide, is for a finger.
- **Click**: a bump on the outer side of each foot, 0.9 mm high, sits in a dimple in the wall of
  the opening and holds the stowed prop. A slit beside each bump makes that side of the foot a
  spring, 1.2 mm thick and 9 mm long. The bump must pass 0.5 mm of wall to come out.
- **Ledges**: 10 mm of floor stays under each long edge of the tablet and 10 mm under its lower
  edge, so the tablet has support on all sides when the prop is out.
- **Web**: the back of the tablet half between the prop's axle and the free edge has holes in a
  pattern of bubbles: 37 round holes, 4 to 21 mm across, with at least 2.2 mm between them. The
  variable `WEB` in the model chooses the pattern: `bubbles`, `circles`, `fleur` or `grid`.
  `views/web-options.png` shows the four. `web_bubbles.py` made the table of bubbles.
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
| `x_turn` with `chk` = 3, 5, 15, 30, 45, 60, 75, 83, 86 | The prop, turned that far out, against the tablet half. At 0.5 it is not empty: that is the click. |
| `x_stowk` | The stowed prop against the keyboard half, case closed |

A pose has two angles: `chk` is the angle between the halves, and `chk_a` is the angle of the
links (`-1` means the stand angle, 97.4°). The path from closed to the stand, as `chk`/`chk_a`:
360/0, 315/0, 270/0, 225/0, 180/0 (the tablet half turns on the links), 150/30, 120/60, 90/90,
83/-1 (the links turn on the keyboard half), 70/-1, 60/-1, 45/-1 (the tablet half goes down to
the stop), then 52/-1 and 59/-1.

All pass (2026-11-21). `x_swing` at 35/-1 and `x_link` at 360/30 are not empty, which shows that
the checks find a collision. `x_link` at 44/98.4 is not empty either: that is the link on its
stop, one degree beyond the stand.

Gaps where parts pass each other: 0.5 mm between the noses at every angle, and between the
tablet half's back and the keyboard half's nose while the links turn; 0.15 mm round a link in its
slot and 0.05 mm at each side of it; 0.05 mm drawn between the two faces of the stop, and
0.02 mm between a link and the far wall of its slot in the keyboard half.

## Print files

| File | Contents | PrusaSlicer estimate |
|---|---|---|
| `print/k_half.stl` | The keyboard half, outer face on the bed | 1 h 57 min, 95 g |
| `print/t_half.stl` | The tablet half, outer face on the bed, with the prop in place | 2 h 2 min, 78 g |
| `print/parts.stl` | Three links, five hinge pins, three axle pins. Two, four and two are needed. | 8 min, 3 g |
| `print/links.stl` | Two links alone, to print again | not sliced |

The estimates are from PrusaSlicer with the converted H2D profile (`../../slicer/`), 0.2 mm
layers, PLA, no supports (2026-11-21). They are not Bambu Studio times, and they do not include
the printer's start sequence. Each plate fits the reach of the right nozzle. PrusaSlicer says
"consider enabling supports" for the tablet half. The cause is not checked; the faces that hang
are the lips over the tablet, which printed clean with no supports in rev 0.1, and the small
arches over the prop's knuckles, which are not tested at full size. Print with no supports.

On the first print some small parts of `parts.stl` came off the bed (`../DESIGN-0.2.md`,
"Results of the print"). Print the small parts with a brim, away from the edges of the plate.

Assembly:

1. Push the feet end of the prop out of the tablet half to free it. Push an axle pin through
   each side wall into the prop's knuckle, flat toward the back face.
2. Put a link in each slot of the keyboard half and push a hinge pin in from each edge, flat
   toward the outer face.
3. Put the other ends of the links in the slots of the tablet half and push in the last two
   hinge pins.

## Not tested before the first print

The first print started on 2026-11-21. `../DESIGN-0.2.md`, section "Results of the print", lists
what to look at first and holds the results.

- No part is checked in Bambu Studio.
- The snap tongue. Its bump ends at the top of the lip, and the chamfer on the tablet half's
  free edge leads it over the bump.
- The hinge with two links, and under the weight of the tablet. It passed its test with one
  link (`../hinge-test-02/README.md`).
- The recess for the heads of the prop's axle pins. The axle itself passed its test
  (`../prop-test-02/README.md`).
- The bubble web.
