clc; clear; close all;

WINDOW_XMIN = -10; WINDOW_YMIN = -10; WINDOW_XMAX = 10; WINDOW_YMAX = 10;
VIEWPORT_XMIN = 50; VIEWPORT_YMIN = 50; VIEWPORT_XMAX = 250; VIEWPORT_YMAX = 250;

POINTS = [-8, -8; -5, 5; 0, 0; 5, -5; 8, 8];

SX = (VIEWPORT_XMAX - VIEWPORT_XMIN) / (WINDOW_XMAX - WINDOW_XMIN);
SY = (VIEWPORT_YMAX - VIEWPORT_YMIN) / (WINDOW_YMAX - WINDOW_YMIN);

MAPPED_POINTS = zeros(size(POINTS));
MAPPED_POINTS(:, 1) = VIEWPORT_XMIN + (POINTS(:, 1) - WINDOW_XMIN) * SX;
MAPPED_POINTS(:, 2) = VIEWPORT_YMIN + (POINTS(:, 2) - WINDOW_YMIN) * SY;

figure('Position', [100, 100, 1000, 400]);

subplot(1, 2, 1);
hold on; grid on; axis equal;
title('World Window');
xlabel('X-axis'); ylabel('Y-axis');
plot([WINDOW_XMIN, WINDOW_XMAX, WINDOW_XMAX, WINDOW_XMIN, WINDOW_XMIN], ...
     [WINDOW_YMIN, WINDOW_YMIN, WINDOW_YMAX, WINDOW_YMAX, WINDOW_YMIN], 'b-', 'LineWidth', 2);
scatter(POINTS(:, 1), POINTS(:, 2), 50, 'r', 'filled');
for I = 1:size(POINTS, 1)
    text(POINTS(I, 1)+0.5, POINTS(I, 2)+0.5, ['P', num2str(I)]);
end
xlim([-12, 12]); ylim([-12, 12]);

subplot(1, 2, 2);
hold on; grid on; axis equal;
title('Viewport');
xlabel('X-axis'); ylabel('Y-axis');
plot([VIEWPORT_XMIN, VIEWPORT_XMAX, VIEWPORT_XMAX, VIEWPORT_XMIN, VIEWPORT_XMIN], ...
     [VIEWPORT_YMIN, VIEWPORT_YMIN, VIEWPORT_YMAX, VIEWPORT_YMAX, VIEWPORT_YMIN], 'g-', 'LineWidth', 2);
scatter(MAPPED_POINTS(:, 1), MAPPED_POINTS(:, 2), 50, 'r', 'filled');
for I = 1:size(MAPPED_POINTS, 1)
    text(MAPPED_POINTS(I, 1)+5, MAPPED_POINTS(I, 2)+5, ['P', num2str(I)]);
end
xlim([40, 260]); ylim([40, 260]);

fprintf('Original Points (Window Coordinates):\n');
for I = 1:size(POINTS, 1)
    fprintf('P%d: (%.1f, %.1f)\n', I, POINTS(I, 1), POINTS(I, 2));
end
fprintf('\nMapped Points (Viewport Coordinates):\n');
for I = 1:size(MAPPED_POINTS, 1)
    fprintf('P%d: (%.1f, %.1f)\n', I, MAPPED_POINTS(I, 1), MAPPED_POINTS(I, 2));
end
