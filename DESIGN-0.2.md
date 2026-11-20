# Ideas for rev 0.2

Rev 0.2 is not in design. This file collects the ideas that wait for it. Part dimensions are in
`PARTS.md`.

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

