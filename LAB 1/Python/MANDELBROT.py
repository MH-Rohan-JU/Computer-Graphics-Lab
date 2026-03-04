import numpy as np
import matplotlib.pyplot as plt

max_iter = 200

x_vals = np.linspace(-2.5, 1, 1000)
y_vals = np.linspace(-1.5, 1.5, 1000)
x_grid, y_grid = np.meshgrid(x_vals, y_vals)
c_grid = x_grid + 1j * y_grid

z_grid = np.zeros_like(c_grid, dtype=complex)
mandelbrot = np.zeros(c_grid.shape)

for _ in range(max_iter):
    z_grid = z_grid**2 + c_grid
    mask = np.abs(z_grid) <= 2
    mandelbrot[mask] += 1

plt.figure()
plt.imshow(
    mandelbrot,
    extent=[x_vals.min(), x_vals.max(), y_vals.min(), y_vals.max()],
    cmap='hot',
    origin='lower'
)
plt.colorbar()
plt.title("Mandelbrot Set")
plt.xlabel("Real Axis")
plt.ylabel("Imaginary Axis")
plt.axis("equal")
plt.tight_layout()
plt.show()
