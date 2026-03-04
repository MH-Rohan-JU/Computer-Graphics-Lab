clc; clear; close all;

RX = 15;
RY = 8;
CX = 25;
CY = 15;

figure;
hold on;
grid on;
axis equal;
title('Ellipse - Polynomial Method');
xlabel('X-axis');
ylabel('Y-axis');

X_VALS = [];
Y_VALS = [];

for X = CX - RX:CX + RX
    Y_OFFSET = RY * sqrt(1 - ((X - CX) ^ 2) / (RX ^ 2));
    Y1 = round(CY + Y_OFFSET);
    Y2 = round(CY - Y_OFFSET);
    X_VALS = [X_VALS X X];
    Y_VALS = [Y_VALS Y1 Y2];
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot(CX, CY, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
