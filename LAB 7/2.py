import numpy as np

P = np.array([1, 2, 3, 1])

S = np.array([
    [2, 0, 0, 0],
    [0, 3, 0, 0],
    [0, 0, 4, 0],
    [0, 0, 0, 1]
])

P_new = S @ P
print("Scaled Point:", P_new)