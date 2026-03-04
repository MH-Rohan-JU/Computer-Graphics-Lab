import matplotlib.pyplot as plt
import numpy as np

RADIUS = 8
CX, CY = 10, 10

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Basic Circle Scan Conversion')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

THETA = np.linspace(0, 2*np.pi, 100)
X_CIRCLE = CX + RADIUS * np.cos(THETA)
Y_CIRCLE = CY + RADIUS * np.sin(THETA)
plt.plot(X_CIRCLE, Y_CIRCLE, 'b-')

X_VALS, Y_VALS = [], []

for X in range(CX - RADIUS, CX + RADIUS + 1):
    Y = round(CY + np.sqrt(RADIUS**2 - (X - CX)**2))
    X_VALS.extend([X, X])
    Y_VALS.extend([Y, 2*CY - Y])

plt.plot(X_VALS, Y_VALS, 'ks', markersize=8, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=10, markerfacecolor='r')
plt.show()
