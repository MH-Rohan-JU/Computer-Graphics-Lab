import matplotlib.pyplot as plt
import numpy as np

RX = 15
RY = 8
CX, CY = 25, 15
NUM_POINTS = 200

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Ellipse - Trigonometric Method')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

THETA = np.linspace(0, 2*np.pi, NUM_POINTS)
X_VALS = []
Y_VALS = []

for T in THETA:
    X = round(CX + RX * np.cos(T))
    Y = round(CY + RY * np.sin(T))
    X_VALS.append(X)
    Y_VALS.append(Y)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=4, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=8, markerfacecolor='r')
plt.show()
