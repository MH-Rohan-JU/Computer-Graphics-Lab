import matplotlib.pyplot as plt
import numpy as np

RX = 15
RY = 8
CX, CY = 25, 15

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Midpoint Ellipse Algorithm')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X = 0
Y = RY
RX2 = RX * RX
RY2 = RY * RY
TWO_RX2 = 2 * RX2
TWO_RY2 = 2 * RY2

PX = 0
PY = TWO_RX2 * Y

X_VALS = []
Y_VALS = []

def plot_symmetric_points(X_VALS, Y_VALS, CX, CY, X, Y):
    points = [(X, Y), (-X, Y), (X, -Y), (-X, -Y)]
    for PX, PY in points:
        X_VALS.append(CX + PX)
        Y_VALS.append(CY + PY)
    return X_VALS, Y_VALS

P = round(RY2 - (RX2 * RY) + (0.25 * RX2))
while PX < PY:
    X_VALS, Y_VALS = plot_symmetric_points(X_VALS, Y_VALS, CX, CY, X, Y)
    X += 1
    PX += TWO_RY2
    if P < 0:
        P += RY2 + PX
    else:
        Y -= 1
        PY -= TWO_RX2
        P += RY2 + PX - PY

P = round(RY2 * (X + 0.5) ** 2 + RX2 * (Y - 1) ** 2 - RX2 * RY2)
while Y >= 0:
    X_VALS, Y_VALS = plot_symmetric_points(X_VALS, Y_VALS, CX, CY, X, Y)
    Y -= 1
    PY -= TWO_RX2
    if P > 0:
        P += RX2 - PY
    else:
        X += 1
        PX += TWO_RY2
        P += RX2 - PY + PX

plt.plot(X_VALS, Y_VALS, 'ks', markersize=4, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=8, markerfacecolor='r')
plt.show()
