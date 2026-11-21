// Prop test piece for cyberdeck1 rev 0.2: the cone pivots and the click of the prop.
//
// The four corners of the prop and of its opening, cut from the real tablet half and moved
// together: both pivots with their ears, both feet with their click bumps, springs and
// dimples. The middle of the panel is left out, so the piece is 60 x 51 mm and its prop
// is 39 mm long, not 105 mm. The shapes come from ../case02/case02.scad, so a change
// there changes this piece. It prints as one job; the prop prints in place.
//
// Make the plate:  openscad-nightly -o prop_test_plate.stl prop_test.scad

include <../case02/case02.scad>
view = "none";       // draw nothing from case02.scad itself

tpart = "plate";     // plate | frame | prop
XK = 30;             // width kept at each side
Y_PIV = [-SP - 7, -SP + 15];          // length kept at the pivot
Y_TIP = [-TIP_S - 18, -TIP_S + 10];   // length kept at the feet
DX = W - 2 * XK;  DY = Y_PIV[1] - Y_TIP[0];

// Keep the four corners of the child and move them together.
module corners() {
    for (i = [0, 1], j = [0, 1]) {
        yr = j == 0 ? Y_PIV : Y_TIP;
        translate([i * -DX, j * DY, 0]) intersection() {
            children();
            translate([i == 0 ? -1 : W - XK, yr[0], -50]) cube([XK + 1, yr[1] - yr[0], 100]);
        }
    }
}

translate([0, -Y_PIV[0], T_T]) {
    if (tpart != "prop") corners() t_half();
    if (tpart != "frame") corners() prop();
}
