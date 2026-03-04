import numpy as np
import matplotlib.pyplot as plt

c_val = 0.70
m_val = 0.90
y_val = 0.10

r_val = 1 - c_val
g_val = 1 - m_val
b_val = 1 - y_val

print(f"R = {r_val:.3f}")
print(f"G = {g_val:.3f}")
print(f"B = {b_val:.3f}")

cmy_block = np.array([[[c_val, m_val, y_val]]])
rgb_block = np.array([[[r_val, g_val, b_val]]])

plt.figure()
plt.subplot(1, 2, 1)
plt.imshow(cmy_block)
plt.title("CMY Color")
plt.axis("off")

plt.subplot(1, 2, 2)
plt.imshow(rgb_block)
plt.title("Converted RGB Color")
plt.axis("off")

plt.show()
