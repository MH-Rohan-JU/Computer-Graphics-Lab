import numpy as np

P = np.array([5, 5, 5, 1])

T = np.array([
    [1, 0, 0, -2],
    [0, 1, 0, -3],
    [0, 0, 1, -4],
    [0, 0, 0, 1]
])

P_view = T @ P
print("View Coordinate:", P_view)