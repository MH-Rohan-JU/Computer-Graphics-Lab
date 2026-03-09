clc; clear; close all;

X1 = 10; Y1 = 10;
X2 = 40; Y2 = 30;

figure;
hold on;
grid on;
axis equal;
title('Rectangle Scan Conversion');
xlabel('X-axis');
ylabel('Y-axis');

X_VALS = [];
Y_VALS = [];

for X = X1:X2
    X_VALS = [X_VALS X X];
    Y_VALS = [Y_VALS Y1 Y2];
end

for Y = Y1+1:Y2-1
    X_VALS = [X_VALS X1 X2];
    Y_VALS = [Y_VALS Y Y];
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot([X1 X2 X2 X1 X1], [Y1 Y1 Y2 Y2 Y1], 'r-', 'LineWidth', 2);
