# cyberdeck1

A 3D-printed case for a portable writing setup made of three parts:

- a Viwoods AiPaper Mini e-ink tablet (the screen)
- a Keychron B11 Pro foldable keyboard
- a battery (not chosen yet)

## How it is used

1. Carry the closed case, for example to a cafe. The folded keyboard, the tablet and the battery
   are inside it.
2. Open the case and take out the keyboard. Unfold the keyboard and put it on the table.
3. Fold the case into a stand. The stand holds the tablet up at a fixed angle, as the screen,
   behind the keyboard. The battery stays in its holder in the case.

The owner will sketch the case and its folds. Until the sketch is in this repo, the fold geometry
is not decided.

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
| Port and button positions | [unknown] | |
| Bezel widths (for the stand's lip) | [unknown] | |

### Keyboard: Keychron B11 Pro

Ultra-Slim Wireless Foldable Keyboard, Alice layout, Space Gray, SKU B11P-K1. Ordered from
Keychron 2026-07-31.

| Item | Value | Source |
|---|---|---|
| Size unfolded (W × D) | 392.6 × 143 mm | [spec: [Keychron product page](https://www.keychron.com/products/keychron-b11-pro-ultra-slim-wireless-foldable-keyboard)] |
| Weight | 258 g ± 10 g | [spec: Keychron product page] |
| Size folded (W × D × H) | [unknown] — the owner will measure it with calipers | |
| Port, switch and foot positions when folded | [unknown] | |

The case carries the keyboard folded only. The folded size is the one that the case design needs.

### Battery

Not chosen. The case has a holder for it, so the holder design waits on the choice. A slim or
unusually shaped battery is acceptable. Open points: capacity, output (USB-C PD or plain 5 V), and
whether the tablet, the keyboard, or both charge from it.

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
- The case has a holder for the battery.

## Open questions

- Case folds: how does the case open, and how does it fold into the stand? (Sketch to come.)
- Screen angle: what angle?
- Does the tablet stay removable for use as a notebook with the stylus?
- Battery: which model? The holder shape depends on it.
