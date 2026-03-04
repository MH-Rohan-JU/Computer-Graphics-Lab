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

print(f"C = {c_val:.3f}")
print(f"M = {m_val:.3f}")
print(f"Y = {y_val:.3f}")

rgb_block = np.array([[[r_norm, g_norm, b_norm]]])
cmy_block = np.array([[[c_val, m_val, y_val]]])

plt.figure()
plt.subplot(1, 2, 1)
plt.imshow(rgb_block)
plt.title("RGB Color")
plt.axis("off")

plt.subplot(1, 2, 2)
plt.imshow(cmy_block)
plt.title("CMY Color")
plt.axis("off")

plt.show()
