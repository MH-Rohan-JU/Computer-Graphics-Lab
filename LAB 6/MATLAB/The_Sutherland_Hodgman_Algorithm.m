clc; clear; close all;

XMIN = 3; YMIN = 3; XMAX = 8; YMAX = 8;
POLYGON = [2, 2; 10, 2; 10, 10; 2, 10; 2, 2];

function OUTPUT = clip_polygon_edge(INPUT, X1, Y1, X2, Y2, EDGE_TYPE, XMIN, YMIN, XMAX, YMAX)
    OUTPUT = [];
    N = size(INPUT, 1) - 1;
    
    for I = 1:N
        CURRENT = INPUT(I, :);
        NEXT = INPUT(I + 1, :);
        
        CURRENT_INSIDE = false;
        NEXT_INSIDE = false;
        
        switch EDGE_TYPE
            case 'LEFT'
                CURRENT_INSIDE = CURRENT(1) >= XMIN;
                NEXT_INSIDE = NEXT(1) >= XMIN;
            case 'RIGHT'
                CURRENT_INSIDE = CURRENT(1) <= XMAX;
                NEXT_INSIDE = NEXT(1) <= XMAX;
            case 'BOTTOM'
                CURRENT_INSIDE = CURRENT(2) >= YMIN;
                NEXT_INSIDE = NEXT(2) >= YMIN;
            case 'TOP'
                CURRENT_INSIDE = CURRENT(2) <= YMAX;
                NEXT_INSIDE = NEXT(2) <= YMAX;
        end
        
        if CURRENT_INSIDE && NEXT_INSIDE
            OUTPUT = [OUTPUT; NEXT];
        elseif CURRENT_INSIDE && ~NEXT_INSIDE
            switch EDGE_TYPE
                case 'LEFT'
                    T = (XMIN - CURRENT(1)) / (NEXT(1) - CURRENT(1));
                    Y = CURRENT(2) + T * (NEXT(2) - CURRENT(2));
                    OUTPUT = [OUTPUT; XMIN, Y];
                case 'RIGHT'
                    T = (XMAX - CURRENT(1)) / (NEXT(1) - CURRENT(1));
                    Y = CURRENT(2) + T * (NEXT(2) - CURRENT(2));
                    OUTPUT = [OUTPUT; XMAX, Y];
                case 'BOTTOM'
                    T = (YMIN - CURRENT(2)) / (NEXT(2) - CURRENT(2));
                    X = CURRENT(1) + T * (NEXT(1) - CURRENT(1));
                    OUTPUT = [OUTPUT; X, YMIN];
                case 'TOP'
                    T = (YMAX - CURRENT(2)) / (NEXT(2) - CURRENT(2));
                    X = CURRENT(1) + T * (NEXT(1) - CURRENT(1));
                    OUTPUT = [OUTPUT; X, YMAX];
            end
        elseif ~CURRENT_INSIDE && NEXT_INSIDE
            switch EDGE_TYPE
                case 'LEFT'
                    T = (XMIN - CURRENT(1)) / (NEXT(1) - CURRENT(1));
                    Y = CURRENT(2) + T * (NEXT(2) - CURRENT(2));
                    OUTPUT = [OUTPUT; XMIN, Y];
                case 'RIGHT'
                    T = (XMAX - CURRENT(1)) / (NEXT(1) - CURRENT(1));
                    Y = CURRENT(2) + T * (NEXT(2) - CURRENT(2));
                    OUTPUT = [OUTPUT; XMAX, Y];
                case 'BOTTOM'
                    T = (YMIN - CURRENT(2)) / (NEXT(2) - CURRENT(2));
                    X = CURRENT(1) + T * (NEXT(1) - CURRENT(1));
                    OUTPUT = [OUTPUT; X, YMIN];
                case 'TOP'
                    T = (YMAX - CURRENT(2)) / (NEXT(2) - CURRENT(2));
                    X = CURRENT(1) + T * (NEXT(1) - CURRENT(1));
                    OUTPUT = [OUTPUT; X, YMAX];
            end
            OUTPUT = [OUTPUT; NEXT];
        end
    end
    
    if ~isempty(OUTPUT)
        OUTPUT = [OUTPUT; OUTPUT(1, :)];
    end
end

function CLIPPED = sutherland_hodgman_clip(POLY, XMIN, YMIN, XMAX, YMAX)
    CLIPPED = POLY;
    
    CLIPPED = clip_polygon_edge(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'LEFT', XMIN, YMIN, XMAX, YMAX);
    if size(CLIPPED, 1) <= 1
        return;
    end
    
    CLIPPED = clip_polygon_edge(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'RIGHT', XMIN, YMIN, XMAX, YMAX);
    if size(CLIPPED, 1) <= 1
        return;
    end
    
    CLIPPED = clip_polygon_edge(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'BOTTOM', XMIN, YMIN, XMAX, YMAX);
    if size(CLIPPED, 1) <= 1
        return;
    end
    
    CLIPPED = clip_polygon_edge(CLIPPED, XMIN, YMIN, XMAX, YMAX, 'TOP', XMIN, YMIN, XMAX, YMAX);
end

figure('Position', [100, 100, 1000, 400]);

subplot(1, 2, 1);
hold on; grid on; axis equal;
title('Sutherland-Hodgman: Before Clipping');
xlabel('X-axis'); ylabel('Y-axis');

% Draw clipping window
plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Window');
fill([XMIN, XMAX, XMAX, XMIN], [YMIN, YMIN, YMAX, YMAX], 'b', 'FaceAlpha', 0.1);

% Draw original polygon
plot(POLYGON(:, 1), POLYGON(:, 2), 'r-', 'LineWidth', 2, 'DisplayName', 'Original Polygon');
fill(POLYGON(:, 1), POLYGON(:, 2), 'r', 'FaceAlpha', 0.3);

xlim([0, 12]); ylim([0, 12]);
legend('Location', 'best');

subplot(1, 2, 2);
hold on; grid on; axis equal;
title('Sutherland-Hodgman: After Clipping');
xlabel('X-axis'); ylabel('Y-axis');

% Draw clipping window
plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Window');
fill([XMIN, XMAX, XMAX, XMIN], [YMIN, YMIN, YMAX, YMAX], 'b', 'FaceAlpha', 0.1);

% Clip and draw
CLIPPED_POLY = sutherland_hodgman_clip(POLYGON, XMIN, YMIN, XMAX, YMAX);
if size(CLIPPED_POLY, 1) > 1
    plot(CLIPPED_POLY(:, 1), CLIPPED_POLY(:, 2), 'g-', 'LineWidth', 2.5, 'DisplayName', 'Clipped Polygon');
    fill(CLIPPED_POLY(:, 1), CLIPPED_POLY(:, 2), 'g', 'FaceAlpha', 0.5);
end

xlim([0, 12]); ylim([0, 12]);
legend('Location', 'best');
