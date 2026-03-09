import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[5, 5], [8, 8], [5, 11], [2, 8], [5, 5]])
TX, TY = 12, 3

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title('2D Translation')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b-', linewidth=2, label='Original')
plt.fill(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b', alpha=0.3)

TRANSLATED_POINTS = ORIGINAL_POINTS + [TX, TY]
plt.plot(TRANSLATED_POINTS[:, 0], TRANSLATED_POINTS[:, 1], 'r-', linewidth=2, label='Translated')
plt.fill(TRANSLATED_POINTS[:, 0], TRANSLATED_POINTS[:, 1], 'r', alpha=0.3)

plt.legend()
plt.show()
