ximport matplotlib.pyplot as plt
import numpy as np

RADIUS = 8
CX, CY = 10, 10

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Midpoint Circle Algorithm')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X, Y = 0, RADIUS
P = 1 - RADIUS

X_VALS, Y_VALS = [], []

def plot_symmetric_points(X_VALS, Y_VALS, CX, CY, X, Y):
    points = [(X, Y), (-X, Y), (X, -Y), (-X, -Y),
              (Y, X), (-Y, X), (Y, -X), (-Y, -X)]
    for PX, PY in points:
        X_VALS.append(CX + PX)
        Y_VALS.append(CY + PY)
    return X_VALS, Y_VALS

X_VALS, Y_VALS = plot_symmetric_points(X_VALS, Y_VALS, CX, CY, X, Y)

while X < Y:
    X += 1
    if P < 0:
        P = P + 2 * X + 1
    else:
        Y -= 1
        P = P + 2 * (X - Y) + 1
    X_VALS, Y_VALS = plot_symmetric_points(X_VALS, Y_VALS, CX, CY, X, Y)

THETA = np.linspace(0, 2*np.pi, 100)
X_CIRCLE = CX + RADIUS * np.cos(THETA)
Y_CIRCLE = CY + RADIUS * np.sin(THETA)

plt.plot(X_CIRCLE, Y_CIRCLE, 'b-', linewidth=1.5)
plt.plot(X_VALS, Y_VALS, 'ks', markersize=8, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=10, markerfacecolor='r')
plt.show()
