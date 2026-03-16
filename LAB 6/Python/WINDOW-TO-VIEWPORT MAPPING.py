import matplotlib.pyplot as plt
import numpy as np

WINDOW_XMIN, WINDOW_YMIN, WINDOW_XMAX, WINDOW_YMAX = -10, -10, 10, 10
VIEWPORT_XMIN, VIEWPORT_YMIN, VIEWPORT_XMAX, VIEWPORT_YMAX = 50, 50, 250, 250

POINTS = np.array([[-8, -8], [-5, 5], [0, 0], [5, -5], [8, 8]])

SX = (VIEWPORT_XMAX - VIEWPORT_XMIN) / (WINDOW_XMAX - WINDOW_XMIN)
SY = (VIEWPORT_YMAX - VIEWPORT_YMIN) / (WINDOW_YMAX - WINDOW_YMIN)

MAPPED_POINTS = np.zeros_like(POINTS)
MAPPED_POINTS[:, 0] = VIEWPORT_XMIN + (POINTS[:, 0] - WINDOW_XMIN) * SX
MAPPED_POINTS[:, 1] = VIEWPORT_YMIN + (POINTS[:, 1] - WINDOW_YMIN) * SY

plt.figure(figsize=(12, 5))

plt.subplot(1, 2, 1)
plt.grid(True)
plt.title('World Window')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')
plt.plot([WINDOW_XMIN, WINDOW_XMAX, WINDOW_XMAX, WINDOW_XMIN, WINDOW_XMIN],
         [WINDOW_YMIN, WINDOW_YMIN, WINDOW_YMAX, WINDOW_YMAX, WINDOW_YMIN], 'b-', linewidth=2)
plt.scatter(POINTS[:, 0], POINTS[:, 1], c='r', s=50)
for I, P in enumerate(POINTS):
    plt.annotate(f'P{I+1}', (P[0], P[1]), xytext=(5, 5), textcoords='offset points')
plt.xlim(-12, 12); plt.ylim(-12, 12)

plt.subplot(1, 2, 2)
plt.grid(True)
plt.title('Viewport')
plt.xlabel('X-axis'); plt.ylabel('Y-axis')
plt.plot([VIEWPORT_XMIN, VIEWPORT_XMAX, VIEWPORT_XMAX, VIEWPORT_XMIN, VIEWPORT_XMIN],
         [VIEWPORT_YMIN, VIEWPORT_YMIN, VIEWPORT_YMAX, VIEWPORT_YMAX, VIEWPORT_YMIN], 'g-', linewidth=2)
plt.scatter(MAPPED_POINTS[:, 0], MAPPED_POINTS[:, 1], c='r', s=50)
for I, P in enumerate(MAPPED_POINTS):
    plt.annotate(f'P{I+1}', (P[0], P[1]), xytext=(5, 5), textcoords='offset points')
plt.xlim(40, 260); plt.ylim(40, 260)

plt.tight_layout()
plt.show()

print("Original Points (Window Coordinates):")
for I, P in enumerate(POINTS):
    print(f"P{I+1}: ({P[0]:.1f}, {P[1]:.1f})")
print("\nMapped Points (Viewport Coordinates):")
for I, P in enumerate(MAPPED_POINTS):
    print(f"P{I+1}: ({P[0]:.1f}, {P[1]:.1f})")
