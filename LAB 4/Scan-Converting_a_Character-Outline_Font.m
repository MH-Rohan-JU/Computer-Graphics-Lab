clc; clear; close all;

figure;
hold on;
grid on;
axis equal;
title('Outline Font - Character A');
xlabel('X-axis');
ylabel('Y-axis');
xlim([0, 10]);
ylim([0, 10]);

OUTLINE_POINTS = [5, 1; 2, 9; 8, 9; 5, 1; 3, 6; 7, 6];

plot(OUTLINE_POINTS(1:4, 1), OUTLINE_POINTS(1:4, 2), 'b-', 'LineWidth', 3);
plot([OUTLINE_POINTS(4,1), OUTLINE_POINTS(5,1)], [OUTLINE_POINTS(4,2), OUTLINE_POINTS(5,2)], 'b-', 'LineWidth', 3);
plot([OUTLINE_POINTS(4,1), OUTLINE_POINTS(6,1)], [OUTLINE_POINTS(4,2), OUTLINE_POINTS(6,2)], 'b-', 'LineWidth', 3);
