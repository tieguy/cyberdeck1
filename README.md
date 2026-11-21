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

## Status

Rev 0.1 is complete: printed and assembled (2026-11-20). It holds the tablet in portrait. Its
results are in `DESIGN-0.1.md`, and the git tag `rev-0.1` marks its files. Rev 0.2 is in design. The hinge test piece (`hinge-test/`) and the fit test (`fit-test/`) are printed; their results
are in their READMEs.

## Files

| File | Contents |
|---|---|
| `PARTS.md` | Dimensions and other facts about the tablet, the keyboard and the battery candidates |
| `DESIGN-0.1.md` | The design of rev 0.1: layout, hinge, tablet holder, decisions and open questions |
| `DESIGN-0.2.md` | The design of rev 0.2, in progress: what it must fix, proposals and ideas |
| `DESIGN-1.0.md` | Ideas that wait for rev 1.0, where the look matters |
| `case/` | The OpenSCAD model of rev 0.1, with 3D views and print files |
| `case02/` | The OpenSCAD model of rev 0.2, with 3D views |
| `fit-test/` | Test pieces for the fit of the tablet and the keyboard in their pockets |
| `hinge-test/` | A test piece for the hinge, with its own README |
