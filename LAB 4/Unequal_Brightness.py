import matplotlib.pyplot as plt
import numpy as np

plt.figure()
plt.title('Unequal Brightness Levels')
plt.axis('off')

for I in range(8):
    BRIGHTNESS = I / 7
    plt.fill([I*2, I*2+1.5, I*2+1.5, I*2], [0, 0, 5, 5], color=[BRIGHTNESS, BRIGHTNESS, BRIGHTNESS])
    plt.text(I*2+0.75, 2.5, f'{I}', ha='center', va='center', fontsize=12, color='white' if I < 4 else 'black')

plt.xlim(0, 16)
plt.ylim(0, 5)
plt.show()
