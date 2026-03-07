clc; clear; close all;

RX = 15;
RY = 8;
CX = 25;
CY = 15;
ANGLE = pi / 4;
NUM_POINTS = 200;

figure;
hold on;
grid on;
axis equal;
title('Ellipse Axis Rotation');
xlabel('X-axis');
ylabel('Y-axis');

THETA = linspace(0, 2*pi, NUM_POINTS);
X_VALS = [];
Y_VALS = [];

for T = THETA
    X_LOCAL = RX * cos(T);
    Y_LOCAL = RY * sin(T);
    X_ROT = X_LOCAL * cos(ANGLE) - Y_LOCAL * sin(ANGLE);
    Y_ROT = X_LOCAL * sin(ANGLE) + Y_LOCAL * cos(ANGLE);
    X_VALS = [X_VALS round(CX + X_ROT)];
    Y_VALS = [Y_VALS round(CY + Y_ROT)];
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot(CX, CY, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Draw axes
LINE_LENGTH = max(RX, RY) * 1.5;
X1 = CX + LINE_LENGTH * cos(ANGLE);
Y1 = CY + LINE_LENGTH * sin(ANGLE);
X2 = CX - LINE_LENGTH * cos(ANGLE);
Y2 = CY - LINE_LENGTH * sin(ANGLE);
plot([X2 X1], [Y2 Y1], 'g--', 'LineWidth', 1);

X1 = CX + LINE_LENGTH * cos(ANGLE + pi/2);
Y1 = CY + LINE_LENGTH * sin(ANGLE + pi/2);
X2 = CX - LINE_LENGTH * cos(ANGLE + pi/2);
Y2 = CY - LINE_LENGTH * sin(ANGLE + pi/2);
plot([X2 X1], [Y2 Y1], 'g--', 'LineWidth', 1);
