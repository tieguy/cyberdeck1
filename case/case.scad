// cyberdeck1 rev 0.1: case that folds into a stand. First geometry, for review.
//
// Two halves turn on a pin. The K half carries the folded keyboard. The T half
// carries the tablet. To make the stand, the K half lies on the table with its
// pocket down, the T half swings the long way round the hinge and rises at
// SCREEN degrees, and a bail (a U-shaped prop) holds it there.
//
// Model frame: X is the hinge axis. The inner faces of both halves contain the
// axis. In the flat pose (theta = 180) the inner faces are at z = 0, the K half
// is on the +Y side and the T half is on the -Y side. theta is 0 when the case
// is closed.
//
// Make a view:
//   openscad-nightly -D 'orient="landscape"' -D 'view="stand"' -o view.stl case.scad

orient = "landscape";   // landscape | portrait
view   = "stand";       // stand | closed | k_half | t_half | bail

$fn = 48;

// ---- Bought parts (refer to PARTS.md) ----
TAB_L = 191;  TAB_S = 138;  TAB_T = 5.2;     // tablet: long side, short side, thickness
KB_L  = 196.3; KB_S = 143;  KB_T = 13;       // folded keyboard. KB_L is an estimate.
KB_OPEN = [392.6, 143, 6.5];                 // unfolded keyboard. Thickness is an estimate.

landscape = orient == "landscape";
tw = landscape ? TAB_L : TAB_S;   // tablet size along the hinge
th = landscape ? TAB_S : TAB_L;   // tablet size away from the hinge
kw = landscape ? KB_L : KB_S;
kd = landscape ? KB_S : KB_L;

// ---- Case ----
WALL    = 2.4;
SCREEN  = 45;      // angle between the halves in the stand = screen angle from the table
E       = 32;      // distance from the pin to the bodies of the halves (the arms)
RK      = 5;       // knuckle radius. The knuckles are also the front feet of the stand.
PIN_D   = 5.2;
KN      = 12;      // knuckle length

// K half
K_FLOOR = 2;
KPD     = KB_T + 0.5;            // pocket depth
T_K     = K_FLOOR + KPD;         // thickness
kpw     = kw + 0.7;              // pocket size
kpd     = kd + 1.0;
W       = kpw + 2 * WALL;        // case size along the hinge
D_K     = kpd + 2 * WALL;        // K half size away from the hinge
FOOT    = RK;      // height of the lip on the K half's free edge. It closes the tablet
                   // holder when the case is shut, and it is the rear foot of the stand.

// T half
T_FLOOR = 3;
LIP     = 1.2;                   // thickness of the lips over the tablet
TPD     = TAB_T + 0.3;           // pocket depth
T_T     = T_FLOOR + TPD + LIP;   // thickness
tpw     = tw + 0.6;              // pocket size
tpd     = th + 0.6;
D_T     = D_K - WALL - 0.4;      // T half size away from the hinge
wb      = D_T - tpd;             // border on the hinge side, under the tablet's lower edge
px0     = (W - tpw) / 2;
OV      = 2.5;     // how far a normal lip covers the bezel
OV_BTN  = 1.5;     // how far the lip on the touch-button edge covers the bezel

// Hinge: two sets of knuckles. In portrait they stay clear of the USB-C port.
HSETS = landscape ? [10, W - 10 - 2 * KN - 0.4] : [10, W - 40 - 2 * KN - 0.4];

// ---- Bail ----
BAIL_R  = 2.5;     // radius of the cross bar
GROOVE  = 1.5;     // depth of the grooves in the T half's outer face
BT      = 4;       // thickness of the bail's arms
PIV_Z   = -T_K + 6;                 // pivot holes in the K half's side walls
S0      = E + 0.55 * D_T;           // main groove: distance from the pin, along the T half
GSTEP   = 12;                       // spacing of the other grooves

// Centre of the cross bar when it sits in a groove at distance s, with the
// halves "wedge" degrees apart. [y, z] in the model frame.
function bar_centre(s, wedge) =
    let (a = 180 - wedge, zl = -T_T - (BAIL_R - GROOVE))
    [-s * cos(a) - zl * sin(a), -s * sin(a) + zl * cos(a)];

// The bail is square to the T half in the main position.
C0     = bar_centre(S0, SCREEN);
BAIL_L = (PIV_Z - C0[1]) / cos(SCREEN);
PIV_Y  = C0[0] + BAIL_L * sin(SCREEN);

echo(orient = orient, W = W, D_K = D_K, D_T = D_T, T_K = T_K, T_T = T_T, wb = wb);
echo(stop_angle = atan(T_T / E) + atan(T_K / E), BAIL_L = BAIL_L, PIV_Y = PIV_Y);

module pin_holes() {
    translate([-1, 0, 0]) rotate([0, 90, 0]) cylinder(d = PIN_D, h = W + 2);
}

module knuckle(x0, thick) {
    translate([x0, 0, 0]) {
        rotate([0, 90, 0]) cylinder(r = RK, h = KN);
        translate([0, -RK, -thick]) cube([KN, 2 * RK, thick]);
    }
}

// ---- K half: keyboard pocket, open at the inner face ----
module k_half() {
    difference() {
        union() {
            translate([0, E, -T_K]) cube([W, D_K, T_K]);
            translate([0, E + D_K - WALL, -0.01]) cube([W, WALL, FOOT + 0.01]);   // lip and foot
            for (x0 = HSETS) {
                translate([x0, 0, -T_K]) cube([KN, E + 0.01, T_K]);               // arm
                knuckle(x0, T_K);
            }
        }
        translate([WALL, E + WALL, -KPD]) cube([kpw, kpd, KPD + 1]);              // pocket
        pin_holes();
        // finger notch in the free edge, to lift the keyboard out
        translate([W / 2, E + D_K - WALL - 1, 0]) rotate([-90, 0, 0]) cylinder(r = 12, h = WALL + 2);
        // pivot holes for the bail
        for (x = [-1, W - WALL - 1])
            translate([x, PIV_Y, PIV_Z]) rotate([0, 90, 0]) cylinder(d = 4.4, h = WALL + 2);
    }
}

// ---- T half: tablet holder. Drawn in the flat pose, on the -Y side. ----
// The hinge side is the lower side in the stand. The free edge is open.
module t_half() {
    y_hinge = -E;                 // edge of the body on the hinge side
    y_free  = -E - D_T;           // free edge
    y_low   = y_hinge - wb;       // lower end of the pocket
    z_floor = -T_T + T_FLOOR;
    // Lip widths. In landscape the touch buttons are at low x. In portrait they are at the bottom.
    ov_lo  = landscape ? OV_BTN : OV;
    ov_hi  = OV;
    ov_bot = landscape ? OV : OV_BTN;
    difference() {
        union() {
            translate([0, y_free, -T_T]) cube([W, D_T, T_T]);
            // Arms and knuckles. The corner next to the pin is cut at the angle of the
            // table, so that it is a flat foot in the stand and prints with no support.
            intersection() {
                for (x0 = HSETS) {
                    translate([x0 + KN + 0.4, -E - 0.01, -T_T]) cube([KN, E + 0.01, T_T]);
                    knuckle(x0 + KN + 0.4, T_T);
                }
                rotate([SCREEN - 90, 0, 0]) translate([-1, -300, -300]) cube([W + 2, 300 + RK, 600]);
            }
        }
        // pocket, open at the free edge
        translate([px0, y_free - 1, z_floor]) cube([tpw, tpd + 1, TPD]);
        // opening over the screen
        translate([px0 + ov_lo, y_free - 1, -LIP - 0.01])
            cube([tpw - ov_lo - ov_hi, tpd + 1 - ov_bot, LIP + 1]);
        // bevel on the lip next to the touch buttons
        if (landscape)
            translate([px0 + ov_lo, y_low, 0]) rotate([90, 0, 0])
                linear_extrude(tpd + 1) polygon([[-1.1, 0.01], [0.01, 0.01], [0.01, -1.1]]);
        else
            translate([px0, y_low - ov_bot, 0]) rotate([90, 0, 90])
                linear_extrude(tpw) polygon([[-0.01, 0.01], [1.1, 0.01], [-0.01, -1.1]]);
        if (landscape) {
            // power button: left edge (high x), near the top (free edge)
            translate([px0 + tpw - OV - 0.01, y_free - 1, z_floor]) cube([W, 25, T_T]);
            // USB-C port: right edge (low x), 13.6 mm from the bottom
            translate([-1, y_low - 0.3 - 13.6 - 9, z_floor]) cube([px0 + 1.1, 18, T_T]);
        } else {
            // USB-C port: bottom edge, 13.6 mm from the left corner (high x).
            // The power button is on the top edge, which is open.
            translate([px0 + tpw - 0.3 - 13.6 - 9, y_low - OV_BTN - 0.01, z_floor])
                cube([18, wb + OV_BTN + 1, T_T]);
        }
        // grooves for the bail's cross bar, in the outer face
        for (k = [-1 : 2])
            translate([-1, -(S0 + k * GSTEP), -T_T - (BAIL_R - GROOVE)])
                rotate([0, 90, 0]) cylinder(r = BAIL_R + 0.2, h = W + 2);
        pin_holes();
    }
}

// ---- Bail: pivot at the origin, arms along +Y ----
module bail() {
    for (x = [-0.4 - BT, W + 0.4]) translate([x, -4, -3]) cube([BT, BAIL_L + 4 + BAIL_R, 6]);
    translate([-0.4 - BT, BAIL_L, 0]) rotate([0, 90, 0]) cylinder(r = BAIL_R, h = W + 2 * BT + 0.8);
    translate([-0.5, 0, 0]) rotate([0, 90, 0]) cylinder(d = 4, h = WALL + 0.3);
    translate([W + 0.5 - WALL - 0.3, 0, 0]) rotate([0, 90, 0]) cylinder(d = 4, h = WALL + 0.3);
}

module bail_at(target) {   // target = [y, z] of the cross bar's centre
    translate([0, PIV_Y, PIV_Z]) rotate([atan2(target[1] - PIV_Z, target[0] - PIV_Y), 0, 0]) bail();
}

// ---- Stand-ins for the bought parts ----
module tablet() {
    translate([px0 + 0.3, -E - wb - 0.3 - th, -T_T + T_FLOOR]) cube([tw, th, TAB_T]);
}
module keyboard_folded() {
    translate([WALL + 0.35, E + WALL + 0.5, -KPD]) cube([kw, kd, KB_T]);
}

module posed(theta) { rotate([theta - 180, 0, 0]) children(); }

// Closed: the K half's outer face is on the table.
module view_closed() {
    translate([0, 0, T_K + 2 * BAIL_R + 0.5]) {
        k_half();
        keyboard_folded();
        posed(0) { t_half(); tablet(); }
        stow_z = -T_K - BAIL_R - 0.2;
        bail_at([PIV_Y - sqrt(BAIL_L * BAIL_L - pow(PIV_Z - stow_z, 2)), stow_z]);
    }
}

// Stand: the K half's inner face is toward the table. The user sits at -Y.
// +X is the user's right.
module view_stand() {
    translate([W, 0, RK]) rotate([0, 180, 0]) {
        k_half();
        posed(360 - SCREEN) { t_half(); tablet(); }
        bail_at(C0);
    }
    translate([(W - KB_OPEN[0]) / 2, -25 - KB_OPEN[1], 0]) cube(KB_OPEN);
}

if (view == "stand") view_stand();
else if (view == "closed") view_closed();
else if (view == "k_half") translate([0, 0, T_K]) k_half();
else if (view == "t_half") translate([0, 0, T_T]) t_half();
else if (view == "bail") bail();
else if (view == "check_k") k_half();
else if (view == "check_t") posed(360 - SCREEN) t_half();
else if (view == "check_t0") posed(0) t_half();
else if (view == "check_bail") bail_at(C0);
