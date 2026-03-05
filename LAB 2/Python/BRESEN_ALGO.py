import matplotlib.pyplot as plt

X1, Y1 = 2, 3
X2, Y2 = 12, 8

DX = abs(X2 - X1)
DY = abs(Y2 - Y1)

X_INC = 1 if X1 < X2 else -1
Y_INC = 1 if Y1 < Y2 else -1

X, Y = X1, Y1
ERROR = 2 * DY - DX

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Bresenham\'s Line Algorithm')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X_VALS, Y_VALS = [X], [Y]

for I in range(DX):
    if ERROR >= 0:
        Y += Y_INC
        ERROR -= 2 * DX
    X += X_INC
    ERROR += 2 * DY
    X_VALS.append(X)
    Y_VALS.append(Y)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=8, markerfacecolor='k')
plt.plot([X1, X2], [Y1, Y2], 'r--')
plt.show()
