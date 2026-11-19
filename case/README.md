# Case model, rev 0.1

`case.scad` is the first geometry of the case, for review. It is not ready to print. The design is
in `../DESIGN-0.1.md`.

## Views

The files in `views/` show the whole case with stand-ins for the tablet and the keyboard. They
are for looking at, not for printing. GitHub shows each one in 3D.

The model draws two hinges, for comparison. Each file name is `<orientation>_<hinge>_<pose>.stl`.

| Part of the name | Values |
|---|---|
| Orientation | `landscape`, `portrait`: one for each prototype |
| Hinge | `spine`: two pins and a spine, like a book. `arms`: one pin, with the halves on arms 32 mm long. |
| Pose | `stand`: set up, with the unfolded keyboard in front. `closed`: shut, with the folded keyboard and the tablet inside. |

In the stand views, the user sits on the keyboard's side and the table is at z = 0.

## What to look for

- **K half**: the tray for the folded keyboard. In the stand it lies with its pocket toward the
  table. It rests on feet at the front and on a lip along its free edge at the back.
- **T half**: the tablet holder. It rises at 45°. The tablet's lower edge rests on the hinge
  side. The upper side is open.
- **Spine hinge**: a strip about 26 mm long between two pins. When the case is closed, it stands
  in front of the hinge-side walls. In the stand, it lies flat on the back of the K half, and the
  T half rises from its far edge. The weight of the T half presses it down.
- **Arms hinge**: the bodies of the halves start 32 mm from the one pin.
- **Bail**: a U-shaped prop. It pivots in the side walls of the K half, and its cross bar sits in
  a groove in the back of the T half. The other grooves give steeper screen angles. When it is
  stowed, it lies on the outside of the K half.
- **Lip on the K half's free edge**: when the case is closed, it covers the open side of the
  tablet holder.
- **Cut-outs**: for the USB-C port and, in landscape, for the power button.

| Estimate from the model | Spine | Arms |
|---|---|---|
| Landscape stand, depth on the table | 156 mm | 181 mm |
| Portrait stand, depth on the table | 202 mm | 234 mm |
| Closed case, added in front of the hinge side | 8 mm | 37 mm |

## Make the views again

```
for o in landscape portrait; do for h in spine arms; do for v in stand closed; do
  openscad-nightly -D "orient=\"$o\"" -D "hinge=\"$h\"" -D "view=\"$v\"" \
    -o views/${o}_${h}_$v.stl case.scad
done; done; done
```

## Not done yet

- No printable part files. `case.scad` can draw each part alone (`view="k_half"`, `"t_half"`,
  `"bail"`, `"spine"`), but they are not checked for printing. The lips over the tablet overhang by up to
  2.5 mm.
- Nothing holds the case shut, and nothing holds the bail when it is stowed.
- The spine hinge does not print as drawn. Its first pin is outside the K half's outer face, and
  the K half prints with that face on the bed. The lugs for that pin must be separate parts, or
  the K half's floor must be a separate plate.
- With the spine hinge in portrait, a USB-C plug possibly does not fit while the stand is set
  up: the port faces the back of the K half at a short distance. It fits when the case is closed.
- The hinge pins are not drawn.
- The folded keyboard's long side is an estimate (196.3 mm).
- The model was checked for collisions in the closed pose and in the stand pose only.
