clc; clear; close all;

X_START = 2; Y_START = 3;
X_END = 12; Y_END = 8;

X_VALS = [X_START X_END];
Y_VALS = [Y_START Y_END];

figure;
hold on;
grid on;
axis equal;
title('Basic Line Scan Conversion');
xlabel('X-axis'); ylabel('Y-axis');

for X = X_START:X_END
    Y = round(Y_START + (Y_END - Y_START) * (X - X_START) / (X_END - X_START));
    plot(X, Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
end

plot(X_VALS, Y_VALS, 'r--');A
