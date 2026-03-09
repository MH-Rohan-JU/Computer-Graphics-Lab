clc; clear; close all;

figure;
hold on;
grid on;
axis equal;
title('Bitmap Font - Character A');
xlabel('X-axis');
ylabel('Y-axis');
xlim([-1, 8]);
ylim([-1, 8]);

CHAR_A = [
    0, 0, 1, 1, 1, 0, 0;
    0, 1, 0, 0, 0, 1, 0;
    1, 0, 0, 0, 0, 0, 1;
    1, 0, 0, 0, 0, 0, 1;
    1, 1, 1, 1, 1, 1, 1;
    1, 0, 0, 0, 0, 0, 1;
    1, 0, 0, 0, 0, 0, 1
];

X_VALS = [];
Y_VALS = [];

[ROWS, COLS] = size(CHAR_A);
for Y = 1:ROWS
    for X = 1:COLS
        if CHAR_A(Y, X) == 1
            X_VALS = [X_VALS X-1];
            Y_VALS = [Y_VALS ROWS-Y];
        end
    end
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 20, 'MarkerFaceColor', 'k');
