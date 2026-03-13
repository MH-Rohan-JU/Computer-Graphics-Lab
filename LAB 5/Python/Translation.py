import matplotlib.pyplot as plt
import numpy as np

ORIGINAL_POINTS = np.array([[2, 2], [4, 2], [4, 4], [2, 4], [2, 2]])
TX, TY = 5, 3

plt.figure()
plt.grid(True)
plt.axis('equal')
plt.title(f'Translation: Tx={TX}, Ty={TY}')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

plt.plot(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b-', linewidth=2, label='Original')
plt.fill(ORIGINAL_POINTS[:, 0], ORIGINAL_POINTS[:, 1], 'b', alpha=0.3)

TRANSLATED_POINTS = ORIGINAL_POINTS + [TX, TY]
plt.plot(TRANSLATED_POINTS[:, 0], TRANSLATED_POINTS[:, 1], 'r-', linewidth=2, label='Translated')
plt.fill(TRANSLATED_POINTS[:, 0], TRANSLATED_POINTS[:, 1], 'r', alpha=0.3)

plt.axhline(y=0, color='k', linestyle='-', linewidth=0.5)
plt.axvline(x=0, color='k', linestyle='-', linewidth=0.5)
plt.legend()
plt.xlim(0, 10)
plt.ylim(0, 10)
plt.show()
