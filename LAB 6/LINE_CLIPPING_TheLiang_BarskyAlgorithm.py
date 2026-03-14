import matplotlib.pyplot as plt
import numpy as np

XMIN, YMIN, XMAX, YMAX = 3, 3, 8, 8

LINES = [((2, 2), (10, 10)), ((1, 5), (10, 5)), ((5, 1), (5, 10)), ((9, 2), (9, 9)), ((2, 9), (9, 2))]

def liang_barsky_clip(X1, Y1, X2, Y2):
    DX = X2 - X1
    DY = Y2 - Y1
    P = [-DX, DX, -DY, DY]
    Q = [X1 - XMIN, XMAX - X1, Y1 - YMIN, YMAX - Y1]
    
    U1, U2 = 0.0, 1.0
    
    for I in range(4):
        if P[I] == 0:
            if Q[I] < 0:
                return False, None
        else:
            T = Q[I] / P[I]
            if P[I] < 0:
                if T > U1: U1 = T
            else:
                if T < U2: U2 = T
    
    if U1 > U2:
        return False, None
    
    NX1 = X1 + U1 * DX
    NY1 = Y1 + U1 * DY
    NX2 = X1 + U2 * DX
    NY2 = Y1 + U2 * DY
    
    return True, (NX1, NY1, NX2, NY2)

plt.figure(figsize=(10, 8))
plt.grid(True)
plt.title('Liang-Barsky Line Clipping')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')

plt.plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', linewidth=2, label='Clip Window')

for I, ((X1, Y1), (X2, Y2)) in enumerate(LINES):
    plt.plot([X1, X2], [Y1, Y2], 'r--', linewidth=1.5, alpha=0.5)
    ACCEPT, CLIPPED = liang_barsky_clip(X1, Y1, X2, Y2)
    if ACCEPT:
        CX1, CY1, CX2, CY2 = CLIPPED
        plt.plot([CX1, CX2], [CY1, CY2], 'g-', linewidth=2.5)

plt.xlim(0, 12); plt.ylim(0, 12)
plt.legend(['Clip Window', 'Original Lines', 'Clipped Lines'])
plt.show()
