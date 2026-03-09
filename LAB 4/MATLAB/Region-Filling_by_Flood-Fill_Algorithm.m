clc; clear; close all;

WIDTH = 50; HEIGHT = 50;
IMAGE = ones(HEIGHT, WIDTH, 3) * 0.8;

figure;
hold on;
axis equal;
title('Flood Fill Algorithm');
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

function flood_fill(IMAGE, X, Y, FILL_COLOR, OLD_COLOR)
    if X < 1 || X > WIDTH || Y < 1 || Y > HEIGHT
        return;
    end
    if isequal(reshape(IMAGE(Y, X, :), 1, 3), OLD_COLOR)
        IMAGE(Y, X, :) = FILL_COLOR;
        flood_fill(IMAGE, X+1, Y, FILL_COLOR, OLD_COLOR);
        flood_fill(IMAGE, X-1, Y, FILL_COLOR, OLD_COLOR);
        flood_fill(IMAGE, X, Y+1, FILL_COLOR, OLD_COLOR);
        flood_fill(IMAGE, X, Y-1, FILL_COLOR, OLD_COLOR);
    end
end

draw_rectangle(IMAGE);
flood_fill(IMAGE, 25, 25, [0, 0, 1], [0.8, 0.8, 0.8]);

imshow(IMAGE);
