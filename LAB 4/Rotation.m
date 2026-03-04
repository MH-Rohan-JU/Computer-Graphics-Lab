clc; clear; close all;

ORIGINAL_POINTS = [5, 5; 8, 8; 5, 11; 2, 8; 5, 5];
CENTER = [5, 8];
ANGLE = 45;
RAD = deg2rad(ANGLE);

figure;
hold on;
grid on;
axis equal;
title('2D Rotation');
xlabel('X-axis');
ylabel('Y-axis');

plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b-', 'LineWidth', 2);
fill(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b', 'FaceAlpha', 0.3);

ROTATION_MATRIX = [cos(RAD), -sin(RAD); sin(RAD), cos(RAD)];
RELATIVE_POINTS = ORIGINAL_POINTS - CENTER;
ROTATED_RELATIVE = RELATIVE_POINTS * ROTATION_MATRIX;
ROTATED_POINTS = ROTATED_RELATIVE + CENTER;

plot(ROTATED_POINTS(:, 1), ROTATED_POINTS(:, 2), 'r-', 'LineWidth', 2);
fill(ROTATED_POINTS(:, 1), ROTATED_POINTS(:, 2), 'r', 'FaceAlpha', 0.3);
plot(CENTER(1), CENTER(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

legend('Original', 'Rotated');
