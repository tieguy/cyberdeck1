// One print plate with both test pieces of cyberdeck1 rev 0.2: the hinge test
// (../hinge-test-02/) and the prop test (../prop-test-02/). The shapes come from those
// files, and they take theirs from ../case02/case02.scad.
//
// Make the plate:  openscad-nightly -o test_plate.stl test_plate.scad

use <../hinge-test-02/hinge_test.scad>
use <../prop-test-02/prop_test.scad>

$fn = 48;   // as in case02.scad: "use" does not bring it

hinge_plate();
translate([0, 78, 0]) prop_plate();
