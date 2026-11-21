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

- **Hinge**: a barrel whose diameter is close to the thickness of the whole closed case.
- **Prop**: a U-shaped frame on an axle in the tablet half, stowed in its back, with the position
  notches in the keyboard half.
- **Back of the tablet half**: partly open, as a web.
- **The angle**: the stop between the halves sets 45°. The prop only steadies the screen against
  flex.
- **Charging**: only with the case closed. A battery waits; battery life is fine with the
  keyboard on Bluetooth, and was bad with it on USB.
- **Closing**: a printed snap, if a simple one is possible.
- **Edges**: comfortable to hold. This is in rev 0.2.
- **The lower lip stays.** The owner will look into the strings.
- **Pin**: printed. A bought rod is a nuisance.
- **Supports**: the owner found the supports of rev 0.1 hard to remove. Rev 0.2 avoids them.

## The design

The model is in `case02/`. It follows the decisions as below. The owner has not reviewed it.

### Hinge

- The barrel is 22 mm across; the closed case is 25 mm thick. Its pin is 6 mm, over the whole
  width, in a hole that is closed at one end, with crush ribs in the keyboard half's segments.
  A 6 mm pin lies on the print bed on a wider flat than the 2.9 mm pin of rev 0.1.
- The barrel has five segments: three on the keyboard half, at both edges and in the middle, and
  two on the tablet half between them. The keyboard half lies on the table in the stand, and its
  segments are its front feet, so it stands on its corners. One band, 22 mm wide, has no barrel. The USB-C plug goes there, and
  the cable leaves over the pin.
- Rev 0.1 had tapers so that the halves could lie back to back at 45°. Rev 0.2 has none. Each
  half reaches its barrel segments with tabs of its full thickness, and the other half has a
  notch at each tab. At every place along the hinge only one half has material, so nothing
  collides, and no surface slopes over the print bed. Rev 0.2 needs no supports.
- The stop: in the stand, the flat back of the tablet half rests on a 45° chamfer on the
  hinge-side edge of the keyboard half. A 45° chamfer on a bed-side edge prints with no supports.
- The barrel is the front foot of the stand. The lip on the keyboard half's free edge is as high
  as the barrel's radius, and it is the rear foot.

### Prop

- The prop is 3 mm thick, the thickness of the tablet half's floor. Stowed, it lies in a slot
  in that floor, flush with the back, with its feet toward the hinge.
- It prints in place in the tablet half. Its axle is two cone pivots that reach into the tablet
  half, 150 mm from the hinge. Print-in-place needs no second material: the parts print in one
  job with a small gap between them, and the cones need no supports.
- Its two feet go into slots through the floor of the keyboard half. There are slots for screen
  angles of 45°, 52° and 59°.
- The main hinge cannot print in place: the two halves, laid open, are about 470 mm long, and the
  bed is 325 mm.

### Back, snap and edges

- The floor behind the tablet is a grid of 4 mm bars with 15 mm openings, between the arms of
  the prop.
- The snap is a tongue cut into the lip on the keyboard half's free edge, with a bump that hooks
  over the edge of the tablet half's back.
- The long outer edges of both halves have 1.5 mm chamfers.

## Open questions

- The owner's review of the model in `case02/`.
- Do the cone pivots of the prop print free? A small test piece can show it.
- Does the snap hold, and does it release without too much force?
- Something to hold the stowed prop in its slot.
- Rounded corners, and how far to take the chamfers.

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
- A hinge with two pins and a spine between them, if the extra depth of the one-pin hinge's arms
  is a problem in use. It needs no arms, but it has two joints to hold.
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

