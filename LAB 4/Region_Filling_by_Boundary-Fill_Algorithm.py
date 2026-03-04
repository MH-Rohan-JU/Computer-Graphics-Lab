import matplotlib.pyplot as plt
import numpy as np

WIDTH, HEIGHT = 50, 50
IMAGE = np.ones((HEIGHT, WIDTH, 3)) * 0.8

plt.figure()
plt.grid(False)
plt.title('Boundary Fill Algorithm')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

def draw_rectangle():
    for X in range(10, 40):
        IMAGE[10, X] = [0, 0, 0]
        IMAGE[30, X] = [0, 0, 0]
    for Y in range(10, 31):
        IMAGE[Y, 10] = [0, 0, 0]
        IMAGE[Y, 40] = [0, 0, 0]

def boundary_fill(X, Y, FILL_COLOR, BOUNDARY_COLOR):
    if (IMAGE[Y, X] != BOUNDARY_COLOR).any() and (IMAGE[Y, X] != FILL_COLOR).any():
        IMAGE[Y, X] = FILL_COLOR
        boundary_fill(X + 1, Y, FILL_COLOR, BOUNDARY_COLOR)
        boundary_fill(X - 1, Y, FILL_COLOR, BOUNDARY_COLOR)
        boundary_fill(X, Y + 1, FILL_COLOR, BOUNDARY_COLOR)
        boundary_fill(X, Y - 1, FILL_COLOR, BOUNDARY_COLOR)

draw_rectangle()
boundary_fill(20, 20, [1, 0, 0], [0, 0, 0])

plt.imshow(IMAGE, origin='lower')
plt.show()
