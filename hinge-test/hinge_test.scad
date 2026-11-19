// Ratchet hinge test piece for cyberdeck1.
//
// Two leaves turn on one pin. A toothed wheel is keyed to leaf A. A spring
// finger on leaf B rides on the wheel. The teeth let the hinge turn toward
// the stop and block it from turning back, until the finger is pushed off.
//
// The hinge angle "theta" is 0 when the leaves are closed face to face,
// 180 when they lie flat, and STOP when their outer edges meet.
//
// Model frame: X is the hinge axis. Both leaves are drawn flat (theta = 180)
// with the inner faces at z = 0 and the outer faces at z = -T. Leaf A is on
// the +Y side and leaf B is on the -Y side.
//
// Make one part:  openscad-nightly -D 'part="plate"' -o hinge_test_plate.stl hinge_test.scad

part = "plate";   // plate | leaf_a | leaf_b | wheel10 | wheel15 | pins | assembly
theta = 180;      // pose of leaf B in the assembly
bump_on = true;   // false removes the finger's tooth (for collision checks)

$fn = 64;

// ---- Leaves ----
T      = 10;      // leaf thickness. Near the tablet half of the real case.
STOP   = 320;     // theta where the outer edges meet
SPREAD = 360 - STOP;
E      = T / tan(SPREAD / 2);   // distance from the axis to the leaf bodies
BODY   = 18;      // length of each leaf body
W      = 36;      // leaf width along the axis

// ---- Bands along the axis ----
F_W    = 7.5;     // wheel and finger band, x = 0 .. F_W
A_X0   = 8;       // leaf A knuckle band
A_X1   = 22;
B_X0   = 22.4;    // leaf B knuckle band
CRADLE = 5;       // length of the socket for the wheel's key, from A_X0

// ---- Pin ----
RK     = 5;       // knuckle radius
HOLE_D = 5.2;
PIN_DS = [4.6, 4.8, 5.0];   // pin diameters to try

// ---- Finger ----
FIN_H   = 2.4;    // finger thickness
FIN_W   = 7.3;
TAB     = 9;      // length of the release tab past the tooth
BUMP_H  = 1.2;    // tooth height on the finger
TIP     = 0.4;    // flat on top of the tooth
HOOK    = 12;     // lean of the locking faces, degrees
TIP_R   = T - FIN_H - BUMP_H;   // distance from the axis to the tooth tip

// ---- Wheel ----
PRESS  = 0.8;     // finger deflection on a tooth crest
DEPTH  = 0.6;     // tooth depth
RC     = TIP_R + PRESS;   // crest radius
RV     = RC - DEPTH;      // valley radius
RR     = TIP_R - 0.6;     // relief radius: the finger does not touch
VALLEY = 3.5;     // valley floor, degrees
// Key that locks the wheel to leaf A. It is off-centre so that it fits one way.
KEY_Y0 = -3.5;  KEY_Y1 = 4.5;  KEY_Z0 = -RK;  KEY_Z1 = RK;
KEY_L  = 4.8;
FIT    = 0.15;    // clearance around the key

// The finger's tooth touches the wheel at wheel angle psi = 90 + theta,
// measured from +Y toward +Z in leaf A's frame.
function psi_of(th) = 90 + th;

// Wheel outline for one tooth pitch, as [angle, radius] points in order of
// increasing travel. The finger rests in the valley just above each "drop".
function tooth(drop, pitch) = [
    [drop, RV],
    [drop + VALLEY, RV],
    [drop + pitch + atan(DEPTH * tan(HOOK) / RC), RC],   // hooked crest
];

function ratchet_pts(pitch) =
    let (n = floor((STOP - 250) / pitch),
         top = psi_of(STOP) - 360,
         first = top - n * pitch)
    concat(
        [[first - 14, RR], [first + atan(DEPTH * tan(HOOK) / RC), RC]],  // entry ramp
        [for (k = [0 : n - 1]) each tooth(first + k * pitch, pitch)],
        [[top, RV], [top + 10, RV], [top + 16, RR]],
        // closed detent at theta = 0 (psi = 90): a hump that resists opening
        [[86, RR], [89, RV], [93.5, RV], [97.5, RC - 0.3], [100, RC - 0.3], [106, RR]],
        // relief for the rest of the turn
        [for (a = [110 : 5 : 360 + first - 20]) [a, RR]]
    );

function rests(pitch) =
    let (n = floor((STOP - 250) / pitch))
    [for (k = [0 : n]) psi_of(STOP) - k * pitch];

module wheel_2d(pitch) {
    polygon([for (p = ratchet_pts(pitch)) [p[1] * cos(p[0]), p[1] * sin(p[0])]]);
}

// Wheel in its print frame: outer face on the bed, axis up.
// Print (X, Y, Z) = model (y, z, x).
module wheel_print(pitch, dots) {
    difference() {
        union() {
            linear_extrude(F_W) wheel_2d(pitch);
            translate([KEY_Y0, KEY_Z0, F_W - 0.01])
                cube([KEY_Y1 - KEY_Y0, KEY_Z1 - KEY_Z0, KEY_L + 0.01]);
        }
        translate([0, 0, -1]) cylinder(d = HOLE_D, h = F_W + KEY_L + 2);
        // tick at each rest position; a long tick at the stop
        for (i = [0 : len(rests(pitch)) - 1])
            rotate(rests(pitch)[i] + VALLEY / 2)
                translate([i == 0 ? 3.4 : 4.6, -0.3, -0.01])
                    cube([RV - 0.4 - (i == 0 ? 3.4 : 4.6), 0.6, 0.41]);
        // dots that name the wheel: one for 10 degrees, two for 15
        for (j = [0 : dots - 1])
            rotate(200 + 25 * j) translate([4.3, 0, -0.01]) cylinder(d = 1.4, h = 0.41, $fn = 16);
    }
}

module wheel(pitch, dots) {
    rotate([90, 0, 90]) wheel_print(pitch, dots);
}

module pin_hole() {
    translate([-1, 0, 0]) rotate([0, 90, 0]) cylinder(d = HOLE_D, h = W + 2);
}

module knuckle(x0, x1) {
    translate([x0, 0, 0]) {
        rotate([0, 90, 0]) cylinder(r = RK, h = x1 - x0);
        translate([0, -RK, -T]) cube([x1 - x0, 2 * RK, T]);   // foot down to the bed
    }
}

module leaf_a() {
    difference() {
        union() {
            translate([0, E, -T]) cube([W, BODY, T]);                 // body
            translate([A_X0, 0, -T]) cube([A_X1 - A_X0, E + 0.01, T]); // arm
            knuckle(A_X0 + CRADLE, A_X1);
            translate([A_X0, KEY_Y0 - FIT - 3, -T])                   // cradle block
                cube([CRADLE, 3 + FIT - KEY_Y0 + 0.01, T]);
        }
        pin_hole();
        translate([A_X0 - 1, KEY_Y0 - FIT, KEY_Z0 - FIT])            // socket for the key
            cube([CRADLE + 1, KEY_Y1 - KEY_Y0 + 2 * FIT, T]);
    }
}

module bump() {
    // Locking face at y = 0 on the tip, leaning back toward +y at the base.
    lean = BUMP_H * tan(HOOK);
    translate([0, 0, -T + FIN_H]) rotate([90, 0, 90])
        linear_extrude(FIN_W)
            polygon([[lean, -0.01], [0, BUMP_H], [TIP, BUMP_H], [TIP + BUMP_H, -0.01]]);
}

module leaf_b() {
    difference() {
        union() {
            translate([0, -E - BODY, -T]) cube([W, BODY, T]);          // body
            translate([B_X0, -E - 0.01, -T]) cube([W - B_X0, E + 0.01, T]); // arm
            knuckle(B_X0, W);
            translate([0, -E - 0.01, -T]) cube([FIN_W, E + TAB + 0.01, FIN_H]); // finger
            if (bump_on) bump();
        }
        pin_hole();
    }
}

// Pin in its print frame: flat side on the bed, axis along X.
module pin_print(d, notches) {
    cut = d / 2 - 0.5;
    translate([0, 0, cut]) difference() {
        union() {
            rotate([0, 90, 0]) cylinder(d = d, h = W);
            translate([W, 0, 0]) rotate([0, 90, 0]) cylinder(d = 8, h = 2);
        }
        translate([-1, -5, -5 - cut]) cube([W + 4, 10, 5]);
        for (j = [0 : notches - 1])
            translate([W + 1, -2 + 2 * j, 3.6]) cube([1.01, 0.8, 1]);
    }
}

module assembly(pitch = 10) {
    color("silver") leaf_a();
    color("orange") wheel(pitch, 1);
    color("steelblue") rotate([theta - 180, 0, 0]) leaf_b();
}

module plate() {
    translate([0, 0, T]) leaf_a();
    translate([0, -18, T]) leaf_b();
    translate([W + 12, 20, 0]) wheel_print(10, 1);
    translate([W + 12, 0, 0]) wheel_print(15, 2);
    for (i = [0 : len(PIN_DS) - 1])
        translate([0, -E - BODY - 30 - 11 * i, 0]) pin_print(PIN_DS[i], i + 1);
}

if (part == "plate") plate();
else if (part == "leaf_a") translate([0, 0, T]) leaf_a();
else if (part == "leaf_b") translate([0, 0, T]) leaf_b();
else if (part == "wheel10") wheel_print(10, 1);
else if (part == "wheel15") wheel_print(15, 2);
else if (part == "pins") for (i = [0 : len(PIN_DS) - 1]) translate([0, 11 * i, 0]) pin_print(PIN_DS[i], i + 1);
else if (part == "assembly") assembly();
else if (part == "check_a") { leaf_a(); wheel(10, 1); }
else if (part == "check_b") rotate([theta - 180, 0, 0]) leaf_b();
