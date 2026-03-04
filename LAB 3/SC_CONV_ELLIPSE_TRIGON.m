clc; clear; close all;

RX = 15;
RY = 8;
CX = 25;
CY = 15;
NUM_POINTS = 200;

figure;
hold on;
grid on;
axis equal;
title('Ellipse - Trigonometric Method');
xlabel('X-axis');
ylabel('Y-axis');

THETA = linspace(0, 2*pi, NUM_POINTS);
X_VALS = [];
Y_VALS = [];

for T = THETA
    X = round(CX + RX * cos(T));
    Y = round(CY + RY * sin(T));
    X_VALS = [X_VALS X];
    Y_VALS = [Y_VALS Y];
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot(CX, CY, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
