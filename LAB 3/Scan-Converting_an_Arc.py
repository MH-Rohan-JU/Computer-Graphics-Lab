import matplotlib.pyplot as plt
import numpy as np

CX, CY = 25, 25
RADIUS = 15
START_ANGLE = 30
END_ANGLE = 120
NUM_POINTS = 100

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Arc - Trigonometric Method')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

START_RAD = np.radians(START_ANGLE)
END_RAD = np.radians(END_ANGLE)
THETA = np.linspace(START_RAD, END_RAD, NUM_POINTS)

X_VALS = []
Y_VALS = []

for T in THETA:
    X = round(CX + RADIUS * np.cos(T))
    Y = round(CY + RADIUS * np.sin(T))
    X_VALS.append(X)
    Y_VALS.append(Y)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=4, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=8, markerfacecolor='r')
plt.show()
