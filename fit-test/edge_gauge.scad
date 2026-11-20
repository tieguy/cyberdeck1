// Edge gauge for the tablet's lip, cyberdeck1 rev 0.1.
//
// Eight short clips. Each has the cross-section of the tablet holder at a side lip: floor,
// wall and lip, with the same pocket height and lip as ../case/case.scad. They differ in
// the shape under the lip, in the corner where the tablet's rounded edge leaves room.
// Slide each clip onto the tablet's edge to find the fullest shape that still slides.
//
// The clips print standing on end, so the profile is exact and nothing overhangs.
//
// Make the plate:  openscad-nightly -o edge_gauge_plate.stl edge_gauge.scad

include <../case/case.scad>
view = "none";

LEN   = 10;     // length of each clip
G_WALL = 3;
REACH = 12;     // how far the floor reaches under the tablet

// [kind, size]: the fill under the lip, in the corner next to the wall.
// The number is the mark on the clip: rounds have notches on the back of the wall,
// slopes have notches under the floor, and the flat clip has none.
SHAPES = [["flat", 0, 0],
          ["round", 0.5, 1], ["round", 1.0, 2], ["round", 1.5, 3], ["round", 2.0, 4],
          ["chamfer", 1.0, 1], ["chamfer", 1.5, 2], ["chamfer", 2.0, 3]];

module profile(shape) {
    top = T_FLOOR + TPD;            // underside of the lip
    polygon([[0, 0], [G_WALL + REACH, 0], [G_WALL + REACH, T_FLOOR], [G_WALL, T_FLOOR],
             [G_WALL, top], [G_WALL + OV, top], [G_WALL + OV, top + LIP], [0, top + LIP]]);
    if (shape[0] == "chamfer")
        polygon([[G_WALL, top + 0.01], [G_WALL + shape[1], top + 0.01], [G_WALL, top - shape[1]]]);
    if (shape[0] == "round")        // a concave quarter circle
        difference() {
            translate([G_WALL, top - shape[1]]) square([shape[1], shape[1] + 0.01]);
            translate([G_WALL + shape[1], top - shape[1]]) circle(r = shape[1], $fn = 48);
        }
}

module clip(i) {
    difference() {
        linear_extrude(LEN) profile(SHAPES[i]);
        s = SHAPES[i];
        if (s[0] == "round")
            for (k = [0 : s[2] - 1]) translate([-0.01, 1.2 + 1.8 * k, LEN - 1]) cube([0.6, 0.9, 1.01]);
        if (s[0] == "chamfer")
            for (k = [0 : s[2] - 1]) translate([5 + 1.8 * k, -0.01, LEN - 1]) cube([0.9, 0.6, 1.01]);
    }
}

for (i = [0 : len(SHAPES) - 1]) translate([i * (G_WALL + REACH + 4), 0, 0]) clip(i);
