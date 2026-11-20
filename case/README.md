# Case model, rev 0.1

`case.scad` is the first geometry of the case, for review. It is not ready to print. The design is
in `../DESIGN-0.1.md`.

## Views

The files in `views/` show the whole case with stand-ins for the tablet and the keyboard. They
are for looking at, not for printing. GitHub shows each one in 3D.

| File | Shows |
|---|---|
| `views/portrait_stand.stl` | The case as a stand, with the unfolded keyboard in front |
| `views/portrait_closed.stl` | The case closed, with the folded keyboard and the tablet inside |

In the stand views, the user sits on the keyboard's side and the table is at z = 0.

## What to look for

- **K half**: the tray for the folded keyboard. In the stand it lies with its pocket toward the
  table. It rests on feet at the front and on a lip along its free edge at the back.
- **T half**: the tablet holder. It rises at 45°. The tablet's lower edge rests on the hinge
  side. The upper side is open.
- **Hinge**: one pin, like a door hinge, with three knuckles. Each half tapers to the pin over
  a length of 30 mm: the K half at 27° and the T half at 18°. Closed, the case comes to a point
  at the hinge. In the stand, the taper of the T half lies on the taper of the K half, and that
  contact holds the screen at 45° even with the bail down. A slot through the T half's taper
  leaves room for a USB-C plug.
- **Pin**: 2.9 mm across and 114 mm long, printed. Its hole is closed at one end. Three ribs in
  the K half's knuckle grip it. A 1.6 mm hole through the closed end lets a paper clip push it
  out.
- **Bail**: a U-shaped prop. It pivots in the side walls of the K half, and its cross bar sits in
  a groove in the back of the T half, as on a beach chair. The other grooves give steeper screen
  angles. When it is stowed, it lies on the outside of the K half.
- **Lip on the K half's free edge**: when the case is closed, it covers the open side of the
  tablet holder.
- **Cut-out**: for the USB-C port, on the tablet's lower edge.

| Estimate from the model | |
|---|---|
| Stand, depth on the table | 233 mm |
| Stand, height | 166 mm |
| Closed case, added in front of the hinge side | 34 mm |

`case.scad` can also draw a landscape case (`orient="landscape"`) and three other hinges
(`hinge="spine"`, `"tabs"`, `"arms"`). They are not part of rev 0.1; refer to `../DESIGN-0.1.md`.

## Make the views again

```
for v in stand closed; do
  openscad-nightly -D "view=\"$v\"" -o views/portrait_$v.stl case.scad
done
```

## Not done yet

- No printable part files. `case.scad` can draw each part alone (`view="k_half"`, `"t_half"`,
  `"bail"`, `"pin"`), but they are not checked for printing. The lips over the tablet overhang by up to
  2.5 mm.
- Nothing holds the case shut, and nothing holds the bail when it is stowed.
- The tapers are solid, and they need supports on the print bed.
- The hinge test piece shows that a 2.9 mm pin fits. Whether the ribs hold it in place is not
  reported yet.
- The folded keyboard's long side is an estimate (196.3 mm).
- The model was checked for collisions in the closed pose and in the stand pose only. To run the
  check, make the views `x_stand`, `x_closed` and `x_bail`: each must be empty, or a film of no
  thickness where two faces touch.
