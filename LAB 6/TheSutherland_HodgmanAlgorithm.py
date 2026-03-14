import matplotlib.pyplot as plt
import numpy as np

XMIN, YMIN, XMAX, YMAX = 3, 3, 8, 8
POLYGON = np.array([[2, 2], [10, 2], [10, 10], [2, 10], [2, 2]])

def clip_polygon(POLY, X1, Y1, X2, Y2, EDGE):
    NEW_POLY = []
    N = len(POLY) - 1
    
    for I in range(N):
        CURRENT = POLY[I]
        NEXT = POLY[I + 1]
        
        CURRENT_INSIDE = False
        NEXT_INSIDE = False
        
        if EDGE == 'LEFT':
            CURRENT_INSIDE = CURRENT[0] >= XMIN
            NEXT_INSIDE = NEXT[0] >= XMIN
        elif EDGE == 'RIGHT':
            CURRENT_INSIDE = CURRENT[0] <= XMAX
            NEXT_INSIDE = NEXT[0] <= XMAX
        elif EDGE == 'BOTTOM':
            CURRENT_INSIDE = CURRENT[1] >= YMIN
            NEXT_INSIDE = NEXT[1] >= YMIN
        elif EDGE == 'TOP':
            CURRENT_INSIDE = CURRENT[1] <= YMAX
            NEXT_INSIDE = NEXT[1] <= YMAX
        
        if CURRENT_INSIDE and NEXT_INSIDE:
            NEW_POLY.append(NEXT)
        elif CURRENT_INSIDE and not NEXT_INSIDE:
            if EDGE == 'LEFT':
                T = (XMIN - CURRENT[0]) / (NEXT[0] - CURRENT[0])
                Y = CURRENT[1] + T * (NEXT[1] - CURRENT[1])
                NEW_POLY.append([XMIN, Y])
            elif EDGE == 'RIGHT':
                T = (XMAX - CURRENT[0]) / (NEXT[0] - CURRENT[0])
                Y = CURRENT[1] + T * (NEXT[1] - CURRENT[1])
                NEW_POLY.append([XMAX, Y])
            elif EDGE == 'BOTTOM':
                T = (YMIN - CURRENT[1]) / (NEXT[1] - CURRENT[1])
                X = CURRENT[0] + T * (NEXT[0] - CURRENT[0])
                NEW_POLY.append([X, YMIN])
            elif EDGE == 'TOP':
                T = (YMAX - CURRENT[1]) / (NEXT[1] - CURRENT[1])
                X = CURRENT[0] + T * (NEXT[0] - CURRENT[0])
                NEW_POLY.append([X, YMAX])
        elif not CURRENT_INSIDE and NEXT_INSIDE:
            if EDGE == 'LEFT':
                T = (XMIN - CURRENT[0]) / (NEXT[0] - CURRENT[0])
                Y = CURRENT[1] + T * (NEXT[1] - CURRENT[1])
                NEW_POLY.append([XMIN, Y])
            elif EDGE == 'RIGHT':
                T = (XMAX - CURRENT[0]) / (NEXT[0] - CURRENT[0])
                Y = CURRENT[1] + T * (NEXT[1] - CURRENT[1])
                NEW_POLY.append([XMAX, Y])
            elif EDGE == 'BOTTOM':
                T = (YMIN - CURRENT[1]) / (NEXT[1] - CURRENT[1])
                X = CURRENT[0] + T * (NEXT[0] - CURRENT[0])
                NEW_POLY.append([X, YMIN])
            elif EDGE == 'TOP':
                T = (YMAX - CURRENT[1]) / (NEXT[1] - CURRENT[1])
                X = CURRENT[0] + T * (NEXT[0] - CURRENT[0])
                NEW_POLY.append([X, YMAX])
            NEW_POLY.append(NEXT)
    
    if NEW_POLY:
        NEW_POLY.append(NEW_POLY[0])
    
    return np.array(NEW_POLY)

def sutherland_hodgman_clip(POLY):
    CLIPPED = POLY
    CLIPPED = clip_polygon(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'LEFT')
    if len(CLIPPED) > 1:
        CLIPPED = clip_polygon(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'RIGHT')
    if len(CLIPPED) > 1:
        CLIPPED = clip_polygon(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'BOTTOM')
    if len(CLIPPED) > 1:
        CLIPPED = clip_polygon(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'TOP')
    return CLIPPED

plt.figure(figsize=(10, 8))
plt.grid(True)
plt.title('Sutherland-Hodgman Polygon Clipping')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')

plt.plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', linewidth=2, label='Clip Window')
plt.fill([XMIN, XMAX, XMAX, XMIN], [YMIN, YMIN, YMAX, YMAX], 'b', alpha=0.1)

plt.plot(POLYGON[:, 0], POLYGON[:, 1], 'r--', linewidth=2, label='Original Polygon')
plt.fill(POLYGON[:, 0], POLYGON[:, 1], 'r', alpha=0.2)

CLIPPED_POLY = sutherland_hodgman_clip(POLYGON)
if len(CLIPPED_POLY) > 1:
    plt.plot(CLIPPED_POLY[:, 0], CLIPPED_POLY[:, 1], 'g-', linewidth=2.5, label='Clipped Polygon')
    plt.fill(CLIPPED_POLY[:, 0], CLIPPED_POLY[:, 1], 'g', alpha=0.3)

plt.xlim(0, 12); plt.ylim(0, 12)
plt.legend()
plt.show()
