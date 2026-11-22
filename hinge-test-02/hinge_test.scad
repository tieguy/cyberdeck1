// Hinge test piece for cyberdeck1 rev 0.2: the two-pin link hinge.
//
// A slice of the real case at one edge, 30 mm wide: both noses, the slots, the pin holes
// with their crush ribs, and a short length of each half. With it: links and pins. The shapes
// come from ../case02/case02.scad, so a change there changes this piece.
//
// Make the plate:  openscad-nightly -o hinge_test_plate.stl hinge_test.scad

include <../case02/case02.scad>
view = "none";       // draw nothing from case02.scad itself

tpart = "plate";     // plate | k_piece | assembly
ta = 0;  tw_ = 360;  // assembly: link angle and angle between the halves (0, 360 = closed)

TEST_T = [4.8, 4.9, 5.0];   // thickness of the three test links
WT = 30;  BODY = 30; // width of the slice, and length of the K half behind its pin
BODY_T = 20;         // length of the T half behind its pin: it ends before the opening for the prop

module k_piece() { intersection() { k_half(); translate([0, -RK - 1, -T_K - 1]) cube([WT, RK + 1 + BODY, T_K + 30]); } }
module t_piece() { intersection() { t_half(); translate([0, -BODY_T, -T_T - 1]) cube([WT, BODY_T + RT + 1, T_T + 2]); } }

module hinge_plate() {
    translate([0, RK, T_K]) k_piece();
    translate([WT + 8, BODY_T, T_T]) t_piece();
    // three links to choose from: 1, 2 or 3 small holes mark the thickness
    for (i = [0, 1, 2]) translate([2 * WT + 16 + LINK_R, LINK_R + i * (2 * LINK_R + 6), 0]) link(TEST_T[i], i + 1);
    for (i = [0, 1, 2]) translate([2 * WT + 16 + HEAD_T, 3 * (2 * LINK_R + 6) + 3 + i * (HEAD_D + 6), 0]) pin_part();   // one spare
}

module k_plate() { translate([0, RK, T_K]) k_piece(); }   // the K-half piece alone, to print again

if (tpart == "plate") hinge_plate();
else if (tpart == "k_piece") k_plate();
else {
    k_piece();
    posed(tw_, ta) t_piece();
    yz(LINK_X[0] + (SLOT_W - LINK_T) / 2, LINK_X[0] + (SLOT_W + LINK_T) / 2) stadium(A_K, b_k(ta), LINK_R);
}
