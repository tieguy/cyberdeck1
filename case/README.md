# Case model, rev 0.1

`case.scad` is the first geometry of the case, for review. It is not ready to print. The design is
in `../DESIGN-0.1.md`.

## Views

The files in `views/` show the whole case with stand-ins for the tablet and the keyboard. They
are for looking at, not for printing. GitHub shows each one in 3D.

The model draws two hinges, for comparison.

| File | Shows |
|---|---|
| `views/portrait_tabs_stand.stl` | Tabs hinge: the case as a stand, with the unfolded keyboard in front |
| `views/portrait_tabs_closed.stl` | Tabs hinge: the case closed, with the folded keyboard and the tablet inside |
| `views/portrait_spine_stand.stl` | Spine hinge: the case as a stand |
| `views/portrait_spine_closed.stl` | Spine hinge: the case closed |
| `views/lug.stl` | Spine hinge: one of the slide-on lugs, alone |

In the stand views, the user sits on the keyboard's side and the table is at z = 0.

## What to look for

- **K half**: the tray for the folded keyboard. In the stand it lies with its pocket toward the
  table. It rests on feet at the front and on a lip along its free edge at the back.
- **T half**: the tablet holder. It rises at 45°. The tablet's lower edge rests on the hinge
  side. The upper side is open.
- **Tabs hinge**: one pin, like a door hinge. Each half has two tabs that reach the pin, where
  the other half has notches. The tabs fill the whole width, and they are 32 mm long.
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

| Estimate from the model | Tabs | Spine |
|---|---|---|
| Stand, depth on the table | 234 mm | 202 mm |
| Closed case, added in front of the hinge side | 37 mm | 6 mm |
| Hinge parts proud of the K half's outer face, closed | None | 6 mm |
| Printed parts in the hinge | None extra: the tabs are part of the halves | Spine and two lugs |
| Pins | One line | Two lines |

`case.scad` can also draw a landscape case (`orient="landscape"`). It is not part of rev 0.1;
refer to `../DESIGN-0.1.md`.

## Make the views again

```
for h in tabs spine; do for v in stand closed; do
  openscad-nightly -D "hinge=\"$h\"" -D "view=\"$v\"" -o views/portrait_${h}_$v.stl case.scad
done; done
openscad-nightly -D 'view="k_lug"' -o views/lug.stl case.scad
```

## Not done yet

- No printable part files. `case.scad` can draw each part alone (`view="k_half"`, `"t_half"`,
  `"bail"`, `"spine"`, `"k_lug"`), but they are not checked for printing. The lips over the tablet overhang by up to
  2.5 mm.
- Nothing holds the case shut, and nothing holds the bail when it is stowed.
- Spine hinge: nothing but friction keeps a lug on its rail when the case is closed.
- Tabs hinge: the tabs are solid blocks. They are not hollowed.
- A USB-C plug possibly does not fit while the stand is set
  up: the port faces the back of the K half at a short distance. It fits when the case is closed.
- The hinge pins are not drawn.
- The folded keyboard's long side is an estimate (196.3 mm).
- The model was checked for collisions in the closed pose and in the stand pose only.
