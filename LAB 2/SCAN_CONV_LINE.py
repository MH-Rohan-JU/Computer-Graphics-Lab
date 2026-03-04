import matplotlib.pyplot as plt
import numpy as np

X_START, Y_START = 2, 3
X_END, Y_END = 12, 8

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Basic Line Scan Conversion')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X_VALS = []
Y_VALS = []

for X in range(X_START, X_END + 1):
    Y = round(Y_START + (Y_END - Y_START) * (X - X_START) / (X_END - X_START))
    X_VALS.append(X)
    Y_VALS.append(Y)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=8, markerfacecolor='k')
plt.plot([X_START, X_END], [Y_START, Y_END], 'r--')
plt.show()
