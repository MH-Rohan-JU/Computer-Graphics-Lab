clc; clear; close all;

RADIUS = 8;
CENTER_X = 10;
CENTER_Y = 10;

figure;
hold on;
grid on;
axis equal;
title('Basic Circle Scan Conversion');
xlabel('X-axis'); ylabel('Y-axis');

THETA = 0:0.01:2*pi;
X_CIRCLE = CENTER_X + RADIUS * cos(THETA);
Y_CIRCLE = CENTER_Y + RADIUS * sin(THETA);
plot(X_CIRCLE, Y_CIRCLE, 'b-');

for X = CENTER_X-RADIUS:CENTER_X+RADIUS
    Y = round(CENTER_Y + sqrt(RADIUS^2 - (X - CENTER_X)^2));
    plot(X, Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(X, 2*CENTER_Y - Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
end
