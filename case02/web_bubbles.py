"""Make the table of bubbles for the web in the back of the tablet half.

It packs circles of several sizes in a rectangle, with a bar of at least BAR mm between them,
and prints the table BUBBLES for case02.scad as [x, y, r] in millimetres from the corner of the
rectangle. The seed is fixed, so the table is the same each time.

Run:  python3 -I web_bubbles.py 118.6 57.3
"""
import math
import random
import sys

BAR = 2.2
SIZES = [(11, 2), (9, 3), (7, 6), (5.5, 10), (4, 20), (3, 40), (2.2, 80)]   # (radius, how many to try for)


def pack(w, h, seed=7):
    rnd = random.Random(seed)
    out = []
    for r0, n in SIZES:
        placed = 0
        for _ in range(6000):
            if placed >= n:
                break
            r = r0 * rnd.uniform(0.9, 1.1)
            x = rnd.uniform(r, w - r)
            y = rnd.uniform(r, h - r)
            if all(math.hypot(x - a, y - b) >= r + c + BAR for a, b, c in out):
                out.append((x, y, r))
                placed += 1
    return out


if __name__ == "__main__":
    w, h = float(sys.argv[1]), float(sys.argv[2])
    b = pack(w, h)
    area = sum(math.pi * r * r for _, _, r in b) / (w * h)
    print(f"// {len(b)} bubbles in {w} x {h} mm, {area:.0%} open. Made by web_bubbles.py.")
    print("BUBBLES = [")
    for i in range(0, len(b), 4):
        print("    " + " ".join(f"[{x:.1f}, {y:.1f}, {r:.1f}]," for x, y, r in b[i:i + 4]))
    print("];")
