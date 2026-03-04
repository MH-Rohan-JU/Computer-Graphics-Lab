import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[2, 2], [4, 2], [4, 4], [2, 4], [2, 2]])
SX, SY = 1.5, 2.0

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.grid(True)
plt.axis('equal')
plt.title('Original Square')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b-', linewidth=2)
plt.fill(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b', alpha=0.3)
plt.xlim(-1, 10)
plt.ylim(-1, 10)
plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.axvline(x=0, color='k', linestyle='-', linewidth=0.5)

plt.subplot(1, 2, 2)
plt.grid(True)
plt.axis('equal')
plt.title(f'Scaling about Origin: Sx={SX}, Sy={SY}')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

SCALED_POINTS = ORIGINAL_POINTS * [SX, SY]

plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b--', linewidth=1.5, alpha=0.5, label='Original')
plt.plot(SCALED_POINTS[:, 0], SCALED_POINTS[:, 1], 'r-', linewidth=2, label='Scaled')
plt.fill(SCALED_POINTS[:, 0], SCALED_POINTS[:, 1], 'r', alpha=0.3)
plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.axvline(x=0, color='k', linestyle='-', linewidth=0.5)
plt.legend()
plt.xlim(-1, 10)
plt.ylim(-1, 10)

plt.tight_layout()
plt.show()
