import matplotlib.pyplot as plt

X1, Y1 = 10, 10
X2, Y2 = 40, 30

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('Rectangle Scan Conversion')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

X_VALS = []
Y_VALS = []

for X in range(X1, X2 + 1):
    X_VALS.append(X)
    X_VALS.append(X)
    Y_VALS.append(Y1)
    Y_VALS.append(Y2)

for Y in range(Y1 + 1, Y2):
    X_VALS.append(X1)
    X_VALS.append(X2)
    Y_VALS.append(Y)
    Y_VALS.append(Y)

plt.plot(X_VALS, Y_VALS, 'ks', markersize=4, markerfacecolor='k')
plt.plot([X1, X2, X2, X1, X1], [Y1, Y1, Y2, Y2, Y1], 'r-', linewidth=2)
plt.show()
