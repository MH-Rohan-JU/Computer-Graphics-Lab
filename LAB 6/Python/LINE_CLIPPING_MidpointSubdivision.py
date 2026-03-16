import matplotlib.pyplot as plt
import numpy as np

XMIN, YMIN, XMAX, YMAX = 3, 3, 8, 8
INSIDE, LEFT, RIGHT, BOTTOM, TOP = 0, 1, 2, 4, 8
EPSILON = 0.01

LINES = [((2, 2), (10, 10)), ((1, 5), (10, 5)), ((5, 1), (5, 10)), ((9, 2), (9, 9)), ((2, 9), (9, 2))]

def compute_outcode(X, Y):
    CODE = INSIDE
    if X < XMIN: CODE |= LEFT
    elif X > XMAX: CODE |= RIGHT
    if Y < YMIN: CODE |= BOTTOM
    elif Y > YMAX: CODE |= TOP
    return CODE

def midpoint_subdivision(X1, Y1, X2, Y2):
    OUTCODE1 = compute_outcode(X1, Y1)
    OUTCODE2 = compute_outcode(X2, Y2)
    
    if not (OUTCODE1 | OUTCODE2):
        return [(X1, Y1, X2, Y2)]
    
    if OUTCODE1 & OUTCODE2:
        return []
    
    if abs(X2 - X1) < EPSILON and abs(Y2 - Y1) < EPSILON:
        return []
    
    XM = (X1 + X2) / 2
    YM = (Y1 + Y2) / 2
    
    SEGMENTS = []
    SEGMENTS.extend(midpoint_subdivision(X1, Y1, XM, YM))
    SEGMENTS.extend(midpoint_subdivision(XM, YM, X2, Y2))
    
    return SEGMENTS

plt.figure(figsize=(10, 8))
plt.grid(True)
plt.title('Midpoint Subdivision Line Clipping')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')

plt.plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', linewidth=2, label='Clip Window')

for I, ((X1, Y1), (X2, Y2)) in enumerate(LINES):
    plt.plot([X1, X2], [Y1, Y2], 'r--', linewidth=1.5, alpha=0.5)
    CLIPPED_SEGMENTS = midpoint_subdivision(X1, Y1, X2, Y2)
    for SEG in CLIPPED_SEGMENTS:
        plt.plot([SEG[0], SEG[2]], [SEG[1], SEG[3]], 'g-', linewidth=2.5)

plt.xlim(0, 12); plt.ylim(0, 12)
plt.legend(['Clip Window', 'Original Lines', 'Clipped Lines'])
plt.show()
