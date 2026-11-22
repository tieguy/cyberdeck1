# Test plate, rev 0.2

One print plate with the test pieces of rev 0.2 that are still open, 111 × 50 mm, about 19 cm³.

| File | Contents |
|---|---|
| `test_plate.scad` | Puts the test pieces on one plate. It takes them from their own files. |
| `test_plate.stl` | The print plate |

| On the plate | What to look for, and where the results go |
|---|---|
| The keyboard-half piece of the hinge test. It goes with the tablet-half piece, the link with two holes and the pins of the second plate. | `../hinge-test-02/README.md`: the stop |
| Prop test: a frame with the prop in place, and three axle pins | `../prop-test-02/README.md` |

The plate has six bodies. The smallest gap between two of them is 6 mm, apart from the prop in
its frame, which prints in place. No part needs supports. The plate is not checked in a slicer.

The full hinge test, with both pieces, links and pins, is `../hinge-test-02/hinge_test_plate.stl`.
