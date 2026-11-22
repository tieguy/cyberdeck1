// One print plate with the test pieces of cyberdeck1 rev 0.2 that are still open: the
// keyboard-half piece of the hinge test (../hinge-test-02/) and the prop test
// (../prop-test-02/). The shapes come from those files, and they take theirs from
// ../case02/case02.scad.
//
// Make the plate:  openscad-nightly -o test_plate.stl test_plate.scad

use <../hinge-test-02/hinge_test.scad>
use <../prop-test-02/prop_test.scad>

$fn = 48;   // as in case02.scad: "use" does not bring it

k_plate();
translate([38, 0, 0]) prop_plate();
