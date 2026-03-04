import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[3, 1], [5, 1], [5, 3], [3, 3], [3, 1]])
ANGLE = 45
RAD = np.radians(ANGLE)

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.grid(True)
plt.axis('equal')
plt.title('Original Rectangle')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b-', linewidth=2)
plt.fill(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b', alpha=0.3)
plt.xlim(-6, 6)
plt.ylim(-6, 6)
plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.axvline(x=0, color='k', linestyle='-', linewidth=0.5)

plt.subplot(1, 2, 2)
plt.grid(True)
plt.axis('equal')
plt.title(f'Rotation about Origin: {ANGLE}°')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

ROTATION_MATRIX = np.array([[np.cos(RAD), -np.sin(RAD)], [np.sin(RAD), np.cos(RAD)]])
ROTATED_POINTS = np.dot(ORIGINAL_POINTS, ROTATION_MATRIX.T)

plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5, label='Original')
plt.plot(ROTATED_POINTS[:, 0], ROTATED_POINTS[:, 1], 'r-', linewidth=2, label='Rotated')
plt.fill(ROTATED_POINTS[:, 0], ROTATED_POINTS[:, 1], 'r', alpha=0.3)
plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.axvline(x=0, color='k', linestyle='-', linewidth=0.5)
plt.legend()
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.tight_layout()
plt.show()
