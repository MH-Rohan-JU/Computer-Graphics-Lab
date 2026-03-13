clc; clear; close all;

ORIGINAL_POINTS = [3, 1; 5, 1; 5, 3; 3, 3; 3, 1];
ANGLE = 45;
RAD = deg2rad(ANGLE);

figure('Position', [100, 100, 1000, 400]);

subplot(1, 2, 1);
hold on; grid on; axis equal;
title('Original Rectangle');
xlabel('X-axis'); ylabel('Y-axis');
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b-', 'LineWidth', 2);
fill(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b', 'FaceAlpha', 0.3);
xlim([-6, 6]); ylim([-6, 6]);
line([-6, 6], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
line([0, 0], [-6, 6], 'Color', 'k', 'LineWidth', 0.5);

subplot(1, 2, 2);
hold on; grid on; axis equal;
title(['Rotation about Origin: ', num2str(ANGLE), '°']);
xlabel('X-axis'); ylabel('Y-axis');

ROTATION_MATRIX = [cos(RAD), -sin(RAD); sin(RAD), cos(RAD)];
ROTATED_POINTS = ORIGINAL_POINTS * ROTATION_MATRIX;

plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5, 'DisplayName', 'Original');
plot(ROTATED_POINTS(:, 1), ROTATED_POINTS(:, 2), 'r-', 'LineWidth', 2, 'DisplayName', 'Rotated');
fill(ROTATED_POINTS(:, 1), ROTATED_POINTS(:, 2), 'r', 'FaceAlpha', 0.3);
line([-6, 6], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
line([0, 0], [-6, 6], 'Color', 'k', 'LineWidth', 0.5);
legend;
xlim([-6, 6]); ylim([-6, 6]);
