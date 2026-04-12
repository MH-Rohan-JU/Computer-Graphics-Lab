import numpy as np

theta = np.pi / 4

Rz = np.array([
    [np.cos(theta), -np.sin(theta), 0, 0],
    [np.sin(theta),  np.cos(theta), 0, 0],
    [0,              0,             1, 0],
    [0,              0,             0, 1]
])

P = np.array([1, 1, 1, 1])

P_new = Rz @ P
print("Rotated Point:", P_new)