clc; clear; close all;

ORIGINAL_POINTS = [2, 2; 5, 2; 5, 5; 2, 5; 2, 2];
SX = 1.5; SY = 0.8;

figure('Position', [100, 100, 1000, 400]);

subplot(1, 2, 1);
hold on; grid on; axis equal;
title('Original Square');
xlabel('X-axis'); ylabel('Y-axis');
plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b-', 'LineWidth', 2);
fill(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b', 'FaceAlpha', 0.3);
xlim([-1, 8]); ylim([-1, 8]);
line([-1, 8], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
line([0, 0], [-1, 8], 'Color', 'k', 'LineWidth', 0.5);

subplot(1, 2, 2);
hold on; grid on; axis equal;
title(['Scaled: Sx=', num2str(SX), ', Sy=', num2str(SY)]);
xlabel('X-axis'); ylabel('Y-axis');

SCALED_POINTS = ORIGINAL_POINTS .* [SX, SY];
plot(SCALED_POINTS(:, 1), SCALED_POINTS(:, 2), 'r-', 'LineWidth', 2);
fill(SCALED_POINTS(:, 1), SCALED_POINTS(:, 2), 'r', 'FaceAlpha', 0.3);
xlim([-1, 8]); ylim([-1, 8]);
line([-1, 8], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
line([0, 0], [-1, 8], 'Color', 'k', 'LineWidth', 0.5);
