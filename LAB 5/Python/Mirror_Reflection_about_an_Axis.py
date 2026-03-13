import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[2, 2], [4, 2], [4, 5], [2, 5], [2, 2]])

plt.figure(figsize=(15, 4))

plt.subplot(1, 3, 1)
plt.grid(True)
plt.axis('equal')
plt.title('Reflection about X-axis')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
X_AXIS_REFLECTION = ORIGINAL_POINTS * [1, -1]
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5)
plt.plot(X_AXIS_REFLECTION[:, 0], X_AXIS_REFLECTION[:, 1], 'r-', linewidth=2)
plt.fill(X_AXIS_REFLECTION[:, 0], X_AXIS_REFLECTION[:, 1], 'r', alpha=0.3)
plt.axhline(y=0, color='k', linestyle='-', linewidth=1)
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.subplot(1, 3, 2)
plt.grid(True)
plt.axis('equal')
plt.title('Reflection about Y-axis')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
Y_AXIS_REFLECTION = ORIGINAL_POINTS * [-1, 1]
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5)
plt.plot(Y_AXIS_REFLECTION[:, 0], Y_AXIS_REFLECTION[:, 1], 'g-', linewidth=2)
plt.fill(Y_AXIS_REFLECTION[:, 0], Y_AXIS_REFLECTION[:, 1], 'g', alpha=0.3)
plt.axvline(x=0, color='k', linestyle='-', linewidth=1)
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.subplot(1, 3, 3)
plt.grid(True)
plt.axis('equal')
plt.title('Reflection about Origin')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
ORIGIN_REFLECTION = ORIGINAL_POINTS * [-1, -1]
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5)
plt.plot(ORIGIN_REFLECTION[:, 0], ORIGIN_REFLECTION[:, 1], 'm-', linewidth=2)
plt.fill(ORIGIN_REFLECTION[:, 0], ORIGIN_REFLECTION[:, 1], 'm', alpha=0.3)
plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.axvline(x=0, color='k', linestyle='-', linewidth=0.5)
plt.xlim(-6, 6)
plt.ylim(-6, 6)

plt.tight_layout()
plt.show()
