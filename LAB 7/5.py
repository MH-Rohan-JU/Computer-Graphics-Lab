import numpy as np

P = np.array([1, 1, 1, 1])

S = np.array([
    [2, 0, 0, 0],
    [0, 2, 0, 0],
    [0, 0, 2, 0],
    [0, 0, 0, 1]
])

theta = np.pi / 4
R = np.array([
    [np.cos(theta), -np.sin(theta), 0, 0],
    [np.sin(theta),  np.cos(theta), 0, 0],
    [0,              0,             1, 0],
    [0,              0,             0, 1]
])

T = np.array([
    [1, 0, 0, 3],
    [0, 1, 0, 4],
    [0, 0, 1, 5],
    [0, 0, 0, 1]
])

C = T @ R @ S
P_new = C @ P

print("Composite Transformed Point:", P_new)