// cyberdeck1 rev 0.2: first geometry, for review. Portrait only.
//
// Changes from rev 0.1 (refer to ../DESIGN-0.2.md):
//   - The hinge has two pins and two links. Each half ends in a nose as thick as the half,
//     with its pin at the middle of its thickness. A link joins the two pins at each edge.
//     The halves start 3.5 mm behind the pins: no arms, tabs or tapers.
//   - The bed side of each nose is a 45 degree chamfer, so no part needs supports.
//   - In the stand, the flat back of the T half rests on the chamfer of the K half's nose.
//   - The prop is a solid panel. It lies in an opening in the back of the T half and
//     prints there, in place. Its axle is two pieces of filament. Its feet go into slots through the
//     floor of the K half.
//   - The back of the T half above the prop is a web, not a solid floor.
//   - A snap tongue on the K half's lip holds the case shut.
//   - The outer edges and corners are round, or have chamfers where they are on the bed.
//
// Frames: X is the hinge axis. K half: body at +Y, inner face at z = 0, material at
// z < 0, nose toward -Y. T half, drawn flat: body at -Y, inner face at z = 0, nose toward
// +Y. Each half has its pin at y = 0, at the middle of its thickness (A_K, B_T).
// A pose has two angles. "a" is the link's angle about the K half's pin: 0 with the link
// square to the K half (closed), A_ST in the stand. "wedge" is the angle between the
// halves; 360 is closed.
//
// Make a view:  openscad-nightly -D 'view="stand"' -o view.stl case02.scad

view = "stand";   // stand | closed | k_half | t_half | link | pin | x_* (checks)

$fn = 48;

// ---- Bought parts (refer to ../PARTS.md) ----
tw = 138;  th = 191;  TAB_T = 5.2;        // tablet in portrait
kw = 143;  kd = 196.3;  KB_T = 13;        // folded keyboard
KB_OPEN = [392.6, 143, 6.5];

// ---- Halves ----
WALL = 2.4;  SCREEN = 45;
K_FLOOR = 2;  KPD = KB_T + 0.5;  T_K = K_FLOOR + KPD;
kpw = kw + 0.7;  kpd = kd + 1.0;
W = kpw + 2 * WALL;  D_K = kpd + 2 * WALL;
T_FLOOR = 3;  LIP = 1.2;  TPD = TAB_T + 0.3;  T_T = T_FLOOR + TPD + LIP;
tpw = tw + 0.6;  tpd = th + 0.6;
D_T = D_K - WALL - 0.4;  wb = D_T - tpd;  px0 = (W - tpw) / 2;
OV = 2.5;                     // how far the lips cover the tablet's face
USB_C = 19.5;  USB_HW = 11;   // USB-C port: from the tablet's corner to its middle; half cut-out
EDGE = 1.5;                   // chamfer on the long bed-side edges
ER = 1;                       // round on the other outer edges (a 45 degree chamfer where the edge is on the bed)
CR = 4;  CR_KN = 3;  CR_TN = 2;   // round on the vertical corners: free end, K nose, T nose

// ---- Hinge ----
HG  = 0.25;       // half the gap between the inner faces of the closed case
RK  = T_K / 2;  RT = T_T / 2;          // nose radius of each half
A_K = [0, -RK];  B_T = [0, -RT];       // the pin of each half, in its own frame
LINK_L = RK + RT + 2 * HG;             // distance between the pins
LINK_R = 4;  LINK_T = 4.8;             // link: end radius, thickness
LINK_HOLE = 3.1;                       // pin hole in a link. It is smaller than PIN_D: less play at the stop.
SLOT_W = 5;  SLOT_C = 0.15;            // slot for a link: width, clearance round the link
LINK_X = [4.3, W - 4.3 - SLOT_W];      // where the slots start, along the hinge
PIN_D = 3.3;  PIN_DIA = 2.9;  RIB = 0.25;
PIN_IN = 4.5;     // how far a pin goes into the nose beyond the slot
HEAD_D = 5;  HEAD_T = 1.8;  HEAD_IN = 0.8;   // pin head, and how deep it sits in the edge
PIN_FLAT = PIN_DIA / 2 - 0.6;   // the pin and its head have a flat, this far from the axis. It lies on the bed.
E0  = 3.5;        // the bodies start this far behind the pins
LIP_H = 11.25;    // lip on the K half's free edge. It is the rear foot of the stand.
SEAT_C = 0.05;    // gap drawn between the two faces of the stop
// The stop: at SCREEN degrees, the T half's flat back lies on the chamfer of the K half's
// nose. The chamfer runs from the outer face, under the pin, to the tip of the nose.
SEAT_D = RK / sqrt(2) + RT + SEAT_C;   // from the K half's pin to the T half's mid-plane
function dir_k(a) = [-sin(a), cos(a)];             // direction of the link, K frame
function b_k(a) = A_K + LINK_L * dir_k(a);         // the T half's pin, K frame
B_SEAT = A_K + SEAT_D * [-1, -1] / sqrt(2) + sqrt(LINK_L * LINK_L - SEAT_D * SEAT_D) * [-1, 1] / sqrt(2);
A_ST = atan2(-(B_SEAT - A_K)[0], (B_SEAT - A_K)[1]);   // link angle in the stand
B_ST = 360 - SCREEN - A_ST;                            // turn of the T half on the link, in the stand
// Limits of the slots. The walls of the slots are the stops for the links.
A_MAX = A_ST + 3;  B_MAX = B_ST + 3;

// ---- Prop ----
SP    = 127.5;    // pivot: distance from the T half's pin, along the T half
TIP_S = 22;       // where the feet lie when the prop is stowed
PL    = SP - TIP_S;           // length from the pivot to the tips of the feet
FOOT_L = 5;       // the feet stand this far out of the panel's edge
AW    = 8;        // width of each foot
PZ    = -T_T + T_FLOOR / 2;   // height of the pivot axis, in the T half's frame
LEDGE = 10;       // floor that stays under each long edge of the tablet, beside the panel
PX    = [px0 + LEDGE, W - px0 - LEDGE];        // the sides of the panel
EAR_GAP = 0.3;    // gap at the end of each ear: the side play of the prop
EAR_X = [px0 + EAR_GAP, W - px0 - EAR_GAP];    // at the pivot, ears reach the side walls
// Axle: a piece of 1.75 mm filament from each edge of the case, tight in the side wall and
// free in the ear.
AXLE_WALL = 1.9;  AXLE_EAR = 2.2;  AXLE_IN = 8;
EAR_L = 8;
ARM_X = [PX[0], PX[1] - AW];                   // the feet
NOTCH_R = 10;     // finger notch in the panel's edge
// Click that holds the stowed prop: a bump on the outer side of each foot, in a dimple in the
// wall of the opening. A slit makes the side of the foot a spring.
CLK_B = 0.9;  CLK_D = 1.2;    // radius of the bump, and of the dimple (same centre)
CLK_Y = -TIP_S - 1.5;         // where the bump is
CLK_W = 1.2;  CLK_S = 0.8;  CLK_L = 9;   // spring: thickness, width of the slit, length
ANGLES = [45, 52, 59];        // screen angles that have slots for the feet. The prop reaches no steeper.

function rot(p, a) = [p[0] * cos(a) - p[1] * sin(a), p[0] * sin(a) + p[1] * cos(a)];
function t_shift(wedge, a) = b_k(a) - rot(B_T, 180 - wedge);
function to_k(p, wedge, a = A_ST) = t_shift(wedge, a) + rot(p, 180 - wedge);   // T frame -> K frame
// Prop: direction of the arms in the K frame, with the feet 1.5 mm into the K half's floor.
function pivot_k(wedge) = to_k([-SP, PZ], wedge);
function prop_a(wedge) = asin(((-T_K + 1.5) - pivot_k(wedge)[1]) / PL);
function tip_k(wedge) = pivot_k(wedge) + PL * [cos(prop_a(wedge)), sin(prop_a(wedge))];
// The same direction in the T half's frame, as a turn about the pivot from the stowed pose.
function prop_turn(wedge) = prop_a(wedge) - (180 - wedge);

echo(W = W, D_K = D_K, D_T = D_T, T_K = T_K, T_T = T_T, LINK_L = LINK_L, A_ST = A_ST, B_ST = B_ST, PL = PL);
echo(feet_y = [for (a = ANGLES) tip_k(a)[0]], prop_turn = [for (a = ANGLES) prop_turn(a)]);

module x_cyl(p, r, x0, x1) { translate([x0, p[0], p[1]]) rotate([0, 90, 0]) cylinder(r = r, h = x1 - x0); }
module posed(wedge, a = A_ST) { s = t_shift(wedge, a); translate([0, s[0], s[1]]) rotate([180 - wedge, 0, 0]) children(); }
// A 2D shape in (y, z), made solid from x0 to x1.
module yz(x0, x1) { translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(x1 - x0) children(); }
function arc(c, r, a0, a1, n = 24) = [for (i = [0 : n]) c + r * [cos(a0 + (a1 - a0) * i / n), sin(a0 + (a1 - a0) * i / n)]];
module stadium(p, q, r) { hull() { translate(p) circle(r); translate(q) circle(r); } }

// Noses. The inner side is a quarter round about the pin. The bed side is a 45 degree
// chamfer from the outer face, under the pin, to the tip. Both are inside the circle about
// the pin, so the noses pass each other at any angle.
module k_nose_2d() { polygon(concat([[0.01, 0]], arc(A_K, RK, 90, 180), [[0.01, -T_K]])); }
module t_nose_2d() { polygon(concat([[-0.01, 0]], arc(B_T, RT, 90, 0), [[-0.01, -T_T]])); }
// Slots: what a link sweeps, in each half's frame. Their end walls are the stops.
module k_slot_2d() { for (a = [0 : 3 : A_MAX + 2.9]) stadium(A_K, b_k(min(a, A_MAX)), LINK_R + SLOT_C); }
module t_slot_2d() { for (b = [0 : 3 : B_MAX + 2.9]) let (bb = min(b, B_MAX))
    stadium(B_T, B_T + LINK_L * [sin(bb), cos(bb)], LINK_R + SLOT_C); }
// Pin holes of one half, with the pin at c. Each pin goes in from its edge of the case.
module pin_holes(c) {
    for (i = [0, 1]) {
        x0 = i == 0 ? -1 : LINK_X[1] - PIN_IN;  x1 = i == 0 ? LINK_X[0] + SLOT_W + PIN_IN : W + 1;
        x_cyl(c, PIN_D / 2, x0, x1);
        // The recess for the head has the head's flat, toward the outer face. A pin goes in in
        // one position only: with its flat between two ribs, so that all three ribs hold it.
        intersection() {
            x_cyl(c, HEAD_D / 2 + 0.2, i == 0 ? -1 : W - HEAD_IN, i == 0 ? HEAD_IN : W + 1);
            translate([-2, c[0] - HEAD_D, c[1] - PIN_FLAT - 0.2]) cube([W + 4, 2 * HEAD_D, HEAD_D]);
        }
    }
}
module crush_ribs(c) {
    for (i = [0, 1], a = [0, 120, 240]) translate([0, c[0], c[1]]) rotate([a, 0, 0])   // none at the flat
        translate([i == 0 ? LINK_X[0] + SLOT_W + 0.8 : LINK_X[1] - PIN_IN + 0.2, -0.3, PIN_D / 2 - RIB])
            cube([PIN_IN - 1, 0.6, RIB + 0.3]);
}
module link(t = LINK_T, marks = 0) {   // in its print frame: flat, pins along Z. Marks: small holes that tell test links apart.
    linear_extrude(t) difference() {
        stadium([0, 0], [LINK_L, 0], LINK_R);
        circle(d = LINK_HOLE);  translate([LINK_L, 0]) circle(d = LINK_HOLE);
        if (marks > 0) for (i = [0 : marks - 1]) translate([LINK_L / 2 + (i - (marks - 1) / 2) * 2.6, 0]) circle(d = 1.4, $fn = 12);
    }
}
module links_at(a) {   // in the K half's frame
    for (x = LINK_X) yz(x + (SLOT_W - LINK_T) / 2, x + (SLOT_W + LINK_T) / 2) difference() {
        stadium(A_K, b_k(a), LINK_R);
        translate(A_K) circle(d = LINK_HOLE);  translate(b_k(a)) circle(d = LINK_HOLE);
    }
}

// A 45 degree chamfer on a bottom edge that runs along Y at x = x0 (dir = +1 cuts toward +x).
module chamfer_y(x0, dir, y0, y1, z0, c = EDGE) {
    hull() {
        translate([x0 - dir * 0.01, y0, z0 - 0.01]) cube([0.001, y1 - y0, c + 0.01]);
        translate([x0 + dir * c, y0, z0 - 0.01]) cube([0.001, y1 - y0, 0.001]);
        translate([x0 - dir * 1, y0, z0 - 0.01]) cube([0.001, y1 - y0, c + 0.01]);
    }
}
module chamfer_x(y0, dir, x0, x1, z0, c = EDGE) {   // edge along X at y = y0
    hull() {
        translate([x0, y0 - dir * 0.01, z0 - 0.01]) cube([x1 - x0, 0.001, c + 0.01]);
        translate([x0, y0 + dir * c, z0 - 0.01]) cube([x1 - x0, 0.001, 0.001]);
        translate([x0, y0 - dir * 1, z0 - 0.01]) cube([x1 - x0, 0.001, c + 0.01]);
    }
}

// ---- K half: keyboard tray ----
SNAP_W = 20;  SNAP_T = 1.2;  SNAP_B = 1.6;     // snap tongue: width, thickness, bump
SNAP_TOP = LIP_H - (T_T + 2 * HG + 0.15);      // the bump ends at the top of the lip; the chamfer on the T half's edge leads it in
module plan(cs, d) { hull() for (c = cs) translate([c[0], c[1]]) circle(c[2] - d); }
// The tool that rounds the edges: a half ball above, a cone below, so that an edge on the
// bed gets a chamfer and needs no supports.
module round_tool() { hull() { intersection() { sphere(ER, $fn = 16); translate([-2, -2, 0]) cube(4); }
    translate([0, 0, -ER]) cylinder(r1 = 0.01, r2 = ER, h = ER, $fn = 16); } }
// The outside of the K half, with round edges and corners. The half is cut to it.
module k_env() {
    y_end = E0 + D_K;
    cs = [[CR_KN, -RK + CR_KN, CR_KN], [W - CR_KN, -RK + CR_KN, CR_KN], [CR, y_end - CR, CR], [W - CR, y_end - CR, CR]];
    minkowski() {
        intersection() {
            yz(ER, W - ER) offset(delta = -ER) union() { k_nose_2d(); translate([0, -T_K]) square([y_end, T_K]); }
            translate([0, 0, -50]) linear_extrude(100) plan(cs, ER);
        }
        round_tool();
    }
    minkowski() {   // lip
        intersection() {
            translate([ER, y_end - WALL + ER, -3]) cube([W - 2 * ER, WALL - 2 * ER, LIP_H + 3 - ER]);
            translate([0, 0, -50]) linear_extrude(100) plan(cs, ER);
        }
        round_tool();
    }
    // the snap tongue keeps its square top, for the bump
    translate([W / 2 - SNAP_W / 2 - 1, y_end - WALL - 2, 5]) cube([SNAP_W + 2, WALL + 2, LIP_H]);
}
module k_half() {
    y_end = E0 + D_K;
    crush_ribs(A_K);
    // snap bump on the tongue: it hooks over the edge of the T half's back
    translate([W / 2 - SNAP_W / 2 + 0.6, y_end - WALL, T_T + 2 * HG + 0.15]) rotate([90, 0, 90])
        linear_extrude(SNAP_W - 1.2) polygon([[0.01, 0], [-SNAP_B, 0.6], [-SNAP_B, SNAP_TOP], [0.01, SNAP_TOP]]);
    intersection() { k_env(); k_raw(); }
}
module k_raw() {
    y_end = E0 + D_K;
    difference() {
        union() {
            translate([0, 0, -T_K]) cube([W, y_end, T_K]);
            yz(0, W) k_nose_2d();
            translate([0, y_end - WALL, -0.01]) cube([W, WALL, LIP_H + 0.01]);       // lip, rear foot
        }
        translate([WALL, E0 + WALL, -KPD]) cube([kpw, kpd, KPD + 1]);                // pocket
        pin_holes(A_K);
        for (x = LINK_X) yz(x, x + SLOT_W) k_slot_2d();
        // long edges on the bed
        chamfer_y(0, 1, -RK, y_end, -T_K);  chamfer_y(W, -1, -RK, y_end, -T_K);
        chamfer_x(y_end, -1, 0, W, -T_K);
        // finger notches in the side walls, to lift the keyboard out
        for (x = [-1, W - WALL - 1]) translate([x, E0 + D_K / 2, 0]) rotate([0, 90, 0]) cylinder(r = 12, h = WALL + 2);
        // snap tongue: two slits, and the tongue is thinner than the lip
        for (x = [W / 2 - SNAP_W / 2 - 1, W / 2 + SNAP_W / 2])
            translate([x, y_end - WALL - 1, -6]) cube([1, WALL + 2, LIP_H + 7]);
        translate([W / 2 - SNAP_W / 2, y_end - WALL + SNAP_T, -6]) cube([SNAP_W, WALL, LIP_H + 7]);
        // slots through the floor for the prop's feet
        for (a = ANGLES, x = ARM_X)
            translate([x - 1.3, tip_k(a)[0] - 6, -T_K - 1]) cube([AW + 2.6, 8, K_FLOOR + 2]);   // wide enough for the click bumps
    }
}

// ---- T half: tablet holder. Drawn flat, on the -Y side. ----
WEB_BAR = 4;  WEB_CELL = 15;
module t_env() {
    y_free = -E0 - D_T;
    cs = [[CR_TN, RT - CR_TN, CR_TN], [W - CR_TN, RT - CR_TN, CR_TN], [CR, y_free + CR, CR], [W - CR, y_free + CR, CR]];
    minkowski() {
        intersection() {
            yz(ER, W - ER) offset(delta = -ER) union() { t_nose_2d(); translate([y_free, -T_T]) square([-y_free, T_T]); }
            translate([0, 0, -50]) linear_extrude(100) plan(cs, ER);
        }
        round_tool();
    }
}
module t_half() { crush_ribs(B_T);  intersection() { t_env(); t_raw(); } }
module t_raw() {
    y_free = -E0 - D_T;  y_low = -E0 - wb;  z_floor = -T_T + T_FLOOR;
    usb_x0 = px0 + tpw - 0.3 - USB_C - USB_HW;
    difference() {
        union() {
            translate([0, y_free, -T_T]) cube([W, D_T + E0, T_T]);
            yz(0, W) t_nose_2d();
        }
        for (x = LINK_X) yz(x, x + SLOT_W) t_slot_2d();
        translate([px0, y_free - 1, z_floor]) cube([tpw, tpd + 1, TPD]);              // pocket
        translate([px0 + OV, y_free - 1, -LIP - 0.01]) cube([tpw - 2 * OV, tpd + 1 - OV, LIP + 1]);
        translate([usb_x0, y_low - OV - 0.01, z_floor]) cube([2 * USB_HW, wb + OV + E0 + RT + 1, T_T]);   // plug: through the nose
        pin_holes(B_T);
        prop_slot();
        // web: square holes in the floor, between the prop's pivot and the free edge
        wx0 = px0 + 10;  wx1 = W - px0 - 10;  wy0 = y_free + 10;  wy1 = -SP - 8;
        nx = floor((wx1 - wx0 + WEB_BAR) / (WEB_CELL + WEB_BAR));
        ny = floor((wy1 - wy0 + WEB_BAR) / (WEB_CELL + WEB_BAR));
        ox = (wx1 - wx0 - nx * WEB_CELL - (nx - 1) * WEB_BAR) / 2;
        oy = (wy1 - wy0 - ny * WEB_CELL - (ny - 1) * WEB_BAR) / 2;
        for (i = [0 : nx - 1], j = [0 : ny - 1])
            translate([wx0 + ox + i * (WEB_CELL + WEB_BAR), wy0 + oy + j * (WEB_CELL + WEB_BAR), -T_T - 1])
                cube([WEB_CELL, WEB_CELL, T_FLOOR + 2]);
        // long edges on the bed
        chamfer_y(0, 1, y_free, RT, -T_T);  chamfer_y(W, -1, y_free, RT, -T_T);
        chamfer_x(y_free, 1, 0, W, -T_T);
    }
}

// ---- Prop: a solid panel, drawn stowed in the T half's frame ----
GAPP = 0.4;   // gap round the prop in its opening
// The outline of the prop, seen from the back, grown by d.
module prop_2d(d) {
    y_edge = -TIP_S - FOOT_L;
    translate([PX[0] - d, -SP - d]) square([PX[1] - PX[0] + 2 * d, SP + y_edge + 2 * d]);          // panel
    for (x = ARM_X) translate([x - d, y_edge - d]) square([AW + 2 * d, FOOT_L + 2 * d]);           // feet
    translate([EAR_X[0], -SP - d]) square([EAR_X[1] - EAR_X[0], EAR_L + 2 * d]);                   // ears
}
module prop_body() {
    translate([0, 0, -T_T]) linear_extrude(T_FLOOR) difference() {
        prop_2d(0);
        translate([W / 2, -TIP_S - FOOT_L]) circle(NOTCH_R);                                       // finger notch
        for (x = [PX[0] + CLK_W, PX[1] - CLK_W - CLK_S]) translate([x, -TIP_S - CLK_L]) square([CLK_S, CLK_L + 1]);   // slits
    }
    for (x = PX) translate([x, CLK_Y, PZ]) sphere(CLK_B, $fn = 20);       // click bumps
}
module prop() {
    difference() {
        union() { prop_body();  x_cyl([-SP, PZ], T_FLOOR / 2, EAR_X[0], EAR_X[1]); }   // round end at the pivot
        for (x = [EAR_X[0] - 1, EAR_X[1] - AXLE_IN]) x_cyl([-SP, PZ], AXLE_EAR / 2, x, x + AXLE_IN + 1, $fn = 24);   // axle holes
    }
}
module prop_slot() {
    z1 = T_FLOOR + GAPP;   // the opening is a little higher than the prop
    translate([0, 0, -T_T - 1]) linear_extrude(z1 + 1) prop_2d(GAPP);
    translate([px0, -SP - T_FLOOR / 2 - GAPP, -T_T - 1]) cube([W - 2 * px0, T_FLOOR / 2 + EAR_L + 2 * GAPP, z1 + 1]);   // ears: the gap at their ends is EAR_GAP
    for (x = PX) translate([x, CLK_Y, PZ]) sphere(CLK_D, $fn = 20);       // dimples for the click
    // axle holes through the side walls
    x_cyl([-SP, PZ], AXLE_WALL / 2, -1, EAR_X[0], $fn = 24);  x_cyl([-SP, PZ], AXLE_WALL / 2, EAR_X[1], W + 1, $fn = 24);
}
module prop_at(turn) { translate([0, -SP, PZ]) rotate([turn, 0, 0]) translate([0, SP, -PZ]) prop(); }

// ---- Pin, in its print frame. Four are needed. It lies on a flat. ----
PIN_LEN = LINK_X[0] + SLOT_W + PIN_IN - 0.5;
module pin_part() {
    cut = PIN_FLAT;
    translate([0, 0, cut]) difference() {
        union() {
            translate([-(HEAD_T - HEAD_IN), 0, 0]) rotate([0, 90, 0]) cylinder(d = HEAD_D, h = HEAD_T);
            rotate([0, 90, 0]) cylinder(d = PIN_DIA, h = PIN_LEN);
        }
        translate([-5, -HEAD_D, -HEAD_D - cut]) cube([PIN_LEN + 10, 2 * HEAD_D, HEAD_D]);
    }
}

// ---- Stand-ins ----
module tablet() { translate([px0 + 0.3, -E0 - wb - 0.3 - th, -T_T + T_FLOOR]) cube([tw, th, TAB_T]); }
module keyboard_folded() { translate([WALL + 0.35, E0 + WALL + 0.5, -KPD]) cube([kw, kd, KB_T]); }
module pins_in(c) { x_cyl(c, PIN_DIA / 2, 0, PIN_LEN);  x_cyl(c, PIN_DIA / 2, W - PIN_LEN, W); }

module view_closed() {
    translate([0, 0, T_K]) {
        k_half(); keyboard_folded(); pins_in(A_K); links_at(0);
        posed(360, 0) { t_half(); tablet(); prop(); pins_in(B_T); }
    }
}
// In the stand the K half lies on the tip of its nose and on its lip, so it slopes.
TILT = atan(LIP_H / (E0 + D_K));
module view_stand(wedge = SCREEN) {
    rotate([TILT, 0, 0]) translate([W, 0, 0]) rotate([0, 180, 0]) {
        k_half(); pins_in(A_K); links_at(A_ST);
        posed(wedge) { t_half(); tablet(); prop_at(prop_turn(wedge)); pins_in(B_T); }
    }
    translate([(W - KB_OPEN[0]) / 2, -45 - KB_OPEN[1], 0]) cube(KB_OPEN);
}

chk = 45;      // wedge for the checks
chk_a = -1;    // link angle for the checks; -1 means A_ST
ca = chk_a < 0 ? A_ST : chk_a;
if (view == "stand") view_stand();
else if (view == "closed") view_closed();
else if (view == "k_half") translate([0, 0, T_K]) k_half();
else if (view == "t_half") translate([0, 0, T_T]) { t_half(); prop(); }
else if (view == "link") link();
else if (view == "pin") pin_part();
// Collision checks: each must be empty.
else if (view == "x_swing") intersection() { k_half(); posed(chk, ca) t_half(); }
else if (view == "x_link") intersection() { union() { k_half(); posed(chk, ca) t_half(); } links_at(ca); }
else if (view == "x_prop") intersection() { union() { k_half(); posed(chk) t_half(); } posed(chk) prop_at(prop_turn(chk)); }
else if (view == "x_stow") intersection() { t_half(); prop(); }
else if (view == "x_stowk") intersection() { k_half(); posed(360, 0) prop(); }
