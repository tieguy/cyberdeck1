# Case model, rev 0.1

`case.scad` is the first geometry of the case, for review. It is not ready to print. The design is
in `../DESIGN-0.1.md`.

## Views

The files in `views/` show the whole case with stand-ins for the tablet and the keyboard. They
are for looking at, not for printing. GitHub shows each one in 3D.

| File | Shows |
|---|---|
| `views/landscape_stand.stl` | Landscape prototype as a stand, with the unfolded keyboard in front |
| `views/landscape_closed.stl` | Landscape prototype closed, with the folded keyboard and the tablet inside |
| `views/portrait_stand.stl` | Portrait prototype as a stand |
| `views/portrait_closed.stl` | Portrait prototype closed |

In the stand views, the user sits on the keyboard's side and the table is at z = 0.

## What to look for

- **K half**: the tray for the folded keyboard. In the stand it lies with its pocket toward the
  table. It rests on the hinge knuckles at the front and on a lip along its free edge at the back.
- **T half**: the tablet holder. It rises from the hinge at 45°. The tablet's lower edge rests on
  the hinge side. The upper side is open.
- **Arms**: the bodies of the halves start 32 mm from the pin.
- **Bail**: a U-shaped prop. It pivots in the side walls of the K half, and its cross bar sits in
  a groove in the back of the T half. The other grooves give steeper screen angles. When it is
  stowed, it lies on the outside of the K half.
- **Lip on the K half's free edge**: when the case is closed, it covers the open side of the
  tablet holder.
- **Cut-outs**: for the USB-C port and, in landscape, for the power button.

## Make the views again

```
for o in landscape portrait; do for v in stand closed; do
  openscad-nightly -D "orient=\"$o\"" -D "view=\"$v\"" -o views/${o}_$v.stl case.scad
done; done
```

## Not done yet

- No printable part files. `case.scad` can draw each part alone (`view="k_half"`, `"t_half"`,
  `"bail"`), but they are not checked for printing. The lips over the tablet overhang by up to
  2.5 mm.
- Nothing holds the case shut, and nothing holds the bail when it is stowed.
- The hinge pins are not drawn.
- The folded keyboard's long side is an estimate (196.3 mm).
- The model was checked for collisions in the closed pose and in the stand pose only.
