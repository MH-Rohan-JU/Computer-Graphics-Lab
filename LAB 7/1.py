import numpy as np

P = np.array([1, 2, 3, 1])

T = np.array([
    [1, 0, 0, 4],
    [0, 1, 0, -2],
    [0, 0, 1, 5],
    [0, 0, 0, 1]
])

P_new = T @ P
print("Translated Point:", P_new)