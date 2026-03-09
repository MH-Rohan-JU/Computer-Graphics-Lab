clc; clear; close all;

WIDTH = 50; HEIGHT = 50;
IMAGE = ones(HEIGHT, WIDTH, 3) * 0.8;

figure;
hold on;
axis equal;
title('Boundary Fill Algorithm');
xlabel('X-axis');
ylabel('Y-axis');

function draw_rectangle(IMAGE)
    for X = 10:40
        IMAGE(11, X+1, :) = [0, 0, 0];
        IMAGE(31, X+1, :) = [0, 0, 0];
    end
    for Y = 10:30
        IMAGE(Y+1, 11, :) = [0, 0, 0];
        IMAGE(Y+1, 41, :) = [0, 0, 0];
    end
end

function boundary_fill(IMAGE, X, Y, FILL_COLOR, BOUNDARY_COLOR)
    if X < 1 || X > WIDTH || Y < 1 || Y > HEIGHT
        return;
    end
    if ~isequal(reshape(IMAGE(Y, X, :), 1, 3), BOUNDARY_COLOR) && ...
       ~isequal(reshape(IMAGE(Y, X, :), 1, 3), FILL_COLOR)
        IMAGE(Y, X, :) = FILL_COLOR;
        boundary_fill(IMAGE, X+1, Y, FILL_COLOR, BOUNDARY_COLOR);
        boundary_fill(IMAGE, X-1, Y, FILL_COLOR, BOUNDARY_COLOR);
        boundary_fill(IMAGE, X, Y+1, FILL_COLOR, BOUNDARY_COLOR);
        boundary_fill(IMAGE, X, Y-1, FILL_COLOR, BOUNDARY_COLOR);
    end
end

draw_rectangle(IMAGE);
boundary_fill(IMAGE, 25, 25, [1, 0, 0], [0, 0, 0]);

imshow(IMAGE);
