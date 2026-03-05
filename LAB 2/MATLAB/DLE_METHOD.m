clc; clear; close all;

X1 = 2; Y1 = 3;
X2 = 12; Y2 = 8;

DX = X2 - X1;
DY = Y2 - Y1;
M = DY / DX;

figure;
hold on;
grid on;
axis equal;
title('Direct Line Equation Method');
xlabel('X-axis'); ylabel('Y-axis');

X_VALS = [];
Y_VALS = [];

for X = X1:X2
    Y = round(Y1 + M * (X - X1));
    X_VALS = [X_VALS X];
    Y_VALS = [Y_VALS Y];
    plot(X, Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
end

plot([X1 X2], [Y1 Y2], 'r--');
