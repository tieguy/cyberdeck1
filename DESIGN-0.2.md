# Design of rev 0.2

Rev 0.2 is designed, and its first full print started on 2026-11-21. It starts from rev 0.1,
which is printed and in use as a prototype; its results are in `DESIGN-0.1.md`. Part dimensions
are in `PARTS.md`. The model, the print files, the checks and the assembly are in `case02/`.

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

From the owner, 2026-11-20 and 2026-11-21:

- **Hinge**: two pins and two links (refer to "The design"). It replaces the first decision, a
  barrel whose diameter is close to the thickness of the whole closed case.
- **A plug that stands out of the closed case is acceptable.** The case is plugged in only when
  it does not move.
- **The lip on the keyboard half's free edge, and the snap, can change or go** if that makes the
  stand more steady.
- **Prop**: a mostly solid panel, for a sticker or art, on an axle in the tablet half, stowed in
  its back, with the position notches in the keyboard half. A click holds it when it is stowed.
- **Back of the tablet half**: partly open, as a web. The pattern of the web is bubbles
  (2026-11-21).
- **The angle**: the stop between the halves sets 45°. The prop only steadies the screen against
  flex. The tests show that the stop is rough (about 2° for 0.1 mm of print error), so in
  practice the prop sets the angle.
- **Charging**: only with the case closed. A battery waits; battery life is fine with the
  keyboard on Bluetooth, and was bad with it on USB.
- **Closing**: a printed snap, if a simple one is possible.
- **Edges**: comfortable to hold. All outer edges and corners are round (2026-11-20).
- **The lower lip stays.** The owner will look into the strings.
- **Pin**: printed. A bought rod is a nuisance. The axle of the prop is printed too (2026-11-21).
- **Supports**: the owner found the supports of rev 0.1 hard to remove. Rev 0.2 avoids them.

## The design

The model is in `case02/`. It follows the decisions as below. The owner reviewed pictures of it
and test pieces of its hinge and its prop, not a whole printed case.

### Hinge

The owner accepted this hinge in place of the barrel on 2026-11-20. The barrel "was the best
idea we had at the time". A one-pin hinge cannot be much shorter than the barrel (`HINGE.md`).

- The hinge has two pins. Each half ends in a nose as thick as the half, with its pin at the
  middle of its thickness. Two links, each in a slot near an edge of the case, join the pins.
  `HINGE.md` gives the geometry.
- The halves start 3.5 mm behind the pins. The closed case is 213 mm long, 26 mm less than
  the model with the barrel hinge.
- The bed side of each nose is a 45° chamfer, so no part needs supports. The closed profile has a
  chamfer of 11 mm on the keyboard half and one of 7 mm on the tablet half, with two rounds
  between them.
- The stop has two parts. In the stand, the flat back of the tablet half lies on the chamfer of
  the keyboard half's nose. The far wall of each slot in the keyboard half meets its link at
  the same position, and stops the tablet half from leaning back further. `HINGE.md` explains
  why both are needed.
- The links are 4.9 mm thick in slots 5.0 mm wide, with 3.1 mm holes. The owner chose the
  thickness from three test links, for a little friction and no play.
- The pins are four printed pins, 2.9 mm across and 13 mm long. Each has a head with a flat,
  and its recess has the same flat, so a pin goes in only in the position where all three
  crush ribs hold it. With the flat at a rib, a pin falls out. The head stands 1 mm out, so
  that a fingernail can pull it.
- The tablet half's nose has a gap at the USB-C port. A plug 25 mm long stands about 10 mm out
  of the closed case.
- In the stand the keyboard half lies on its nose and on its lip. The lip is 11 mm high, so the
  keyboard half slopes 3.1° and the screen is at 48° from the table.

### Prop

- The prop is a solid panel, 118 × 100 mm, so that it can carry a sticker or art. It is 3 mm
  thick, the thickness of the tablet half's floor. Stowed, it lies in an opening in that floor,
  flush with the back, with its feet toward the hinge.
- Floor stays under the edges of the tablet beside the panel: 10 mm at each long edge and 10 mm
  at the lower edge. With no floor there, a press on the screen pushes the tablet out of the
  back when the prop is out.
- It prints in place in the tablet half, with a small gap round it. Its axle is two printed
  pins, 127.5 mm from the tablet half's pin, pushed in from the edges of the case after the
  print. The owner wants a printed axle (2026-11-21).
- A floor of 3 mm is too thin for a pivot. Cone pivots that print in place did not hold (first
  test plate), and a hole for a filament axle left walls of 0.4 mm that did not print whole
  (second plate). So each pin is in a knuckle on the prop, 5.4 mm high, that lies inside the
  side wall, where the wall is 9.7 mm high.
- The cost: the axis is 2.7 mm above the back face, not in the middle of the panel. The end of
  the panel swings back as it turns, and the floor is cut back for it. A groove 3 mm wide along
  the axle shows in the back, with the tablet behind it.
- Two feet, 5 mm long, stand out of the panel's edge and go into slots through the floor of the
  keyboard half. There are slots for screen angles of 45°, 52° and 59°.
- A notch in the panel's edge, 20 mm wide, lets a finger pull the panel out.
- A click holds the stowed panel: a bump on the outer side of each foot, in a dimple in the wall
  of the opening. A slit beside each bump makes that side of the foot a spring. The axle
  cannot hold the panel, because the panel turns freely on it.

### Back, snap and edges

- The floor between the prop's axle and the free edge has holes in a pattern of bubbles. The
  owner found the first pattern, a grid of square holes, too brutal (2026-11-21). The owner
  chose bubbles from four patterns (2026-11-21). The model can also draw circles in rows,
  fleurs-de-lis and the grid.
- The snap is a tongue cut into the lip on the keyboard half's free edge, with a bump that hooks
  over the edge of the tablet half's back.
- The outer edges and the vertical corners of both halves are round. An edge on the print bed
  has a 45° chamfer in place of a round, so that it needs no supports. The edges of the openings
  (finger notches, web, slots, the USB-C cut-out) are square. `case02/README.md` gives the sizes.

## What the tests showed

Three small test plates were printed on 2026-11-21. Their results are in
`hinge-test-02/README.md` and `prop-test-02/README.md`. The points that changed the design:

- A pin with a flat holds only when the flat is between two ribs. The recess now forces that
  position.
- The 45° stop needs the link to meet a wall in the keyboard half at exactly the stop position.
  With the wall 3° or 6° too far, the tablet half leaned back.
- Links with 0.2 mm of clearance at each side felt loose. The owner chose 0.05 mm at each side.
- A pivot does not fit in a floor of 3 mm: cone pivots came out, and a hole for an axle broke
  through. The prop's axle is now in knuckles in the side walls.
- A click bump must go deeper into its dimple than the part can move sideways.
- Holes in a thin floor do not save print time. Refer to "Open patterns in the large flat
  faces" below.

## Open questions

- The slope of the stand, 3.1°. Ways to remove it: feet at the front corners of the keyboard
  half, which need notches in the corners of the tablet half; or a closure that needs no high
  lip. The owner allows a change to the lip and the snap for this.
- Does the snap hold, and does it release without too much force?
- Is the finger notch enough to pull the stowed prop out?
- Do the heads of the hinge pins, 1 mm out of the sides, get in the way?

## Results of the print

The first full print started on 2026-11-21. Record here what the owner reports, with the date,
and mark each cause as confirmed or not confirmed.

- **2026-11-21, `print/parts.stl`**: the small parts (links, hinge pins, axle pins) failed as
  spaghetti. They were printed in one job with another plate, so short layers on a plate of
  small parts alone are not the likely cause. The cause is not known. The owner will send a
  picture when the rest of the job is done. Questions that are open: which parts failed, and
  whether their first layers stayed on the bed. The same shapes printed well on the three test
  plates; the changes since then are that the links have no marks and the axle pins are 0.6 mm
  shorter.

Not tested before this print, so look at these first:

- The snap tongue on the keyboard half's lip. No test piece covers it.
- The hinge with two links, and the 45° stop under the weight of the tablet. The stop is rough
  (`HINGE.md`); the prop sets the angle.
- The bubble web, and the tablet half as a whole: PrusaSlicer says "consider enabling supports"
  for it, and it was sent to print with none.
- The recess for the heads of the prop's axle pins, which came after the last test plate.
- The prop at full size: its feet in the slots of the keyboard half at 45°, 52° and 59°.

## Next step

Record the results of the print above. Then start rev 0.3 from them, in `DESIGN-0.3.md`.

Before you change the hinge, read `HINGE.md`.

## Other ideas for a later revision

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

- Less material does not always mean less time. Each gap adds walls for the printer to trace.
- Measured with PrusaSlicer estimates on 2026-11-21, for bubbles over about half of the area:
  the keyboard half (floor 2 mm) went from 1 h 57 min and 95 g to 2 h 13 min and 79 g, and the
  tablet half with bubbles in the prop (3 mm) went from 2 h 2 min and 78 g to 2 h 16 min and
  70 g. The bubble web of the tablet half costs about 8 minutes more than the square grid. So
  holes in these thin floors save filament and cost time. The owner left the keyboard half and
  the prop solid.
- Where the tablet or the keyboard needs cover, a pattern with gaps protects less.
- Another way to the circuit-board look, with no gaps: print the traces in a second colour in the
  first layers of the face that lies on the bed. The H2D has two nozzles for this. The face stays
  smooth and closed, and the second colour is in a few layers only.

