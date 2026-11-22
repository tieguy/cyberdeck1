# Design of rev 0.3

Rev 0.3 is not started. This file holds what it starts from. When the work starts, add the
decisions, the design, the open questions and the next step here, as in `DESIGN-0.2.md`.

## What it starts from

- The model of rev 0.2, `case02/case02.scad`, and its first full print, which started on
  2026-11-21. The results of that print go in `DESIGN-0.2.md`, section "Results of the print".
  When rev 0.3 starts, read them first: they decide what rev 0.3 must fix. If that section has
  no results, ask the owner what the print showed.
- `HINGE.md`: the geometry of the two-pin link hinge, and what its test pieces showed.
- `../PRINTER.md`: the fits measured on this printer in rev 0.2 (pins and ribs, links, parts
  that print in place).

Put the model of rev 0.3 in a new directory, `case03/`, and do not change `case02/` after its
print has results, in the same way that `case/` holds rev 0.1.

## Points that rev 0.2 leaves open

These are in `DESIGN-0.2.md`, sections "Open questions" and "Results of the print". None is a
decision for rev 0.3 yet.

- The stand slopes 3.1°, because the keyboard half has no front feet and its lip lifts its
  rear. The owner allows a change to the lip and the snap to make the stand more steady.
- The snap tongue has no test.
- The 45° stop of the hinge is rough; the prop sets the angle.
- The heads of the hinge pins stand 1 mm out of the sides of the case.

## Ideas that wait

`DESIGN-0.2.md`, section "Other ideas for a later revision", has these with their notes: magnets
to hold the tablet, a holder for a battery, a landscape case, and a place for a cable in the
empty corners of the keyboard pocket. The look and the material are for rev 1.0
(`DESIGN-1.0.md`).
