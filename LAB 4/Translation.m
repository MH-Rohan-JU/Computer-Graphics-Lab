clc; clear; close all;

ORIGINAL_POINTS = [5, 5; 8, 8; 5, 11; 2, 8; 5, 5];
TX = 12; TY = 3;

figure;
hold on;
grid on;
axis equal;
title('2D Translation');
xlabel('X-axis');
ylabel('Y-axis');

plot(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b-', 'LineWidth', 2);
fill(ORIGINAL_POINTS(:, 1), ORIGINAL_POINTS(:, 2), 'b', 'FaceAlpha', 0.3);

TRANSLATED_POINTS = ORIGINAL_POINTS + [TX, TY];
plot(TRANSLATED_POINTS(:, 1), TRANSLATED_POINTS(:, 2), 'r-', 'LineWidth', 2);
fill(TRANSLATED_POINTS(:, 1), TRANSLATED_POINTS(:, 2), 'r', 'FaceAlpha', 0.3);

legend('Original', 'Translated');
