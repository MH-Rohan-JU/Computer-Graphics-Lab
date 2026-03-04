clc;
clear;
close all;

x_start = 2.5;
y_start = 3.5;
x_end = 10.5;
y_end = 8.5;

dx_val = x_end - x_start;
dy_val = y_end - y_start;

step_count = max(abs(dx_val), abs(dy_val));

x_inc = dx_val / step_count;
y_inc = dy_val / step_count;

x_pos = x_start;
y_pos = y_start;

figure;
hold on;
grid on;
title('Scan Conversion');
xlabel('X-axis');
ylabel('Y-axis');

for i = 1:step_count
    plot(round(x_pos), round(y_pos), 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    x_pos = x_pos + x_inc;
    y_pos = y_pos + y_inc;
end

axis equal;
