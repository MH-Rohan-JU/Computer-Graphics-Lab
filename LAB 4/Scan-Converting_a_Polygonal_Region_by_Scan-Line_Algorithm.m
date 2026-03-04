clc; clear; close all;

WIDTH = 50; HEIGHT = 50;
IMAGE = ones(HEIGHT, WIDTH, 3) * 0.9;
POLYGON = [10, 10; 40, 15; 35, 35; 15, 30];

figure;
hold on;
axis equal;
title('Scan-Line Polygon Fill');
xlabel('X-axis');
ylabel('Y-axis');

function draw_polygon(IMAGE, POLYGON)
    [N, ~] = size(POLYGON);
    for I = 1:N
        X1 = POLYGON(I, 1); Y1 = POLYGON(I, 2);
        J = mod(I, N) + 1;
        X2 = POLYGON(J, 1); Y2 = POLYGON(J, 2);
        
        STEPS = max(abs(X2 - X1), abs(Y2 - Y1));
        if STEPS == 0
            continue;
        end
        for T = 0:1/STEPS:1
            X = round(X1 + T * (X2 - X1));
            Y = round(Y1 + T * (Y2 - Y1));
            if X >= 1 && X <= 50 && Y >= 1 && Y <= 50
                IMAGE(Y, X, :) = [0, 0, 0];
            end
        end
    end
end

function scanline_fill(IMAGE, POLYGON)
    [H, W, ~] = size(IMAGE);
    [N, ~] = size(POLYGON);
    
    for Y = 1:H
        INTERSECTIONS = [];
        for I = 1:N
            X1 = POLYGON(I, 1); Y1 = POLYGON(I, 2);
            J = mod(I, N) + 1;
            X2 = POLYGON(J, 1); Y2 = POLYGON(J, 2);
            
            if (Y1 <= Y && Y < Y2) || (Y2 <= Y && Y < Y1)
                if Y1 ~= Y2
                    X_INTERSECT = round(X1 + (Y - Y1) * (X2 - X1) / (Y2 - Y1));
                    INTERSECTIONS = [INTERSECTIONS, X_INTERSECT];
                end
            end
        end
        INTERSECTIONS = sort(INTERSECTIONS);
        for J = 1:2:length(INTERSECTIONS)-1
            for X = INTERSECTIONS(J):INTERSECTIONS(J+1)
                if X >= 1 && X <= W && Y >= 1 && Y <= H
                    if isequal(reshape(IMAGE(Y, X, :), 1, 3), [0.9, 0.9, 0.9])
                        IMAGE(Y, X, :) = [0, 1, 0];
                    end
                end
            end
        end
    end
end

draw_polygon(IMAGE, POLYGON);
scanline_fill(IMAGE, POLYGON);

imshow(IMAGE);
