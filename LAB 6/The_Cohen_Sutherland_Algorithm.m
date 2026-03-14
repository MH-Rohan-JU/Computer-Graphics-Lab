clc; clear; close all;

XMIN = 3; YMIN = 3; XMAX = 8; YMAX = 8;
INSIDE = 0; LEFT = 1; RIGHT = 2; BOTTOM = 4; TOP = 8;

LINES = {[2, 2, 10, 10]; [1, 5, 10, 5]; [5, 1, 5, 10]; [9, 2, 9, 9]; [2, 9, 9, 2]};

function CODE = compute_outcode(X, Y, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP)
    CODE = INSIDE;
    if X < XMIN, CODE = bitor(CODE, LEFT); end
    if X > XMAX, CODE = bitor(CODE, RIGHT); end
    if Y < YMIN, CODE = bitor(CODE, BOTTOM); end
    if Y > YMAX, CODE = bitor(CODE, TOP); end
end

function [ACCEPT, X1, Y1, X2, Y2] = cohen_sutherland_clip(X1, Y1, X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP)
    ACCEPT = false;
    while true
        OUTCODE1 = compute_outcode(X1, Y1, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP);
        OUTCODE2 = compute_outcode(X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP);
        
        if ~bitor(OUTCODE1, OUTCODE2)
            ACCEPT = true;
            break;
        elseif bitand(OUTCODE1, OUTCODE2)
            break;
        else
            X = 0; Y = 0;
            OUTCODE_OUT = OUTCODE1;
            if OUTCODE1 == 0
                OUTCODE_OUT = OUTCODE2;
            end
            
            if bitand(OUTCODE_OUT, TOP)
                X = X1 + (X2 - X1) * (YMAX - Y1) / (Y2 - Y1);
                Y = YMAX;
            elseif bitand(OUTCODE_OUT, BOTTOM)
                X = X1 + (X2 - X1) * (YMIN - Y1) / (Y2 - Y1);
                Y = YMIN;
            elseif bitand(OUTCODE_OUT, RIGHT)
                Y = Y1 + (Y2 - Y1) * (XMAX - X1) / (X2 - X1);
                X = XMAX;
            elseif bitand(OUTCODE_OUT, LEFT)
                Y = Y1 + (Y2 - Y1) * (XMIN - X1) / (X2 - X1);
                X = XMIN;
            end
            
            if OUTCODE_OUT == OUTCODE1
                X1 = X; Y1 = Y;
            else
                X2 = X; Y2 = Y;
            end
        end
    end
end

figure;
hold on; grid on; axis equal;
title('Cohen-Sutherland Line Clipping');
xlabel('X-axis'); ylabel('Y-axis');

plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Window');

for I = 1:length(LINES)
    LINE = LINES{I};
    X1 = LINE(1); Y1 = LINE(2); X2 = LINE(3); Y2 = LINE(4);
    
    plot([X1, X2], [Y1, Y2], 'r--', 'LineWidth', 1.5);
    
    [ACCEPT, CX1, CY1, CX2, CY2] = cohen_sutherland_clip(X1, Y1, X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP);
    if ACCEPT
        plot([CX1, CX2], [CY1, CY2], 'g-', 'LineWidth', 2.5);
    end
end

xlim([0, 12]); ylim([0, 12]);
legend('Clip Window', 'Location', 'best');
