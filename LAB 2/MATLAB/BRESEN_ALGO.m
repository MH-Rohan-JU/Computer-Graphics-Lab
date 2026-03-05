clc; clear; close all;

X1 = 2; Y1 = 3;
X2 = 12; Y2 = 8;

DX = abs(X2 - X1);
DY = abs(Y2 - Y1);

if X1 < X2
    X_INC = 1;
else
    X_INC = -1;
end

if Y1 < Y2
    Y_INC = 1;
else
    Y_INC = -1;
end

X = X1;
Y = Y1;
ERROR = 2 * DY - DX;

figure;
hold on;
grid on;
axis equal;
title('Bresenham''s Line Algorithm');
xlabel('X-axis'); ylabel('Y-axis');

plot(X, Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');

for I = 1:DX
    if ERROR >= 0
        Y = Y + Y_INC;
        ERROR = ERROR - 2 * DX;
    end
    X = X + X_INC;
    ERROR = ERROR + 2 * DY;
    plot(X, Y, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
end

plot([X1 X2], [Y1 Y2], 'r--');
