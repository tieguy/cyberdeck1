# cyberdeck1

A 3D-printed case for a portable writing setup made of three parts:

- a Viwoods AiPaper Mini e-ink tablet (the screen)
- a Keychron B11 Pro foldable keyboard
- a battery (a later revision; rev 0.1 uses the tablet's own battery)

## How it is used

1. Carry the closed case, for example to a cafe. The folded keyboard and the tablet are inside it.
2. Open the case and take out the keyboard. Unfold the keyboard and put it on the table.
3. Fold the case into a stand. The stand holds the tablet up at a fixed angle, as the screen,
   behind the keyboard.

The fold geometry is not decided. Refer to the open questions. The owner's sketch of the case is
in progress and is not in this repo.

## Parts

Each dimension has a source tag. **[spec]** is a manufacturer or retailer figure. **[measured]** is
a caliper measurement of the owner's unit. **[unknown]** has no figure yet. Measure the real parts
before the case design depends on a number: a published figure does not give the tolerances or
the position of ports and buttons.

### Screen: Viwoods AiPaper Mini

Ordered from Viwoods 2026-05-12, delivered 2026-05-15.

| Item | Value | Source |
|---|---|---|
| Size (W × H × D) | 191 × 138 × 5.2 mm | [spec: [Viwoods product page](https://viwoods.com/collections/all/products/aipaper-mini)] |
| Weight | 230 g | [spec: Viwoods product page] |
| Display | 8.2 in E Ink Carta 1000, 1920 × 1440, glass front | [spec: [Parka Blogs review](https://www.parkablogs.com/index.php/content/viwoods-aipaper-mini-review)] |
| Bezel, top long edge | 6 mm | [measured, 2026-11-19] |
| Touch buttons | Three, in the bezel along the right short edge. 8 mm from that edge. | [measured, 2026-11-19] |
| Power button | On the left short edge, 9.5 mm from the top long edge | [measured, 2026-11-19] |
| USB-C port | On the right short edge, 13.6 mm from the bottom long edge | [measured, 2026-11-19] |
| Bezel, bottom long edge and left short edge | 6 mm each | [measured, 2026-11-19] |
| Bezel, right short edge (full width) | [unknown] | |

"Top", "bottom", "left" and "right" are for the tablet in landscape with the touch buttons on the
right.

Limits on the part that grips the tablet:

- A lip on the top, bottom or left edge can cover up to 6 mm.
- A lip on the right short edge covers 1 to 2 mm only, because the touch buttons are 8 mm from
  that edge. Bevel this lip: the owner's finger touches it on the way to the buttons.
- One side stays open, so that the tablet slides in and out. Which side is not decided.
- The power button on the left short edge stays reachable.
- The USB-C port stays uncovered, so that the tablet charges while it is in the case.

### Keyboard: Keychron B11 Pro

Ultra-Slim Wireless Foldable Keyboard, Alice layout, Space Gray, SKU B11P-K1. Ordered from
Keychron 2026-07-31.

| Item | Value | Source |
|---|---|---|
| Size unfolded (W × D) | 392.6 × 143 mm | [spec: [Keychron product page](https://www.keychron.com/products/keychron-b11-pro-ultra-slim-wireless-foldable-keyboard)] |
| Weight | 258 g ± 10 g | [spec: Keychron product page] |
| Size folded, long side | Less than 10 mm longer than the tablet's long side (191 mm). Too long for the owner's calipers; no exact figure yet. | [measured, approximate, 2026-11-19] |
| Size folded, short side | Almost the same as the tablet's short side (138 mm) | [measured, approximate, 2026-11-19] |
| Thickness folded | 13 mm | [measured, 2026-11-19] |
| Port, switch and foot positions when folded | [unknown] | |

The case carries the keyboard folded only. The folded size is the one that the case design needs.
The folded keyboard and the tablet have almost the same footprint, so the two halves of the case
can be the same size.

### Battery

Rev 0.1 has no external battery and no battery holder. The tablet runs on its own battery. The
owner reports that this battery drains fast when the keyboard is connected, and accepts that for
the prototype. The owner charges the tablet at home, in the case, through its USB-C port.

A later revision adds a holder for an external battery. The battery is not chosen. A slim or
unusually shaped battery is acceptable. The folded keyboard is 13 mm thick and fills the footprint
of its half, so a battery thicker than about 5 mm does not fit in the stack without a thicker or
larger case. Open points: capacity, output (USB-C PD or plain 5 V), and whether the tablet, the
keyboard, or both charge from it.

One candidate:

| Item | Value | Source |
|---|---|---|
| Model | Anker Nano Power Bank, built-in USB-C connector (A1653) | [spec: [Anker product page](https://www.anker.com/products/a1653-usb-c-portable-charger-5000mah)] |
| Size | 3.03 × 1.45 × 0.98 in (about 77 × 37 × 25 mm) | [spec: Anker product page] |
| Weight | 100 g | [spec: Anker product page] |
| Capacity | 5,000 mAh | [spec: Anker product page] |
| Ports | 1 USB-C port, 1 built-in folding USB-C connector | [spec: Anker product page] |
| Output | 18 W max (5 V 3 A / 9 V 2.22 A / 10 V 2.25 A). The product name says 22.5 W; the spec list says 18 W. | [spec: Anker product page] |

The folding connector plugs straight into a device. A holder for this battery must leave the
connector free to fold out, or the battery must leave the holder to charge.

## Decisions

- The tablet travels inside the case.
- The stand holds the tablet at one fixed angle.
- The tablet is in landscape when it is the screen. The hinge runs along a long edge of the case.
- In the stand, the tablet's long edge near the power button is up.
- Rev 0.1 has no external battery. A later revision adds a battery holder.
- No stylus. The case needs no stylus holder, and the tablet need not come out for handwriting.

## Ideas for rev 0.2

- Magnets to hold the tablet in the case. Bambu Lab sells magnets for printed parts. Not known
  yet: whether the tablet has magnets or steel that a case magnet can grip, and where.
- A holder for an external battery (refer to Battery).

## Hinge geometry

With one pin, the two halves end up inside the angle between the legs, outer face to outer face.
Their thickness limits how close the legs can come. To reach a small angle, the bodies of the
halves must start some distance from the pin, on arms. For halves about 9 mm and 17 mm thick
(estimates: tablet and folded keyboard, each with walls) and legs 40° apart, that distance is
about 37 mm. A hinge with two pins and a spine between them needs no such arms. This choice is
open.

## Open questions

- Hinge: one pin with arms about 37 mm long, or two pins with a spine?

- Stand layout. The case is a clamshell: one half carries the folded keyboard, the other half
  carries the tablet, and one hinge joins them along a long edge. Two layouts are candidates.
  Compare them when the part measurements are known.
  - Base flat: the keyboard half swings about 300 degrees round the hinge and lies flat on the
    table behind the tablet half. A stop in the hinge sets the angle and carries the tablet's
    weight.
  - A-frame: the hinge is at the top and the two halves stand on their free edges. The weight
    pushes the feet apart, back along the path that the half took when it opened. A fixed stop
    cannot block that path. A ratchet in the hinge holds the angle: it clicks toward the stand
    position and locks against the return until a tab releases it. `hinge-test/` is a test piece
    for this ratchet. This layout lets the open side of the tablet holder
    be the hinge side. When the case is closed, the other half blocks that side, so the tablet
    is fully enclosed with no latch. When the case stands as an A-frame, that side is at the top:
    the tablet lifts out upward, and its weight keeps it in.
- Screen angle: what angle?
- Battery for a later revision: which model? The holder shape depends on it.
- Which side of the tablet holder is open? In the A-frame layout, the hinge side. In the base-flat
  layout, not decided: the hinge side is then at the bottom, where the tablet's weight rests.
