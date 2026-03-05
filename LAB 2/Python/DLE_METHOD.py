import matplotlib.pyplot as plt

X1, Y1 = 2, 3
X2, Y2 = 12, 8

DX = X2 - X1
DY = Y2 - Y1
M = DY / DX

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Direct Line Equation Method')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X_VALS = []
Y_VALS = []

for X in range(X1, X2 + 1):
    Y = round(Y1 + M * (X - X1))
    X_VALS.append(X)
    Y_VALS.append(Y)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=8, markerfacecolor='k')
plt.plot([X1, X2], [Y1, Y2], 'r--')
plt.show()
