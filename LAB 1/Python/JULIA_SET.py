import numpy as np
import matplotlib.pyplot as plt

r_val = 50
g_val = 150
b_val = 200

r_norm = r_val / 255
g_norm = g_val / 255
b_norm = b_val / 255

c_val = 1 - r_norm
m_val = 1 - g_norm
y_val = 1 - b_norm

print(f'C = {c_val:.3f}')
print(f'M = {m_val:.3f}')
print(f'Y = {y_val:.3f}')

rgb_block = np.array([[[r_norm, g_norm, b_norm]]])
cmy_block = np.array([[[c_val, m_val, y_val]]])

plt.figure(figsize=(6,3))
plt.subplot(1,2,1)
plt.imshow(rgb_block)
plt.title('RGB Color')
plt.axis('off')

plt.subplot(1,2,2)
plt.imshow(cmy_block)
plt.title('CMY Color')
plt.axis('off')

plt.show()

julia_const = -0.7 + 0.27015j
max_iter = 200

x_vals = np.linspace(-1.5, 1.5, 1000)
y_vals = np.linspace(-1.5, 1.5, 1000)
x_grid, y_grid = np.meshgrid(x_vals, y_vals)
z_grid = x_grid + 1j * y_grid

julia_set = np.zeros(z_grid.shape, dtype=int)

for k in range(max_iter):
    z_grid = z_grid**2 + julia_const
    mask = np.abs(z_grid) <= 2
    julia_set[mask] += 1

plt.figure(figsize=(6,6))
plt.imshow(julia_set, extent=[x_vals.min(), x_vals.max(), y_vals.min(), y_vals.max()], cmap='hot', origin='lower')
plt.colorbar(label='Iteration Count')
plt.title('Julia Set')
plt.xlabel('Real Axis')
plt.ylabel('Imaginary Axis')
plt.show()
