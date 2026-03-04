import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[2, 2], [4, 2], [4, 5], [2, 5], [2, 2]])
ANGLE = 30
RAD = np.radians(ANGLE)

plt.figure(figsize=(15, 4))

plt.subplot(1, 3, 1)
plt.grid(True)
plt.axis('equal')
plt.title('Reflection about X-axis')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
X_AXIS_MATRIX = np.array([[1, 0], [0, -1]])
X_REFLECTION = np.dot(ORIGINAL_POINTS, X_AXIS_MATRIX.T)
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5)
plt.plot(X_REFLECTION[:, 0], X_REFLECTION[:, 1], 'r-', linewidth=2)
plt.fill(X_REFLECTION[:, 0], X_REFLECTION[:, 1], 'r', alpha=0.3)
plt.axhline(y=0, color='k', linestyle='-', linewidth=1)
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.subplot(1, 3, 2)
plt.grid(True)
plt.axis('equal')
plt.title('Reflection about Y-axis')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
Y_AXIS_MATRIX = np.array([[-1, 0], [0, 1]])
Y_REFLECTION = np.dot(ORIGINAL_POINTS, Y_AXIS_MATRIX.T)
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5)
plt.plot(Y_REFLECTION[:, 0], Y_REFLECTION[:, 1], 'g-', linewidth=2)
plt.fill(Y_REFLECTION[:, 0], Y_REFLECTION[:, 1], 'g', alpha=0.3)
plt.axvline(x=0, color='k', linestyle='-', linewidth=1)
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.subplot(1, 3, 3)
plt.grid(True)
plt.axis('equal')
plt.title(f'Reflection about line at {ANGLE}°')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

LINE_X = np.linspace(-6, 6, 100)
LINE_Y = np.tan(RAD) * LINE_X
plt.plot(LINE_X, LINE_Y, 'k-', linewidth=1)

COS2A = np.cos(2 * RAD)
SIN2A = np.sin(2 * RAD)
LINE_MATRIX = np.array([[COS2A, SIN2A], [SIN2A, -COS2A]])
LINE_REFLECTION = np.dot(ORIGINAL_POINTS, LINE_MATRIX.T)

plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5)
plt.plot(LINE_REFLECTION[:, 0], LINE_REFLECTION[:, 1], 'm-', linewidth=2)
plt.fill(LINE_REFLECTION[:, 0], LINE_REFLECTION[:, 1], 'm', alpha=0.3)
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.tight_layout()
plt.show()
