// cyberdeck1 rev 0.2: first geometry, for review. Portrait only.
//
// Changes from rev 0.1 (refer to ../DESIGN-0.2.md):
//   - The hinge is a barrel 22 mm across, close to the thickness of the closed case, on
//     a 6 mm pin over the whole width.
//   - No tapers. Each half reaches the barrel with full-thickness tabs, where the other
//     half has notches. Nothing overhangs the print bed, so no part needs supports.
//   - In the stand, the flat back of the T half rests on a 45 degree chamfer on the K half.
//   - The prop is a U-shaped frame. It lies in a slot in the back of the T half and
//     prints there, in place, on two cone pivots. Its feet go into slots through the
//     floor of the K half.
//   - The back of the T half is a web, not a solid floor.
//   - A snap tongue on the K half's lip holds the case shut.
//   - The outer edges have chamfers.
//
// Frames: X is the hinge axis. K half: body at +Y, inner face at z = 0, material at
// z < 0. T half, drawn flat: body at -Y, inner face at z = 0. The pin's axis is at
// y = 0, z = HG in both. "wedge" is the angle between the halves; 360 is closed.
//
// Make a view:  openscad-nightly -D 'view="stand"' -o view.stl case02.scad

view = "stand";   // stand | closed | k_half | t_half | pin | x_* (checks)

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
EDGE = 1.5;                   // chamfer on the outer edges

// ---- Hinge ----
HG  = 0.25;       // the pin's axis is this far outside each inner face
RB  = 11;         // barrel radius
PIN_D = 6.4;  PIN_DIA = 6.0;  RIB = 0.25;  PIN_X0 = 1.6;
FOOT = RB + HG;   // the barrel is the front foot of the stand; the K half's lip is the rear foot
CH  = 4;          // size of the chamfer on the K half that the T half's back rests on
// Where the bodies start. The T half's back, at SCREEN degrees, lies on the K half's chamfer.
WS  = SCREEN - 0.3;
E0  = ((T_T + HG) + (T_K + HG) * cos(WS)) / sin(WS) - CH;
NT  = E0 + wb;    // in the K half's bands the T half is cut back to here, to pass the K half
// Bands along the hinge, [start, length].
T_BANDS = [[0, 28], [56.4, 27.6], [135.2, W - 135.2]];
K_BANDS = [[28.4, 27.6], [84.4, 27.6]];
GAP     = [112.4, 22.4];   // no barrel here: room for the USB-C plug and its cable

// ---- Prop ----
SP    = 150;      // pivot: distance from the hinge axis, along the T half
TIP_S = 30.6;     // where the feet lie when the prop is stowed
PL    = SP - TIP_S;           // length from the pivot to the tips of the feet
AW    = 8;        // width of each arm
PZ    = -T_T + T_FLOOR / 2;   // height of the pivot axis, in the T half's frame
ARM_X = [px0 + 0.4, W - px0 - 0.4 - AW];
BAR_S = [TIP_S + 4.4, TIP_S + 12.4];   // the cross bar, behind the feet
ANGLES = [45, 55, 65];        // screen angles that have slots for the feet

function rot(p, a) = [p[0] * cos(a) - p[1] * sin(a), p[0] * sin(a) + p[1] * cos(a)];
function t_shift(wedge) = [0, HG] - rot([0, HG], 180 - wedge);
function to_k(p, wedge) = t_shift(wedge) + rot(p, 180 - wedge);   // T frame -> K frame
// Prop: direction of the arms in the K frame, with the feet 1.5 mm into the K half's floor.
function pivot_k(wedge) = to_k([-SP, PZ], wedge);
function prop_a(wedge) = asin(((-T_K + 1.5) - pivot_k(wedge)[1]) / PL);
function tip_k(wedge) = pivot_k(wedge) + PL * [cos(prop_a(wedge)), sin(prop_a(wedge))];
// The same direction in the T half's frame, as a turn about the pivot from the stowed pose.
function prop_turn(wedge) = prop_a(wedge) - (180 - wedge);

echo(W = W, D_K = D_K, D_T = D_T, T_K = T_K, T_T = T_T, E0 = E0, NT = NT, PL = PL);
echo(feet_y = [for (a = ANGLES) tip_k(a)[0]], prop_turn = [for (a = ANGLES) prop_turn(a)]);

module x_cyl(p, r, x0, x1) { translate([x0, p[0], p[1]]) rotate([0, 90, 0]) cylinder(r = r, h = x1 - x0); }
module posed(wedge) { s = t_shift(wedge); translate([0, s[0], s[1]]) rotate([180 - wedge, 0, 0]) children(); }

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

module pin_holes() {
    x_cyl([0, HG], PIN_D / 2, PIN_X0, W + 1);
    translate([-1, 0, HG]) rotate([0, 90, 0]) cylinder(d = 1.6, h = PIN_X0 + 2, $fn = 16);
}
module crush_ribs(b) {
    for (a = [90, 210, 330]) translate([0, 0, HG]) rotate([a, 0, 0])
        translate([b[0] + 3, -0.3, PIN_D / 2 - RIB]) cube([b[1] - 6, 0.6, RIB + 0.3]);
}

// ---- K half: keyboard tray ----
SNAP_W = 20;  SNAP_T = 1.2;  SNAP_B = 1.2;     // snap tongue: width, thickness, bump
module k_half() {
    y_end = E0 + D_K;
    for (b = K_BANDS) crush_ribs(b);
    difference() {
        union() {
            translate([0, E0, -T_K]) cube([W, D_K, T_K]);
            translate([0, y_end - WALL, -0.01]) cube([W, WALL, FOOT + 0.01]);        // lip, rear foot
            for (b = K_BANDS) {
                translate([b[0], -RB, -T_K]) cube([b[1], RB + E0 + 0.01, T_K]);      // tab, down to the bed
                x_cyl([0, HG], RB, b[0], b[0] + b[1]);                               // barrel
            }
            translate([GAP[0], 0, -T_K]) cube([GAP[1], E0 + 0.01, T_K]);             // tab under the plug
            // snap bump on the tongue: it hooks over the edge of the T half's back
            translate([W / 2 - SNAP_W / 2 + 0.6, y_end - WALL, T_T + 2 * HG + 0.15]) rotate([90, 0, 90])
                linear_extrude(SNAP_W - 1.2) polygon([[0.01, 0], [-SNAP_B, 0.6], [-SNAP_B, 0.9], [0.01, 0.9 + SNAP_B]]);
        }
        translate([WALL, E0 + WALL, -KPD]) cube([kpw, kpd, KPD + 1]);                // pocket
        pin_holes();
        // the chamfer that the T half's back rests on, in the T half's bands
        for (b = T_BANDS) chamfer_x(E0, 1, b[0] - 0.2, b[0] + b[1] + 0.2, -T_K, CH);
        // comfortable edges
        chamfer_y(0, 1, E0, y_end, -T_K);  chamfer_y(W, -1, E0, y_end, -T_K);
        chamfer_x(y_end, -1, 0, W, -T_K);
        // finger notches in the side walls, to lift the keyboard out
        for (x = [-1, W - WALL - 1]) translate([x, E0 + D_K / 2, 0]) rotate([0, 90, 0]) cylinder(r = 12, h = WALL + 2);
        // snap tongue: two slits, and the tongue is thinner than the lip
        for (x = [W / 2 - SNAP_W / 2 - 1, W / 2 + SNAP_W / 2])
            translate([x, y_end - WALL - 1, -6]) cube([1, WALL + 2, FOOT + 7]);
        translate([W / 2 - SNAP_W / 2, y_end - WALL + SNAP_T, -6]) cube([SNAP_W, WALL, FOOT + 7]);
        // slots through the floor for the prop's feet
        for (a = ANGLES, x = ARM_X)
            translate([x - 0.5, tip_k(a)[0] - 6, -T_K - 1]) cube([AW + 1, 8, K_FLOOR + 2]);
    }
}

// ---- T half: tablet holder. Drawn flat, on the -Y side. ----
WEB_BAR = 4;  WEB_CELL = 15;
module t_half() {
    y_free = -E0 - D_T;  y_low = -E0 - wb;  z_floor = -T_T + T_FLOOR;
    usb_x0 = px0 + tpw - 0.3 - USB_C - USB_HW;
    difference() {
        union() {
            translate([0, y_free, -T_T]) cube([W, D_T, T_T]);
            for (b = T_BANDS) {
                translate([b[0], -E0 - 0.01, -T_T]) cube([b[1], E0 + 0.01, T_T]);     // tab
                intersection() {                                                      // barrel, flat on the bed
                    x_cyl([0, HG], RB, b[0], b[0] + b[1]);
                    translate([b[0], -RB - 1, -T_T]) cube([b[1], 2 * RB + 2, 2 * RB + 2]);
                }
            }
        }
        // cut back where the K half's tabs are, and at the plug
        for (b = concat(K_BANDS, [GAP])) translate([b[0] - 0.2, -NT, -50]) cube([b[1] + 0.4, NT + 20, 100]);
        translate([px0, y_free - 1, z_floor]) cube([tpw, tpd + 1, TPD]);              // pocket
        translate([px0 + OV, y_free - 1, -LIP - 0.01]) cube([tpw - 2 * OV, tpd + 1 - OV, LIP + 1]);
        translate([usb_x0, y_low - OV - 0.01, z_floor]) cube([2 * USB_HW, wb + OV + 1, T_T]);
        pin_holes();
        prop_slot();
        // web: square holes in the floor, between the prop's arms
        wx0 = ARM_X[0] + AW + 7;  wx1 = ARM_X[1] - 7;  wy0 = y_free + 10;  wy1 = -BAR_S[1] - 7;
        nx = floor((wx1 - wx0 + WEB_BAR) / (WEB_CELL + WEB_BAR));
        ny = floor((wy1 - wy0 + WEB_BAR) / (WEB_CELL + WEB_BAR));
        ox = (wx1 - wx0 - nx * WEB_CELL - (nx - 1) * WEB_BAR) / 2;
        oy = (wy1 - wy0 - ny * WEB_CELL - (ny - 1) * WEB_BAR) / 2;
        for (i = [0 : nx - 1], j = [0 : ny - 1])
            translate([wx0 + ox + i * (WEB_CELL + WEB_BAR), wy0 + oy + j * (WEB_CELL + WEB_BAR), -T_T - 1])
                cube([WEB_CELL, WEB_CELL, T_FLOOR + 2]);
        // comfortable edges
        chamfer_y(0, 1, y_free, 0, -T_T);  chamfer_y(W, -1, y_free, 0, -T_T);
        chamfer_x(y_free, 1, 0, W, -T_T);
    }
}

// ---- Prop: a U-shaped frame, drawn stowed in the T half's frame ----
GAPP = 0.4;   // gap round the prop in its slot
module prop() {
    for (x = ARM_X) {
        translate([x, -SP, -T_T]) cube([AW, PL, T_FLOOR]);
        x_cyl([-SP, PZ], T_FLOOR / 2, x, x + AW);                         // round end at the pivot
    }
    translate([ARM_X[0], -BAR_S[1], -T_T]) cube([ARM_X[1] + AW - ARM_X[0], BAR_S[1] - BAR_S[0], T_FLOOR]);
    // cone pivots, pointing outward into the T half
    translate([ARM_X[0], -SP, PZ]) rotate([0, -90, 0]) cylinder(r1 = 1.3, r2 = 0.3, h = 1.1, $fn = 24);
    translate([ARM_X[1] + AW, -SP, PZ]) rotate([0, 90, 0]) cylinder(r1 = 1.3, r2 = 0.3, h = 1.1, $fn = 24);
}
module prop_slot() {
    z1 = T_FLOOR + GAPP;   // the slot is a little higher than the prop, where the lower wall is above it
    for (x = ARM_X) translate([x - GAPP, -SP - T_FLOOR / 2 - GAPP, -T_T - 1])
        cube([AW + 2 * GAPP, PL + T_FLOOR / 2 + 2 * GAPP, z1 + 1]);
    translate([ARM_X[0], -BAR_S[1] - GAPP, -T_T - 1])
        cube([ARM_X[1] + AW - ARM_X[0], BAR_S[1] - BAR_S[0] + 2 * GAPP, z1 + 1]);
    // sockets for the cone pivots
    translate([ARM_X[0] - GAPP + 0.01, -SP, PZ]) rotate([0, -90, 0]) cylinder(r1 = 1.6, r2 = 0.6, h = 1.1, $fn = 24);
    translate([ARM_X[1] + AW + GAPP - 0.01, -SP, PZ]) rotate([0, 90, 0]) cylinder(r1 = 1.6, r2 = 0.6, h = 1.1, $fn = 24);
}
module prop_at(turn) { translate([0, -SP, PZ]) rotate([turn, 0, 0]) translate([0, SP, -PZ]) prop(); }

// ---- Pin, in its print frame ----
module pin_part() {
    len = W - PIN_X0 - 0.5;  cut = PIN_DIA / 2 - 0.6;
    translate([0, 0, cut]) difference() {
        rotate([0, 90, 0]) cylinder(d = PIN_DIA, h = len);
        translate([-1, -PIN_DIA, -PIN_DIA - cut]) cube([len + 2, 2 * PIN_DIA, PIN_DIA]);
    }
    for (x = [0, len]) translate([x, 0, 0]) cylinder(r = 7, h = 0.2);   // ears; cut them off
}

// ---- Stand-ins ----
module tablet() { translate([px0 + 0.3, -E0 - wb - 0.3 - th, -T_T + T_FLOOR]) cube([tw, th, TAB_T]); }
module keyboard_folded() { translate([WALL + 0.35, E0 + WALL + 0.5, -KPD]) cube([kw, kd, KB_T]); }
module pin_in() { x_cyl([0, HG], PIN_DIA / 2, PIN_X0 + 0.3, W); }

module view_closed() {
    translate([0, 0, T_K]) { k_half(); keyboard_folded(); pin_in(); posed(360) { t_half(); tablet(); prop(); } }
}
module view_stand(wedge = SCREEN) {
    translate([W, 0, FOOT]) rotate([0, 180, 0]) {
        k_half(); pin_in();
        posed(wedge) { t_half(); tablet(); prop_at(prop_turn(wedge)); }
    }
    translate([(W - KB_OPEN[0]) / 2, -25 - RB - KB_OPEN[1], 0]) cube(KB_OPEN);
}

chk = 45;   // angle for the x_swing check
if (view == "stand") view_stand();
else if (view == "closed") view_closed();
else if (view == "k_half") translate([0, 0, T_K]) k_half();
else if (view == "t_half") translate([0, 0, T_T]) { t_half(); prop(); }
else if (view == "pin") pin_part();
// Collision checks: each must be empty.
else if (view == "x_swing") intersection() { k_half(); posed(chk) t_half(); }
else if (view == "x_prop") intersection() { union() { k_half(); posed(chk) t_half(); } posed(chk) prop_at(prop_turn(chk)); }
else if (view == "x_stow") intersection() { t_half(); prop(); }
else if (view == "x_stowk") intersection() { k_half(); posed(360) prop(); }
