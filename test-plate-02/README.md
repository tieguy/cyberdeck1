# Test plate, rev 0.2

One print plate with both test pieces of rev 0.2, 97 × 128 mm, about 25 cm³.

| File | Contents |
|---|---|
| `test_plate.scad` | Puts the two test pieces on one plate. It takes them from their own files. |
| `test_plate.stl` | The print plate |

| On the plate | What to look for, and where the results go |
|---|---|
| Hinge test: two pieces of the halves, three links of different thickness, three pins. To test the stop again, only the keyboard-half piece is needed: `../hinge-test-02/hinge_test_k_piece.stl`. | `../hinge-test-02/README.md` |
| Prop test: a frame with the prop in place, and three axle pins | `../prop-test-02/README.md` |

The plate has 13 bodies. The smallest gap between two of them is 6 mm, apart from the prop in
its frame, which prints in place. No part needs supports. The plate is not checked in a slicer.
