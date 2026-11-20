// Fit test pieces for cyberdeck1 rev 0.1.
//
// Two L-shaped pieces cut from the real halves in ../case/case.scad: one strip across
// the hinge side of each pocket and one strip along a side. They show whether the
// tablet and the folded keyboard go in and out easily, before the full halves print.
//
// Make the plate:  openscad-nightly -o fit_test_plate.stl fit_test.scad

include <../case/case.scad>
view  = "none";      // draw nothing from case.scad itself
hinge = "bevel";

fpart = "plate";     // plate | k_fit | t_fit | x

K_STRIP = 22;        // width of the K piece's strips
T_BOTTOM = 30;       // T piece: length of the strip across the tablet's lower edge
T_SIDE = 20;         // T piece: width of the strip along the tablet's side

// K piece: the hinge-side wall, both side walls near it, one whole side wall, and the
// wall and lip at the free edge. Moved so that its corner is at the origin.
module k_fit() {
    translate([0, -E, T_K]) intersection() {
        k_half();
        union() {
            translate([-1, E, -50]) cube([W + 2, K_STRIP, 100]);
            translate([-1, E, -50]) cube([K_STRIP + 1, D_K + 1, 100]);
        }
    }
}

// T piece: the lower wall with its lip and the cut-out for the USB-C port, both side
// lips near it, and one whole side lip up to the open end.
module t_fit() {
    translate([0, E + D_T, T_T]) intersection() {
        t_half();
        union() {
            translate([-1, -E - T_BOTTOM, -50]) cube([W + 2, T_BOTTOM, 100]);
            translate([-1, -E - D_T - 1, -50]) cube([T_SIDE + 1, D_T + 1, 100]);
        }
    }
}

T_AT = [K_STRIP + 6, K_STRIP + 6];   // the T piece sits inside the K piece's corner

if (fpart == "plate") { k_fit(); translate([T_AT[0], T_AT[1], 0]) t_fit(); }
else if (fpart == "k_fit") k_fit();
else if (fpart == "t_fit") t_fit();
// Plate check: this must be empty. The two pieces must not touch.
else if (fpart == "x") intersection() { k_fit(); translate([T_AT[0] - 2, T_AT[1] - 2, 0]) t_fit(); }
