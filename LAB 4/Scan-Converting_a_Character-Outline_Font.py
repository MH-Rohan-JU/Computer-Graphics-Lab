import matplotlib.pyplot as plt
import numpy as np

plt.figure()
plt.grid(True)
plt.title('Outline Font - Character A')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

OUTLINE_POINTS = [
    (5, 1), (2, 9), (8, 9), (5, 1),
    (3, 6), (7, 6)
]

plt.plot([P[0] for P in OUTLINE_POINTS[:4]], [P[1] for P in OUTLINE_POINTS[:4]], 'b-', linewidth=3)
plt.plot([OUTLINE_POINTS[3][0], OUTLINE_POINTS[4][0]], [OUTLINE_POINTS[3][1], OUTLINE_POINTS[4][1]], 'b-', linewidth=3)
plt.plot([OUTLINE_POINTS[3][0], OUTLINE_POINTS[5][0]], [OUTLINE_POINTS[3][1], OUTLINE_POINTS[5][1]], 'b-', linewidth=3)

plt.xlim(0, 10)
plt.ylim(0, 10)
plt.show()
