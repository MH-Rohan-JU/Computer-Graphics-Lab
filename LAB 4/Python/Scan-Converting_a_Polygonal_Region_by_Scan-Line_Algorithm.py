import matplotlib.pyplot as plt
import numpy as np

WIDTH, HEIGHT = 50, 50
IMAGE = np.ones((HEIGHT, WIDTH, 3)) * 0.9
POLYGON = [(10, 10), (40, 15), (35, 35), (15, 30)]

plt.figure()
plt.grid(False)
plt.title('Scan-Line Polygon Fill')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

def draw_polygon():
    for I in range(len(POLYGON)):
        X1, Y1 = POLYGON[I]
        X2, Y2 = POLYGON[(I + 1) % len(POLYGON)]
        STEPS = max(abs(X2 - X1), abs(Y2 - Y1))
        if STEPS == 0:
            continue
        for T in np.linspace(0, 1, int(STEPS) + 1):
            X = round(X1 + T * (X2 - X1))
            Y = round(Y1 + T * (Y2 - Y1))
            if 0 <= X < WIDTH and 0 <= Y < HEIGHT:
                IMAGE[Y, X] = [0, 0, 0]

def scanline_fill():
    for Y in range(HEIGHT):
        INTERSECTIONS = []
        for I in range(len(POLYGON)):
            X1, Y1 = POLYGON[I]
            X2, Y2 = POLYGON[(I + 1) % len(POLYGON)]
            if (Y1 <= Y < Y2) or (Y2 <= Y < Y1):
                if Y1 != Y2:
                    X_INTERSECT = round(X1 + (Y - Y1) * (X2 - X1) / (Y2 - Y1))
                    INTERSECTIONS.append(X_INTERSECT)
        INTERSECTIONS.sort()
        for J in range(0, len(INTERSECTIONS), 2):
            for X in range(INTERSECTIONS[J], INTERSECTIONS[J + 1] + 1):
                if 0 <= X < WIDTH and 0 <= Y < HEIGHT:
                    if (IMAGE[Y, X] == [0.9, 0.9, 0.9]).all():
                        IMAGE[Y, X] = [0, 1, 0]

draw_polygon()
scanline_fill()

plt.imshow(IMAGE, origin='lower')
plt.show()
