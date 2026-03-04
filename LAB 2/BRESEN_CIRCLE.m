clc; clear; close all;

RADIUS = 8;
CENTER_X = 10;
CENTER_Y = 10;

figure;
hold on;
grid on;
axis equal;
title('Bresenham''s Circle Algorithm');
xlabel('X-axis'); ylabel('Y-axis');

X = 0;
Y = RADIUS;
D = 3 - 2 * RADIUS;

while X <= Y
    plot(CENTER_X + X, CENTER_Y + Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X - X, CENTER_Y + Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X + X, CENTER_Y - Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X - X, CENTER_Y - Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X + Y, CENTER_Y + X, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X - Y, CENTER_Y + X, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X + Y, CENTER_Y - X, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    plot(CENTER_X - Y, CENTER_Y - X, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');

    if D < 0
        D = D + 4 * X + 6;
    else
        D = D + 4 * (X - Y) + 10;
        Y = Y - 1;
    end
    X = X + 1;
end

THETA = 0:0.01:2*pi;
X_CIRCLE = CENTER_X + RADIUS * cos(THETA);
Y_CIRCLE = CENTER_Y + RADIUS * sin(THETA);
plot(X_CIRCLE, Y_CIRCLE, 'b-');
