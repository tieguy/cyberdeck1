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
| `views/lug.stl` | One of the slide-on lugs, alone |

In the stand views, the user sits on the keyboard's side and the table is at z = 0.

## What to look for

- **K half**: the tray for the folded keyboard. In the stand it lies with its pocket toward the
  table. It rests on feet at the front and on a lip along its free edge at the back.
- **T half**: the tablet holder. It rises at 45°. The tablet's lower edge rests on the hinge
  side. The upper side is open.
- **Spine hinge**: a plate 2.4 mm thick and about 26 mm long, with a barrel 5.5 mm across at
  each edge. The pins are pieces of 1.75 mm filament. When the case is closed, it stands
  in front of the hinge-side walls. In the stand, it lies flat on the back of the K half, and the
  T half rises from its far edge. The weight of the T half presses it down.
- **Lugs**: two small separate parts that hold the spine's first pin. Each one slides onto a
  dovetail rail on the K half's hinge-side wall, from the outer-face side, and a shoulder hooks
  over the edge of the outer face. No glue.
- **Bail**: a U-shaped prop. It pivots in the side walls of the K half, and its cross bar sits in
  a groove in the back of the T half, as on a beach chair. The other grooves give steeper screen
  angles. When it is stowed, it lies on the outside of the K half.
- **Lip on the K half's free edge**: when the case is closed, it covers the open side of the
  tablet holder.
- **Cut-out**: for the USB-C port, on the tablet's lower edge.

| Estimate from the model | |
|---|---|
| Stand, depth on the table | 202 mm |
| Stand, height | 173 mm |
| Closed case, added in front of the hinge side | 6 mm |
| Hinge parts proud of the K half's outer face, closed | 6 mm |

`case.scad` can also draw a landscape case (`orient="landscape"`) and a hinge with one pin and
arms (`hinge="arms"`). Neither is part of rev 0.1; refer to `../DESIGN-0.1.md`.

## Make the views again

```
for v in stand closed; do
  openscad-nightly -D "view=\"$v\"" -o views/portrait_$v.stl case.scad
done
openscad-nightly -D 'view="k_lug"' -o views/lug.stl case.scad
```

## Not done yet

- No printable part files. `case.scad` can draw each part alone (`view="k_half"`, `"t_half"`,
  `"bail"`, `"spine"`, `"k_lug"`), but they are not checked for printing. The lips over the tablet overhang by up to
  2.5 mm.
- Nothing holds the case shut, and nothing holds the bail when it is stowed.
- Nothing but friction keeps a lug on its rail when the case is closed.
- A USB-C plug possibly does not fit while the stand is set
  up: the port faces the back of the K half at a short distance. It fits when the case is closed.
- The hinge pins are not drawn.
- The folded keyboard's long side is an estimate (196.3 mm).
- The model was checked for collisions in the closed pose and in the stand pose only.
