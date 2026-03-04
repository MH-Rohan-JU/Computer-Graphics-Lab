clc; clear; close all;

ORIGINAL_POINTS = [2, 2; 4, 2; 4, 5; 2, 5; 2, 2];
ANGLE = 30;
RAD = deg2rad(ANGLE);

figure('Position', [100, 100, 1400, 400]);

subplot(1, 3, 1);
hold on; grid on; axis equal;
title('Reflection about X-axis');
xlabel('X-axis'); ylabel('Y-axis');
X_AXIS_MATRIX = [1, 0; 0, -1];
X_REFLECTION = ORIGINAL_POINTS * X_AXIS_MATRIX;
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5);
plot(X_REFLECTION(:, 1), X_REFLECTION(:, 2), 'r-', 'LineWidth', 2);
fill(X_REFLECTION(:, 1), X_REFLECTION(:, 2), 'r', 'FaceAlpha', 0.3);
line([-6, 6], [0, 0], 'Color', 'k', 'LineWidth', 1);
xlim([-6, 6]); ylim([-6, 6]);

subplot(1, 3, 2);
hold on; grid on; axis equal;
title('Reflection about Y-axis');
xlabel('X-axis'); ylabel('Y-axis');
Y_AXIS_MATRIX = [-1, 0; 0, 1];
Y_REFLECTION = ORIGINAL_POINTS * Y_AXIS_MATRIX;
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5);
plot(Y_REFLECTION(:, 1), Y_REFLECTION(:, 2), 'g-', 'LineWidth', 2);
fill(Y_REFLECTION(:, 1), Y_REFLECTION(:, 2), 'g', 'FaceAlpha', 0.3);
line([0, 0], [-6, 6], 'Color', 'k', 'LineWidth', 1);
xlim([-6, 6]); ylim([-6, 6]);

subplot(1, 3, 3);
hold on; grid on; axis equal;
title(['Reflection about line at ', num2str(ANGLE), '°']);
xlabel('X-axis'); ylabel('Y-axis');

LINE_X = linspace(-6, 6, 100);
LINE_Y = tan(RAD) * LINE_X;
plot(LINE_X, LINE_Y, 'k-', 'LineWidth', 1);

COS2A = cos(2 * RAD);
SIN2A = sin(2 * RAD);
LINE_MATRIX = [COS2A, SIN2A; SIN2A, -COS2A];
LINE_REFLECTION = ORIGINAL_POINTS * LINE_MATRIX;

plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5);
plot(LINE_REFLECTION(:, 1), LINE_REFLECTION(:, 2), 'm-', 'LineWidth', 2);
fill(LINE_REFLECTION(:, 1), LINE_REFLECTION(:, 2), 'm', 'FaceAlpha', 0.3);
xlim([-6, 6]); ylim([-6, 6]);
