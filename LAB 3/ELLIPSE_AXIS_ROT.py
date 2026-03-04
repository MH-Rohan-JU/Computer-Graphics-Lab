import matplotlib.pyplot as plt
import numpy as np

RX = 15
RY = 8
CX, CY = 25, 15
ANGLE = np.pi / 4
NUM_POINTS = 200

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Ellipse Axis Rotation')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

THETA = np.linspace(0, 2*np.pi, NUM_POINTS)
X_VALS = []
Y_VALS = []

for T in THETA:
    X_LOCAL = RX * np.cos(T)
    Y_LOCAL = RY * np.sin(T)
    X_ROT = X_LOCAL * np.cos(ANGLE) - Y_LOCAL * np.sin(ANGLE)
    Y_ROT = X_LOCAL * np.sin(ANGLE) + Y_LOCAL * np.cos(ANGLE)
    X_VALS.append(round(CX + X_ROT))
    Y_VALS.append(round(CY + Y_ROT))

plt.plot(X_VALS, Y_VALS, 'ks', markersize=4, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=8, markerfacecolor='r')
plt.axline((CX, CY), slope=np.tan(ANGLE), color='g', linestyle='--', alpha=0.5)
plt.axline((CX, CY), slope=np.tan(ANGLE + np.pi/2), color='g', linestyle='--', alpha=0.5)
plt.show()
