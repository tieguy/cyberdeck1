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
//   openscad-nightly -D 'orient="landscape"' -D 'hinge="spine"' -D 'view="stand"' -o view.stl case.scad
//
// Two hinges are drawn, for comparison:
//   arms:  one pin in the plane of the inner faces. The bodies of the halves start E from
//          the pin, on arms, so that they fit back to back in the stand.
//   bevel: the same pin as "arms". Each half tapers to the pin over its whole width, like
//          a door hinge on two wedges. In the stand the two tapers lie on each other.
//   tabs:  the same pin as "arms", but the arms are wide tabs that fill the whole width
//          of the case. Each half has tabs where the other has notches.
//   spine: two pins and a spine between them, like the spine of a book. Closed, the spine
//          covers the hinge side. In the stand it lies flat on the back of the K half.
//          In this variant the edge of each body on the hinge side is at y = 0.

orient = "portrait";    // portrait | landscape. Rev 0.1 is the portrait case.
hinge  = "bevel";       // bevel | spine | tabs | arms
view   = "stand";       // stand | closed | k_half | t_half | bail | pin

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
spine   = hinge == "spine";
bevel   = hinge == "bevel";
RK      = bevel ? 4 : 5;   // knuckle radius. The knuckles are also the front feet of the stand.
PIN_D   = bevel ? 3.3 : 5.2;
// Bevel hinge: the pin's axis is HG outside the inner face of each half, so the closed
// halves are 2 * HG apart at the hinge. On the test piece, with the axis in the plane of
// the inner faces, the faces met at the hinge before they were parallel.
HG      = bevel ? 0.25 : 0;
KN      = 12;      // knuckle length

// K half
K_FLOOR = 2;
KPD     = KB_T + 0.5;            // pocket depth
T_K     = K_FLOOR + KPD;         // thickness
kpw     = kw + 0.7;              // pocket size
kpd     = kd + 1.0;
W       = kpw + 2 * WALL;        // case size along the hinge
D_K     = kpd + 2 * WALL;        // K half size away from the hinge
FOOT    = RK + HG; // height of the lip on the K half's free edge. It closes the tablet
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
OV_BTN  = 2.5;     // how far the lip on the touch-button edge covers the bezel. The tablet's
                   // rounded edge takes about 1 mm of this.
USB_C   = 19.5;    // USB-C port: from the tablet's corner to the middle of the port.
                   // Estimated from a photo of the fit test, 2026-11-20.
USB_HW  = 11;      // half the width of the cut-out for the port

// One-pin hinges: distance from the pin to the bodies of the halves. For the bevel hinge
// it is the length at which the two tapers together fill the angle of the stand.
// Each taper is a plane through the pin's axis.
BEV_C   = (T_K + T_T + 2 * HG) / tan(SCREEN - 0.3);
E       = bevel ? (BEV_C + sqrt(BEV_C * BEV_C + 4 * (T_K + HG) * (T_T + HG))) / 2 : 32;
function taper_z(y, thick) = HG - y * (thick + HG) / E;   // outer surface of a taper
EB      = spine ? 0 : E;   // where the bodies start
NECK    = 8;       // bevel hinge: how far from the pin a knuckle joins its taper
NOTCH   = NECK + 3;   // bevel hinge: depth of the notch for a knuckle of the other half.
                      // The 3 mm keeps the other half's taper clear of the knuckle's neck.

// Hinge: two sets of knuckles. In portrait they stay clear of the USB-C port.
HX    = landscape ? [10, W - 10 - 2 * KN - 0.4] : [10, W - 40 - 2 * KN - 0.4];
// One-pin hinges: the bands along the hinge, as [start, length], that each half fills
// between its body and the pin.
QW = W / 4;
// The bevel hinge has three knuckles and leaves the USB-C port's side free of them.
K_BANDS = spine ? [] : bevel ? [[0.27 * W + 0.2, 0.25 * W - 0.4]] : hinge == "tabs" ? [[QW + 0.2, QW - 0.4], [3 * QW + 0.2, QW - 0.2]]
                                       : [[HX[0], KN], [HX[1], KN]];
T_BANDS = spine ? [] : bevel ? [[0, 0.27 * W - 0.2], [0.52 * W + 0.2, 0.22 * W - 0.4]] : hinge == "tabs" ? [[0, QW - 0.2], [2 * QW + 0.2, QW - 0.4]]
                                       : [[HX[0] + KN + 0.4, KN], [HX[1] + KN + 0.4, KN]];

// Spine hinge. Pin 1 joins the spine to the K half. It is outside the K half's outer face,
// so that the spine can lie on that face. Pin 2 joins the spine to the T half.
RS      = 2.75;                      // knuckle radius
SP_HOLE = 2.0;                       // for a pin of 1.75 mm filament
SP_T    = 2.4;                       // thickness of the spine's plate
PY      = -RS - 0.4;                 // both pins, closed: distance in front of the walls
P1      = [PY, -T_K - RS - 0.4];     // pin 1, fixed to the K half
P2C     = [PY, T_T - RS];            // pin 2 when the case is closed
LS      = P2C[1] - P1[1];            // spine length between the pins
P2S     = [P1[0] + LS, P1[1]];       // pin 2 in the stand: the spine lies on the K half
P2L     = [-PY, RS - T_T];           // pin 2 in the T half's own frame
// Knuckle bands along the hinge: [lug of a half, spine edge] at each end of the spine.
SX0     = HX[0];
SX1     = HX[1] + KN + 0.4;
function rot(p, a) = [p[0] * cos(a) - p[1] * sin(a), p[0] * sin(a) + p[1] * cos(a)];
// Where the T half's frame goes when the halves are "wedge" degrees apart.
function t_shift(wedge) = spine ? P2S - rot(P2L, 180 - wedge) : [0, HG] - rot([0, HG], 180 - wedge);

// ---- Bail ----
BAIL_R  = 2.5;     // radius of the cross bar
GROOVE  = 1.5;     // depth of the grooves in the T half's outer face
BT      = 4;       // thickness of the bail's arms
PIV_Z   = -T_K + 6;                 // pivot holes in the K half's side walls
S0      = EB + 0.55 * D_T;          // main groove: distance from the T half's hinge line
GSTEP   = 12;                       // spacing of the other grooves

// Centre of the cross bar when it sits in a groove at distance s, with the
// halves "wedge" degrees apart. [y, z] in the model frame.
function bar_centre(s, wedge) =
    t_shift(wedge) + rot([-s, -T_T - (BAIL_R - GROOVE)], 180 - wedge);

// The bail is square to the T half in the main position.
C0     = bar_centre(S0, SCREEN);
BAIL_L = (PIV_Z - C0[1]) / cos(SCREEN);
PIV_Y  = C0[0] + BAIL_L * sin(SCREEN);

echo(orient = orient, W = W, D_K = D_K, D_T = D_T, T_K = T_K, T_T = T_T, wb = wb);
echo(hinge = hinge, BAIL_L = BAIL_L, PIV_Y = PIV_Y, LS = LS);
if (!spine) echo(arms_stop_angle = atan(T_T / E) + atan(T_K / E));

// Bevel hinge: the pin. It goes in from the side of the USB-C port.
PIN_X0   = 1.6;                 // closed end of the hole
PIN_X1   = 0.74 * W - 0.2;      // open end: the end of the last knuckle
PIN_DIA  = 2.9;                // measured on the test piece: 2.9 fits, 3.0 is too big
RIB      = 0.25;                // how far each crush rib stands into the hole

// Three ribs in the K half's knuckle grip the pin. The T half's knuckles turn on it.
module crush_ribs(b) {
    for (a = [90, 210, 330]) rotate([a, 0, 0])
        translate([b[0] + 2, -0.3, PIN_D / 2 - RIB]) cube([b[1] - 4, 0.6, RIB + 0.3]);
}
module crush_ribs_at(b) { translate([0, 0, HG]) crush_ribs(b); 
}

// The pin in its print frame: a flat side on the bed.
module pin_part() {
    len = PIN_X1 - PIN_X0 - 0.5;
    cut = PIN_DIA / 2 - 0.3;
    translate([0, 0, cut]) difference() {
        rotate([0, 90, 0]) cylinder(d = PIN_DIA, h = len, $fn = 32);
        translate([-1, -PIN_DIA, -PIN_DIA - cut]) cube([len + 2, 2 * PIN_DIA, PIN_DIA]);
    }
}

module pin_holes() {
    if (bevel) {
        // The hole is closed at x = 0, so the pin cannot leave that way. A small hole
        // through the closed end lets a paper clip push the pin out.
        translate([PIN_X0, 0, HG]) rotate([0, 90, 0]) cylinder(d = PIN_D, h = PIN_X1 - PIN_X0 + 1);
        translate([-1, 0, HG]) rotate([0, 90, 0]) cylinder(d = 1.6, h = PIN_X0 + 2, $fn = 16);
    } else if (!spine) translate([-1, 0, 0]) rotate([0, 90, 0]) cylinder(d = PIN_D, h = W + 2);
}

module x_cyl(p, r, x0, x1) {   // cylinder along X at [y, z] = p
    translate([x0, p[0], p[1]]) rotate([0, 90, 0]) cylinder(r = r, h = x1 - x0);
}

// Spine hinge: a lug that joins a knuckle at pin p to the wall of a half at y = 0.
// z0 is the bottom of the strip of wall that the lug grows from.
module lug(p, z0, x0) {
    hull() {
        x_cyl(p, RS, x0, x0 + KN);
        translate([x0, -0.1, z0]) cube([KN, 0.1, 2 * RS]);
    }
}

// Dovetail rail on the K half's hinge-side wall, and the matching slot in a lug.
// xc is the centre along the hinge. "grow" widens the outline, for the slot.
RAIL_D = 2.4;      // how far the rail stands out from the wall
RAIL_H = 8;        // length of the rail, from the outer face
RAIL_TOP = -T_K + RAIL_H;
module rail(xc, grow, z0 = -T_K, z1 = RAIL_TOP) {
    translate([xc, 0, z0]) linear_extrude(z1 - z0)
        polygon([[-2 - grow, 0.01], [2 + grow, 0.01],
                 [3.2 + grow, -RAIL_D - grow], [-3.2 - grow, -RAIL_D - grow]]);
}

// Lug for pin 1: a separate part. It slides onto a rail from the outer-face side. A
// shoulder hooks over the edge of the outer face. In the stand the K half is upside
// down, so the lug sits on the K half like a saddle and the load presses it on.
module k_lug(x0) {
    difference() {
        union() {
            hull() {
                x_cyl(P1, RS, x0, x0 + KN);
                translate([x0, -2 * RS - 0.4, RAIL_TOP - 0.1]) cube([KN, 2 * RS + 0.4 - 0.1, 0.1]);
            }
            translate([x0, -0.11, -T_K - RS]) cube([KN, 3.11, RS - 0.15]);   // shoulder
        }
        rail(x0 + KN / 2, 0.15, -T_K - 0.15, RAIL_TOP + 1);
        // the body stays clear of the K half's wall and outer face
        translate([x0 - 1, 0, -T_K - 0.15]) cube([KN + 2, 10, T_K + 1]);
        x_cyl(P1, SP_HOLE / 2, x0 - 1, x0 + KN + 1);
    }
}
module k_lugs() { for (x0 = [SX0, SX1]) k_lug(x0); }

// Spine, drawn closed: it stands in front of the hinge-side walls.
module spine_part() {
    difference() {
        union() {   // a thin plate with a barrel at each pin
            x_cyl(P1, RS, SX0 + KN + 0.4, SX1 - 0.4);
            x_cyl(P2C, RS, SX0 + KN + 0.4, SX1 - 0.4);
            translate([SX0 + KN + 0.4, PY - SP_T / 2, P1[1]]) cube([SX1 - SX0 - KN - 0.8, SP_T, LS]);
        }
        x_cyl(P1, SP_HOLE / 2, 0, W);
        x_cyl(P2C, SP_HOLE / 2, 0, W);
    }
}
module spine_at(folded) {
    if (folded) translate([0, P1[0], P1[1]]) rotate([-90, 0, 0]) translate([0, -P1[0], -P1[1]]) spine_part();
    else spine_part();
}

// Bevel hinge, drawn for the K half (+Y side). The T half uses a mirror image.
module nose(thick) {      // the taper: full thickness at E, nothing at the pin
    // The tip stops 2 mm from the pin's axis, so that it is not a knife edge.
    rotate([90, 0, 90]) linear_extrude(W)
        polygon([[2, 0], [E, 0], [E, -thick], [2, taper_z(2, thick)]]);
}
module bevel_knuckle(b, thick) {
    hull() {
        translate([b[0], 0, HG]) rotate([0, 90, 0]) cylinder(r = RK, h = b[1]);
        translate([b[0], NECK, taper_z(NECK, thick) + 0.05]) cube([b[1], 0.5, -taper_z(NECK, thick) - 0.1]);
    }
}
module bevel_notch(b) {   // room for a knuckle of the other half
    translate([b[0] - 0.2, -RK - 1, -40]) cube([b[1] + 0.4, RK + 1 + NOTCH, 80]);
}

module knuckle(x0, thick, len = KN) {
    translate([x0, 0, 0]) {
        rotate([0, 90, 0]) cylinder(r = RK, h = len);
        translate([0, -RK, -thick]) cube([len, 2 * RK, thick]);
    }
}

// ---- K half: keyboard pocket, open at the inner face ----
module k_half() {
    if (bevel) for (b = K_BANDS) crush_ribs_at(b);
    difference() {
        union() {
            translate([0, EB, -T_K]) cube([W, D_K, T_K]);
            translate([0, EB + D_K - WALL, -0.01]) cube([W, WALL, FOOT + 0.01]);  // lip and foot
            if (spine) {
                for (x0 = [SX0, SX1]) rail(x0 + KN / 2, 0);   // the lugs for pin 1 slide on these
                // front feet of the stand. The T half has notches for them.
                for (x = [0, W - 4]) translate([x, 0, -0.01]) cube([4, 5, FOOT + 0.01]);
            }
            if (bevel) { nose(T_K); for (b = K_BANDS) bevel_knuckle(b, T_K); }
            if (!bevel) for (b = K_BANDS) {
                translate([b[0], 0, -T_K]) cube([b[1], E + 0.01, T_K]);           // arm or tab
                knuckle(b[0], T_K, b[1]);
            }
        }
        translate([WALL, EB + WALL, -KPD]) cube([kpw, kpd, KPD + 1]);             // pocket
        if (bevel) for (b = T_BANDS) bevel_notch(b);
        pin_holes();
        // finger notch in the free edge, to lift the keyboard out
        translate([W / 2, EB + D_K - WALL - 1, 0]) rotate([-90, 0, 0]) cylinder(r = 12, h = WALL + 2);
        // pivot holes for the bail
        for (x = [-1, W - WALL - 1])
            translate([x, PIV_Y, PIV_Z]) rotate([0, 90, 0]) cylinder(d = 4.4, h = WALL + 2);
    }
}

// ---- T half: tablet holder. Drawn in the flat pose, on the -Y side. ----
// The hinge side is the lower side in the stand. The free edge is open.
module t_half() {
    y_hinge = -EB;                // edge of the body on the hinge side
    y_free  = -EB - D_T;          // free edge
    y_low   = y_hinge - wb;       // lower end of the pocket
    z_floor = -T_T + T_FLOOR;
    // Lip widths. In landscape the touch buttons are at low x. In portrait they are at the bottom.
    ov_lo  = landscape ? OV_BTN : OV;
    ov_hi  = OV;
    ov_bot = landscape ? OV : OV_BTN;
    difference() {
        union() {
            translate([0, y_free, -T_T]) cube([W, D_T, T_T]);
            if (spine) for (x0 = [SX0, SX1]) mirror([0, 1, 0]) lug([-P2L[0], P2L[1]], -T_T, x0);
            // Arms and knuckles. The corner next to the pin is cut at the angle of the
            // table, so that it is a flat foot in the stand and prints with no support.
            if (bevel) mirror([0, 1, 0]) { nose(T_T); for (b = T_BANDS) bevel_knuckle(b, T_T); }
            if (!bevel) intersection() {
                for (b = T_BANDS) {
                    translate([b[0], -E - 0.01, -T_T]) cube([b[1], E + 0.01, T_T]);
                    knuckle(b[0], T_T, b[1]);
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
            // USB-C port: right edge (low x), near the bottom
            translate([-1, y_low - 0.3 - USB_C - USB_HW, z_floor]) cube([px0 + 1.1, 2 * USB_HW, T_T]);
        } else {
            // USB-C port: bottom edge, near the left corner (high x).
            // The power button is on the top edge, which is open.
            translate([px0 + tpw - 0.3 - USB_C - USB_HW, y_low - OV_BTN - 0.01, z_floor])
                cube([2 * USB_HW, wb + OV_BTN + 1, T_T]);
            // bevel hinge: a slot through the taper, for the plug and its cable
            if (bevel) translate([px0 + tpw - 0.3 - USB_C - USB_HW, -E - 0.5, -T_T - 1])
                cube([2 * USB_HW, E + RK + 1, T_T + 2]);
        }
        // grooves for the bail's cross bar, in the outer face
        for (k = [-1 : 2])
            translate([-1, -(S0 + k * GSTEP), -T_T - (BAIL_R - GROOVE)])
                rotate([0, 90, 0]) cylinder(r = BAIL_R + 0.2, h = W + 2);
        if (bevel) mirror([0, 1, 0]) for (b = K_BANDS) bevel_notch(b);
        pin_holes();
        if (spine) {
            x_cyl(P2L, SP_HOLE / 2, 0, W);
            // notches for the K half's front feet
            for (x = [-0.01, W - 4.4]) translate([x, -5.4, -FOOT - 0.4]) cube([4.41, 5.41, FOOT + 1]);
        }
    }
}

// ---- Bail: pivot at the origin, arms along +Y ----
module bail() {
    for (x = [-0.4 - BT, W + 0.4]) translate([x, -4, -3]) cube([BT, BAIL_L + 4 + BAIL_R, 6]);
    translate([-0.4 - BT, BAIL_L, 0]) rotate([0, 90, 0]) cylinder(r = BAIL_R, h = W + 2 * BT + 0.8);
    // a flat under the cross bar, level with the arms, so that the bail prints on the bed
    translate([-0.4 - BT, BAIL_L - 2.5, -3]) cube([W + 2 * BT + 0.8, 3.3, 3]);
    translate([-0.5, 0, 0]) rotate([0, 90, 0]) cylinder(d = 4, h = WALL + 0.3);
    translate([W + 0.5 - WALL - 0.3, 0, 0]) rotate([0, 90, 0]) cylinder(d = 4, h = WALL + 0.3);
}

STOW_Z = -T_K - 3.2;   // stowed: the cross bar lies on the K half's outer face
STOW   = [PIV_Y - sqrt(BAIL_L * BAIL_L - pow(PIV_Z - STOW_Z, 2)), STOW_Z];

module bail_at(target) {   // target = [y, z] of the cross bar's centre
    translate([0, PIV_Y, PIV_Z]) rotate([atan2(target[1] - PIV_Z, target[0] - PIV_Y), 0, 0]) bail();
}

// ---- Stand-ins for the bought parts ----
module tablet() {
    translate([px0 + 0.3, -EB - wb - 0.3 - th, -T_T + T_FLOOR]) cube([tw, th, TAB_T]);
}
module keyboard_folded() {
    translate([WALL + 0.35, EB + WALL + 0.5, -KPD]) cube([kw, kd, KB_T]);
}

// Put the T half (and what it holds) with the halves "wedge" degrees apart. 360 = closed.
module posed(wedge) {
    s = spine && wedge == 360 ? [0, 0] : t_shift(wedge);
    translate([0, s[0], s[1]]) rotate([180 - wedge, 0, 0]) children();
}

// Closed: the K half's outer face is on the table.
module view_closed() {
    translate([0, 0, T_K + (spine ? 2 * RS + 0.8 : 2 * BAIL_R + 0.5)]) {
        k_half();
        if (spine) k_lugs();
        keyboard_folded();
        posed(360) { t_half(); tablet(); }
        if (spine) spine_at(false);
        bail_at(STOW);
    }
}

// Stand: the K half's inner face is toward the table. The user sits at -Y.
// +X is the user's right.
module view_stand() {
    translate([W, 0, FOOT]) rotate([0, 180, 0]) {
        k_half();
        if (spine) k_lugs();
        posed(SCREEN) { t_half(); tablet(); }
        if (spine) spine_at(true);
        bail_at(C0);
    }
    translate([(W - KB_OPEN[0]) / 2, -25 - KB_OPEN[1], 0]) cube(KB_OPEN);
}

if (view == "stand") view_stand();
else if (view == "closed") view_closed();
else if (view == "k_half") translate([0, 0, T_K]) k_half();
else if (view == "t_half") translate([0, 0, T_T]) t_half();
else if (view == "bail") translate([0.4 + BT, 4, 3]) bail();
else if (view == "check_k") k_half();
else if (view == "spine") spine_part();
else if (view == "pin") pin_part();
else if (view == "k_lug") k_lug(0);
else if (view == "check_l") k_lugs();
else if (view == "check_t") posed(SCREEN) t_half();
else if (view == "check_t0") posed(360) t_half();
else if (view == "check_s") spine_at(true);
else if (view == "check_s0") spine_at(false);
else if (view == "check_bail") bail_at(C0);
// Collision checks: each of these must be empty.
if (view == "x_stand") intersection() { k_half(); posed(SCREEN) t_half(); }
if (view == "x_closed") intersection() { k_half(); posed(360) t_half(); }
if (view == "x_bail") intersection() { union() { k_half(); posed(SCREEN) t_half(); } bail_at(C0); }
if (view == "x_stow") intersection() { union() { k_half(); posed(360) t_half(); } bail_at(STOW); }
