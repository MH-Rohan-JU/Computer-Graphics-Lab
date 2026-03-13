clc; clear; close all;

ORIGINAL_POINTS = [2, 2; 4, 2; 4, 4; 2, 4; 2, 2];
TX = 5; TY = 3;

figure;
hold on; grid on; axis equal;
title(['Translation: Tx=', num2str(TX), ', Ty=', num2str(TY)]);
xlabel('X-axis'); ylabel('Y-axis');

plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b-', 'LineWidth', 2, 'DisplayName', 'Original');
fill(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b', 'FaceAlpha', 0.3);

TRANSLATED_POINTS = ORIGINAL_POINTS + [TX, TY];
plot(TRANSLATED_POINTS(:, 1), TRANSLATED_POINTS(:, 2), 'r-', 'LineWidth', 2, 'DisplayName', 'Translated');
fill(TRANSLATED_POINTS(:, 1), TRANSLATED_POINTS(:, 2), 'r', 'FaceAlpha', 0.3);

line([0, 10], [0, 0], 'Color', 'k', 'LineWidth', 0.5);
line([0, 0], [0, 10], 'Color', 'k', 'LineWidth', 0.5);
legend;
xlim([0, 10]); ylim([0, 10]);
