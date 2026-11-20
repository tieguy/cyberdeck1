// Hinge test piece for cyberdeck1 rev 0.1.
//
// A slice of the real hinge, 40 mm wide: the two tapers, the three knuckles, the pin
// hole with its closed end and push-out hole, and the crush ribs. The shapes come from
// ../case/case.scad, so a change there changes this piece.
//
// Make the plate:  openscad-nightly -o hinge_test_plate.stl hinge_test.scad

include <../case/case.scad>
view  = "none";      // draw nothing from case.scad itself
hinge = "bevel";

tpart = "plate";     // plate | k_leaf | t_leaf | pins | assembly
ttheta = 180;        // assembly: 360 = closed, SCREEN = stand, 180 = flat

WT   = 40;           // width of the slice
BODY = 15;           // length of full-thickness body behind each taper
// Knuckle bands, as in the case: T, K, T.
TB = [[0, 13], [27, 13]];
KB = [[13.4, 13.2]];
PINS = [[2.9, 34], [3.0, 37], [3.1, 40]];   // [diameter, length]: the longest is the thickest

module t_holes() {
    translate([PIN_X0, 0, 0]) rotate([0, 90, 0]) cylinder(d = PIN_D, h = WT);
    translate([-1, 0, 0]) rotate([0, 90, 0]) cylinder(d = 1.6, h = PIN_X0 + 2, $fn = 16);
}

module k_leaf() {
    for (b = KB) crush_ribs(b);
    difference() {
        union() {
            intersection() {
                union() { nose(T_K); translate([0, E, -T_K]) cube([WT, BODY, T_K]); }
                translate([0, -50, -50]) cube([WT, 200, 100]);
            }
            for (b = KB) bevel_knuckle(b, T_K);
        }
        for (b = TB) bevel_notch(b);
        t_holes();
    }
}

module t_leaf() {
    difference() {
        mirror([0, 1, 0]) union() {
            intersection() {
                union() { nose(T_T); translate([0, E, -T_T]) cube([WT, BODY, T_T]); }
                translate([0, -50, -50]) cube([WT, 200, 100]);
            }
            for (b = TB) bevel_knuckle(b, T_T);
        }
        mirror([0, 1, 0]) for (b = KB) bevel_notch(b);
        t_holes();
    }
}

module test_pin(d, len) {
    cut = d / 2 - 0.3;
    translate([0, 0, cut]) difference() {
        rotate([0, 90, 0]) cylinder(d = d, h = len, $fn = 32);
        translate([-1, -d, -d - cut]) cube([len + 2, 2 * d, d]);
    }
}

module pins() { for (i = [0 : len(PINS) - 1]) translate([0, 8 * i, 0]) test_pin(PINS[i][0], PINS[i][1]); }

if (tpart == "plate") {
    translate([0, 8, T_K]) k_leaf();
    translate([0, -8, T_T]) t_leaf();
    // The pins lie beside the leaves, along Y. Each is clear of the leaves and of the others.
    for (i = [0 : len(PINS) - 1])
        translate([WT + 8 + 8 * i, -20, 0]) rotate([0, 0, 90]) test_pin(PINS[i][0], PINS[i][1]);
}
else if (tpart == "k_leaf") translate([0, 0, T_K]) k_leaf();
else if (tpart == "t_leaf") translate([0, 0, T_T]) t_leaf();
else if (tpart == "pins") pins();
else if (tpart == "assembly") { k_leaf(); rotate([180 - ttheta, 0, 0]) t_leaf(); }
else if (tpart == "x") intersection() { k_leaf(); rotate([180 - ttheta, 0, 0]) t_leaf(); }
// Plate check: this must be empty. The pins must not touch the leaves.
if (tpart == "x_plate") intersection() {
    union() { translate([0, 8, T_K]) k_leaf(); translate([0, -8, T_T]) t_leaf(); }
    for (i = [0 : len(PINS) - 1])
        translate([WT + 8 + 8 * i, -20, 0]) rotate([0, 0, 90]) test_pin(PINS[i][0] + 2, PINS[i][1]);
}
