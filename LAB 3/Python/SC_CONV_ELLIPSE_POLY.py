import matplotlib.pyplot as plt
import numpy as np

RX = 15
RY = 8
CX, CY = 25, 15

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Ellipse - Polynomial Method')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X_VALS = []
Y_VALS = []

for X in range(CX - RX, CX + RX + 1):
    Y_OFFSET = RY * np.sqrt(1 - ((X - CX) ** 2) / (RX ** 2))
    Y1 = round(CY + Y_OFFSET)
    Y2 = round(CY - Y_OFFSET)
    X_VALS.append(X)
    X_VALS.append(X)
    Y_VALS.append(Y1)
    Y_VALS.append(Y2)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=4, markerfacecolor='k')
plt.plot(CX, CY, 'ro', markersize=8, markerfacecolor='r')
plt.show()
