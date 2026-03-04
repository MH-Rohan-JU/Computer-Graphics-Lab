import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[5, 5], [8, 8], [5, 11], [2, 8], [5, 5]])
CENTER = np.array([5, 8])
ANGLE = 45
RAD = np.radians(ANGLE)

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('2D Rotation')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b-', linewidth=2, label='Original')
plt.fill(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b', alpha=0.3)

ROTATION_MATRIX = np.array([[np.cos(RAD), -np.sin(RAD)], [np.sin(RAD), np.cos(RAD)]])
RELATIVE_POINTS = ORIGINAL_POINTS - CENTER
ROTATED_RELATIVE = np.dot(RELATIVE_POINTS, ROTATION_MATRIX.T)
ROTATED_POINTS = ROTATED_RELATIVE + CENTER

plt.plot(ROTATED_POINTS[:, 0], ROTATED_POINTS[:, 1], 'r-', linewidth=2, label='Rotated')
plt.fill(ROTATED_POINTS[:, 0], ROTATED_POINTS[:, 1], 'r', alpha=0.3)
plt.plot(CENTER[0], CENTER[1], 'ko', markersize=10, markerfacecolor='k')

plt.legend()
plt.show()
