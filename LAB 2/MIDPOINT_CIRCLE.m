clc; clear; close all;

RADIUS = 10;
CX = 20;
CY = 20;

figure('Position', [100 100 600 500]);
hold on;
grid on;
axis equal;
axis([CX-RADIUS-5 CX+RADIUS+5 CY-RADIUS-5 CY+RADIUS+5]);
title('Midpoint Circle Algorithm', 'FontSize', 14);
xlabel('X-axis', 'FontSize', 12);
ylabel('Y-axis', 'FontSize', 12);


x = 0;
y = RADIUS;
d = 1 - RADIUS;


points_x = [];
points_y = [];


while x <= y

    sym_points = [x, y; -x, y; x, -y; -x, -y;
                  y, x; -y, x; y, -x; -y, -x];


    actual_x = CX + sym_points(:,1);
    actual_y = CY + sym_points(:,2);


    points_x = [points_x; actual_x];
    points_y = [points_y; actual_y];


    if d < 0
        d = d + 2*x + 3;
    else
        d = d + 2*(x-y) + 5;
        y = y - 1;
    end
    x = x + 1;
end


plot(points_x, points_y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');


theta = 0:0.01:2*pi;
circle_x = CX + RADIUS * cos(theta);
circle_y = CY + RADIUS * sin(theta);
plot(circle_x, circle_y, 'b-', 'LineWidth', 2);


plot(CX, CY, 'ro', 'MarkerSize', 12, 'MarkerFaceColor', 'r');


text(CX, CY+RADIUS+3, sprintf('Radius = %d', RADIUS), ...
    'HorizontalAlignment', 'center', 'FontSize', 10, 'FontWeight', 'bold');
