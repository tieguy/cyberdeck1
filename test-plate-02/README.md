# Test plate, rev 0.2

One print plate, 111 × 48 mm, about 18 cm³, with the pieces of the third test of rev 0.2: the
keyboard-half piece of the hinge test, and the prop test. It was printed on 2026-11-21 and both
tests passed.

| File | Contents |
|---|---|
| `test_plate.scad` | Puts the test pieces on one plate. It takes them from their own files. |
| `test_plate.stl` | The print plate |

| On the plate | What to look for, and where the results go |
|---|---|
| The keyboard-half piece of the hinge test. It goes with the tablet-half piece, the link with two holes and the pins of the second plate. | `../hinge-test-02/README.md`: the stop |
| Prop test: a frame with the prop in place, and three axle pins | `../prop-test-02/README.md` |

The plate has six bodies. The smallest gap between two of them is 5 mm, apart from the prop in
its frame, which prints in place. No part needs supports. The plate was not checked in a slicer before it was printed.

The full hinge test, with both pieces, links and pins, is `../hinge-test-02/hinge_test_plate.stl`.
