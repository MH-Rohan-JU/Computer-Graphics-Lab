import matplotlib.pyplot as plt
import numpy as np

x_start, y_start = 2.5, 3.5
x_end, y_end = 10.5, 8.5

dx_val = x_end - x_start
dy_val = y_end - y_start

step_count = int(max(abs(dx_val), abs(dy_val)))

x_step = dx_val / step_count
y_step = dy_val / step_count

x_pos = x_start
y_pos = y_start

x_vals = []
y_vals = []

for i in range(step_count + 1):
    x_vals.append(round(x_pos))
    y_vals.append(round(y_pos))
    x_pos += x_step
    y_pos += y_step

plt.figure(figsize=(6,6))
plt.plot(x_vals, y_vals, 'ks', markersize=8, markerfacecolor='k')
plt.title('Scan Conversion (DDA Line)')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.grid(True)
plt.axis('equal')
plt.show()
