clc; clear; close all;

CX = 25; CY = 25;
RADIUS = 15;
START_ANGLE = 30;
END_ANGLE = 120;
NUM_POINTS = 100;

figure;
hold on;
grid on;
axis equal;
title('Arc - Trigonometric Method');
xlabel('X-axis');
ylabel('Y-axis');

START_RAD = deg2rad(START_ANGLE);
END_RAD = deg2rad(END_ANGLE);
THETA = linspace(START_RAD, END_RAD, NUM_POINTS);
X_VALS = [];
Y_VALS = [];

for T = THETA
    X = round(CX + RADIUS * cos(T));
    Y = round(CY + RADIUS * sin(T));
    X_VALS = [X_VALS X];
    Y_VALS = [Y_VALS Y];
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot(CX, CY, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
