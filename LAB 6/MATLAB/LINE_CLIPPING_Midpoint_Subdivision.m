clc; clear; close all;

XMIN = 3; YMIN = 3; XMAX = 8; YMAX = 8;
INSIDE = 0; LEFT = 1; RIGHT = 2; BOTTOM = 4; TOP = 8;
EPSILON = 0.01;

LINES = {[2, 2, 10, 10]; [1, 5, 10, 5]; [5, 1, 5, 10]; [9, 2, 9, 9]; [2, 9, 9, 2]};

function CODE = compute_outcode(X, Y, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP)
    CODE = INSIDE;
    if X < XMIN, CODE = bitor(CODE, LEFT); end
    if X > XMAX, CODE = bitor(CODE, RIGHT); end
    if Y < YMIN, CODE = bitor(CODE, BOTTOM); end
    if Y > YMAX, CODE = bitor(CODE, TOP); end
end

function SEGMENTS = midpoint_subdivision(X1, Y1, X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP, EPSILON)
    SEGMENTS = [];
    OUTCODE1 = compute_outcode(X1, Y1, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP);
    OUTCODE2 = compute_outcode(X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP);
    
    if ~bitor(OUTCODE1, OUTCODE2)
        SEGMENTS = [SEGMENTS; X1, Y1, X2, Y2];
        return;
    end
    
    if bitand(OUTCODE1, OUTCODE2)
        return;
    end
    
    if abs(X2 - X1) < EPSILON && abs(Y2 - Y1) < EPSILON
        return;
    end
    
    XM = (X1 + X2) / 2;
    YM = (Y1 + Y2) / 2;
    
    SEG1 = midpoint_subdivision(X1, Y1, XM, YM, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP, EPSILON);
    SEG2 = midpoint_subdivision(XM, YM, X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP, EPSILON);
    
    SEGMENTS = [SEGMENTS; SEG1; SEG2];
end

figure;
hold on; grid on; axis equal;
title('Midpoint Subdivision Line Clipping');
xlabel('X-axis'); ylabel('Y-axis');

plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Window');

for I = 1:length(LINES)
    LINE = LINES{I};
    X1 = LINE(1); Y1 = LINE(2); X2 = LINE(3); Y2 = LINE(4);
    
    plot([X1, X2], [Y1, Y2], 'r--', 'LineWidth', 1.5);
    
    CLIPPED_SEGMENTS = midpoint_subdivision(X1, Y1, X2, Y2, XMIN, YMIN, XMAX, YMAX, INSIDE, LEFT, RIGHT, BOTTOM, TOP, EPSILON);
    for J = 1:size(CLIPPED_SEGMENTS, 1)
        SEG = CLIPPED_SEGMENTS(J, :);
        plot([SEG(1), SEG(3)], [SEG(2), SEG(4)], 'g-', 'LineWidth', 2.5);
    end
end

xlim([0, 12]); ylim([0, 12]);
legend('Clip Window', 'Location', 'best');
