import matplotlib.pyplot as plt
import numpy as np

plt.figure()
plt.grid(True)
plt.title('Bitmap Font - Character A')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

CHAR_A = [
    [0, 0, 1, 1, 1, 0, 0],
    [0, 1, 0, 0, 0, 1, 0],
    [1, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 1]
]

X_VALS = []
Y_VALS = []

for Y in range(len(CHAR_A)):
    for X in range(len(CHAR_A[0])):
        if CHAR_A[Y][X] == 1:
            X_VALS.append(X)
            Y_VALS.append(len(CHAR_A) - Y - 1)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=20, markerfacecolor='k')
plt.xlim(-1, 8)
plt.ylim(-1, 8)
plt.show()
