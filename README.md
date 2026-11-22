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

- **Rev 0.1** is complete: printed and assembled (2026-11-20). It holds the tablet in portrait.
  Its results are in `DESIGN-0.1.md`, and the git tag `rev-0.1` marks its files.
- **Rev 0.2** is designed, and its first full print started on 2026-11-21 from the files in
  `case02/print/`. It has a two-pin link hinge, a solid prop that stows in the back of the
  tablet half, and round edges. The hinge and the prop passed their tests on three small test
  plates. The results of the full print are not recorded yet; they go in `DESIGN-0.2.md`,
  section "Results of the print".
- **Rev 0.3** is not started. `DESIGN-0.3.md` lists what it starts from.

## Files

| File | Contents |
|---|---|
| `HINGE.md` | What is known about the hinge: the geometry it must obey, and the hinges tried |
| `PARTS.md` | Dimensions and other facts about the tablet, the keyboard and the battery candidates |
| `DESIGN-0.1.md` | The design of rev 0.1 and the results of its print |
| `DESIGN-0.2.md` | The design of rev 0.2: decisions, the design, what the tests showed, what is not tested |
| `DESIGN-0.3.md` | Rev 0.3, not started: what it starts from, and the ideas that wait for it |
| `DESIGN-1.0.md` | Ideas that wait for rev 1.0, where the look matters |
| `case/` | The OpenSCAD model of rev 0.1, with 3D views and print files |
| `case02/` | The OpenSCAD model of rev 0.2, with 3D views, print files, the checks and the assembly |
| `hinge-test-02/` | The test piece for the rev 0.2 hinge, with the results of three test plates |
| `prop-test-02/` | The test piece for the rev 0.2 prop, with the results of three test plates |
| `test-plate-02/` | One print plate that takes pieces from both rev 0.2 test pieces |
| `fit-test/` | Test pieces for the fit of the tablet and the keyboard in their pockets (rev 0.1) |
| `hinge-test/` | The test piece for the rev 0.1 hinge |
