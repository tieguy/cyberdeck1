# Design of rev 0.2

Rev 0.2 is in design. It starts from rev 0.1, which is printed and in use as a prototype; its
results are in `DESIGN-0.1.md`. Part dimensions are in `PARTS.md`.

## What rev 0.2 must fix

From the owner's use of rev 0.1 (2026-11-20):

1. **Stability.** When the owner presses the screen, the stand sags toward the corner with the
   slot for the USB-C plug. The owner found the cause: the half that lies on the table has its
   hinge knuckle in the middle, not at its edges, so it has no foot at its front corners. The
   half on the table must have its hinge at both edges.
2. **The prop.** The bail of rev 0.1 helps a little when the screen is pressed, so a prop stays.
   But it needs a real hinge with an axle, and it must fold into the case when the case is
   closed, not lie proud on the outside.
3. **A thinner, lighter back** behind the tablet, which prints faster. The prop can lie in that
   back.

Not a problem to fix now: all three lips over the tablet print with some strings. The owner
accepts it.

## Decisions

From the owner, 2026-11-20:

- **Hinge**: two pins and two links (refer to "The design"). It replaces the first decision, a
  barrel whose diameter is close to the thickness of the whole closed case.
- **A plug that stands out of the closed case is acceptable.** The case is plugged in only when
  it does not move.
- **The lip on the keyboard half's free edge, and the snap, can change or go** if that makes the
  stand more steady.
- **Prop**: a mostly solid panel, for a sticker or art (2026-11-20), on an axle in the tablet half, stowed in its back, with the position
  notches in the keyboard half.
- **Back of the tablet half**: partly open, as a web.
- **The angle**: the stop between the halves sets 45°. The prop only steadies the screen against
  flex.
- **Charging**: only with the case closed. A battery waits; battery life is fine with the
  keyboard on Bluetooth, and was bad with it on USB.
- **Closing**: a printed snap, if a simple one is possible.
- **Edges**: comfortable to hold. All outer edges and corners are round (2026-11-20).
- **The lower lip stays.** The owner will look into the strings.
- **Pin**: printed. A bought rod is a nuisance.
- **Supports**: the owner found the supports of rev 0.1 hard to remove. Rev 0.2 avoids them.

## The design

The model is in `case02/`. It follows the decisions as below. The owner has not reviewed it.

### Hinge

The owner accepted this hinge in place of the barrel on 2026-11-20, from its description. The
barrel "was the best idea we had at the time".

- The hinge has two pins. Each half ends in a nose as thick as the half, with its pin at the
  middle of its thickness. Two links, each in a slot near an edge of the case, join the pins.
  `HINGE.md` gives the geometry.
- The halves start 3.5 mm behind the pins. The closed case is 213 mm long, 26 mm less than
  the model with the barrel hinge.
- The bed side of each nose is a 45° chamfer, so no part needs supports. The closed profile has a
  chamfer of 11 mm on the keyboard half and one of 7 mm on the tablet half, with two rounds
  between them.
- The stop: in the stand, the flat back of the tablet half lies on the chamfer of the keyboard
  half's nose, and the links pull.
- The pins are four printed pins, 2.9 mm across and 13 mm long, each with a head. The 2.9 mm pin
  in a 3.3 mm hole with crush ribs is the fit that the rev 0.1 test piece proved.
- The tablet half's nose has a gap at the USB-C port. A plug 25 mm long stands about 10 mm out
  of the closed case.
- In the stand the keyboard half lies on its nose and on its lip. The lip is 11 mm high, so the
  keyboard half slopes 3.1° and the screen is at 48° from the table.

### Prop

- The prop is a solid panel, 118 × 100 mm, so that it can carry a sticker or art. It is 3 mm
  thick, the thickness of the tablet half's floor. Stowed, it lies in an opening in that floor,
  flush with the back, with its feet toward the hinge.
- Floor stays under the edges of the tablet beside the panel: 10 mm at each long edge and 12 mm
  at the lower edge. With no floor there, a press on the screen pushes the tablet out of the
  back when the prop is out.
- It prints in place in the tablet half. Its axle is two cone pivots, 127.5 mm from the tablet
  half's pin. At the pivot the panel has two ears that reach the side walls, because the 3 mm
  floor is too thin for the sockets. Print-in-place needs no second material: the parts print in
  one job with a small gap between them, and the cones need no supports.
- Two feet, 5 mm long, stand out of the panel's edge and go into slots through the floor of the
  keyboard half. There are slots for screen angles of 45°, 52° and 59°.
- A notch in the panel's edge, 20 mm wide, lets a finger pull the panel out.
- A click holds the stowed panel: a bump on the outer side of each foot, in a dimple in the wall
  of the opening. A slit beside each bump makes that side of the foot a spring. The cone pivots
  cannot hold the panel, because they print with clearance and turn freely.

### Back, snap and edges

- The floor between the prop's pivot and the free edge is a grid of 4 mm bars with 15 mm
  openings.
- The snap is a tongue cut into the lip on the keyboard half's free edge, with a bump that hooks
  over the edge of the tablet half's back.
- The outer edges and the vertical corners of both halves are round. An edge on the print bed
  has a 45° chamfer in place of a round, so that it needs no supports. The edges of the openings
  (finger notches, web, slots, the USB-C cut-out) are square. `case02/README.md` gives the sizes.

## Open questions

- The owner's review of the look of the closed profile, in the 3D views.
- The slope of the stand. Ways to remove it: feet at the front corners of the keyboard half,
  which need notches in the corners of the tablet half; or a closure that needs no high lip.

- Do the cone pivots of the prop print free? A small test piece can show it.
- Does the snap hold, and does it release without too much force?
- Does the click hold the stowed prop, and does it release without too much force?
- Is the finger notch enough to pull the stowed prop out?

## Next step

The owner accepted the link hinge in place of the barrel (2026-11-20). Print the test piece in
`hinge-test-02/` and record the results in its README. It shows the fit of the pins and the
link, the play of the 45° stop, and whether the slot walls hold the closed halves in line.

Before you change the hinge, read `HINGE.md`.

Print the test piece in `prop-test-02/` too. It shows whether the cone pivots and the click
bumps of the prop print free, and whether the click holds the stowed prop.

Not printed or tested in rev 0.2: the link hinge, the cone pivots and the click of the prop, the
snap tongue, the web. No test piece covers the snap tongue.

## Other ideas for this revision or later

- Magnets to hold the tablet in the case. Bambu Lab sells magnets for printed parts. The tablet
  has magnets inside for the official case. Find their positions and polarity with a small magnet
  before the magnet pockets are designed.
- A holder for an external battery. The battery is not chosen; a slim or unusually shaped battery
  is acceptable. The folded keyboard is 13 mm thick and fills the footprint of its half, so a
  battery thicker than about 5 mm does not fit in the stack without a thicker or larger case.
  Open points: capacity, output (USB-C PD or plain 5 V), and whether the tablet, the keyboard, or
  both charge from it. A holder for the Anker candidate in `PARTS.md` must leave its folding
  connector free to fold out, or the battery must leave the holder to charge.
- A landscape case. The hinge runs along a long edge and the screen is 138 mm tall. The touch
  buttons are then on the user's right, so the lip on that edge covers 1 to 2 mm only. The power
  button is on the left edge, 9.5 mm from the top, and the USB-C port is on the right edge,
  13.6 mm from the bottom; both need cut-outs. `case/case.scad` can draw this case.
- Use the empty space in the keyboard pocket. The folded keyboard is not a rectangle, because of
  its Alice layout. The owner's choice is a place for a cable. The space is
  two wedges at opposite corners, each about 23 mm wide at its wide end, 150 mm long and 13 mm
  deep (estimates from a photo; refer to `PARTS.md`).

## Questions from the owner, 2026-11-20

The owner raised these while rev 0.1 printed. The notes under each are first thoughts, not
decisions, and none is tested.

### Edges that are pleasant to hold

- An edge on the print bed can have a 45° chamfer of 1 to 1.5 mm with no supports.
- An edge that faces up, and a vertical corner, can be rounded with no supports.
- Only a large round on a bed-side edge needs supports. A chamfer there, with rounds elsewhere,
  possibly gives a comfortable case with no more supports than rev 0.1 has.

### A thinner tablet half that prints faster

In rev 0.1 the floor behind the tablet is 3 mm thick, because the grooves for the bail are 1.5 mm
deep in it.

- Move the position notches off the tablet half. One way: the bail pivots on the tablet half, in
  its solid border, and its feet land in notches on the keyboard half. The bail's arms are outside
  the side walls of the keyboard half, so the notches can be in the edges of those walls.
- Without grooves, the floor can be about 1.2 to 1.6 mm with a few ribs, or an open frame that
  holds the tablet by its border.

### Open patterns in the large flat faces

Does a pattern of vines or circuit traces, with gaps, also print faster?

- Less material does not always mean less time. Each gap adds walls for the printer to trace. A
  coarse pattern with large gaps saves both. A fine pattern can take longer than a solid face.
- Where the tablet or the keyboard needs cover, a pattern with gaps protects less.
- Another way to the circuit-board look, with no gaps: print the traces in a second colour in the
  first layers of the face that lies on the bed. The H2D has two nozzles for this. The face stays
  smooth and closed, and the second colour is in a few layers only.

