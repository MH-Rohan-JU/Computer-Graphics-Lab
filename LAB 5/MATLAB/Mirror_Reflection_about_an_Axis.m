clc; clear; close all;

ORIGINAL_POINTS = [2, 2; 4, 2; 4, 5; 2, 5; 2, 2];

figure('Position', [100, 100, 1400, 400]);

subplot(1, 3, 1);
hold on; grid on; axis equal;
title('Reflection about X-axis');
xlabel('X-axis'); ylabel('Y-axis');
X_AXIS_REFLECTION = ORIGINAL_POINTS .* [1, -1];
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5);
plot(X_AXIS_REFLECTION(:, 1), X_AXIS_REFLECTION(:, 2), 'r-', 'LineWidth', 2);
fill(X_AXIS_REFLECTION(:, 1), X_AXIS_REFLECTION(:, 2), 'r', 'FaceAlpha', 0.3);
line([-6, 6], [0, 0], 'Color', 'k', 'LineWidth', 1);
xlim([-6, 6]); ylim([-6, 6]);

subplot(1, 3, 2);
hold on; grid on; axis equal;
title('Reflection about Y-axis');
xlabel('X-axis'); ylabel('Y-axis');
Y_AXIS_REFLECTION = ORIGINAL_POINTS .* [-1, 1];
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5);
plot(Y_AXIS_REFLECTION(:, 1), Y_AXIS_REFLECTION(:, 2), 'g-', 'LineWidth', 2);
fill(Y_AXIS_REFLECTION(:, 1), Y_AXIS_REFLECTION(:, 2), 'g', 'FaceAlpha', 0.3);
line([0, 0], [-6, 6], 'Color', 'k', 'LineWidth', 1);
xlim([-6, 6]); ylim([-6, 6]);

subplot(1, 3, 3);
hold on; grid on; axis equal;
title('Reflection about Origin');
xlabel('X-axis'); ylabel('Y-axis');
ORIGIN_REFLECTION = ORIGINAL_POINTS .* [-1, -1];
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b--', 'LineWidth', 1.5);
plot(ORIGIN_REFLECTION(:, 1), ORIGIN_REFLECTION(:, 2), 'm-', 'LineWidth', 2);
fill(ORIGIN_REFLECTION(:, 1), ORIGIN_REFLECTION(:, 2), 'm', 'FaceAlpha', 0.3);
line([-6, 6], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
line([0, 0], [-6, 6], 'Color', 'k', 'LineWidth', 0.5);
xlim([-6, 6]); ylim([-6, 6]);
