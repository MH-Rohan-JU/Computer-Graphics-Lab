import matplotlib.pyplot as plt
import numpy as np

XMIN, YMIN, XMAX, YMAX = 3, 3, 8, 8
INSIDE, LEFT, RIGHT, BOTTOM, TOP = 0, 1, 2, 4, 8

LINES = [((2, 2), (10, 10)), ((1, 5), (10, 5)), ((5, 1), (5, 10)), ((9, 2), (9, 9)), ((2, 9), (9, 2))]

def compute_outcode(X, Y):
    CODE = INSIDE
    if X < XMIN: CODE |= LEFT
    elif X > XMAX: CODE |= RIGHT
    if Y < YMIN: CODE |= BOTTOM
    elif Y > YMAX: CODE |= TOP
    return CODE

def cohen_sutherland_clip(X1, Y1, X2, Y2):
    OUTCODE1 = compute_outcode(X1, Y1)
    OUTCODE2 = compute_outcode(X2, Y2)
    ACCEPT = False
    
    while True:
        if not (OUTCODE1 | OUTCODE2):
            ACCEPT = True
            break
        elif OUTCODE1 & OUTCODE2:
            break
        else:
            X, Y = 0, 0
            OUTCODE_OUT = OUTCODE1 if OUTCODE1 else OUTCODE2
            if OUTCODE_OUT & TOP:
                X = X1 + (X2 - X1) * (YMAX - Y1) / (Y2 - Y1)
                Y = YMAX
            elif OUTCODE_OUT & BOTTOM:
                X = X1 + (X2 - X1) * (YMIN - Y1) / (Y2 - Y1)
                Y = YMIN
            elif OUTCODE_OUT & RIGHT:
                Y = Y1 + (Y2 - Y1) * (XMAX - X1) / (X2 - X1)
                X = XMAX
            elif OUTCODE_OUT & LEFT:
                Y = Y1 + (Y2 - Y1) * (XMIN - X1) / (X2 - X1)
                X = XMIN
            if OUTCODE_OUT == OUTCODE1:
                X1, Y1 = X, Y
                OUTCODE1 = compute_outcode(X1, Y1)
            else:
                X2, Y2 = X, Y
                OUTCODE2 = compute_outcode(X2, Y2)
    
    return ACCEPT, (X1, Y1, X2, Y2) if ACCEPT else None

plt.figure(figsize=(10, 8))
plt.grid(True)
plt.title('Cohen-Sutherland Line Clipping')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')

plt.plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', linewidth=2, label='Clip Window')

for I, ((X1, Y1), (X2, Y2)) in enumerate(LINES):
    plt.plot([X1, X2], [Y1, Y2], 'r--', linewidth=1.5, alpha=0.5)
    ACCEPT, CLIPPED = cohen_sutherland_clip(X1, Y1, X2, Y2)
    if ACCEPT:
        CX1, CY1, CX2, CY2 = CLIPPED
        plt.plot([CX1, CX2], [CY1, CY2], 'g-', linewidth=2.5)

plt.xlim(0, 12); plt.ylim(0, 12)
plt.legend(['Clip Window', 'Original Lines', 'Clipped Lines'])
plt.show()
