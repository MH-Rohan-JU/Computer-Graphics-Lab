clc; clear; close all;

XMIN = 3; YMIN = 3; XMAX = 8; YMAX = 8;

LINES = {[2, 2, 10, 10]; [1, 5, 10, 5]; [5, 1, 5, 10]; [9, 2, 9, 9]; [2, 9, 9, 2]};

function [ACCEPT, X1, Y1, X2, Y2] = liang_barsky_clip(X1, Y1, X2, Y2, XMIN, YMIN, XMAX, YMAX)
    DX = X2 - X1;
    DY = Y2 - Y1;
    P = [-DX, DX, -DY, DY];
    Q = [X1 - XMIN, XMAX - X1, Y1 - YMIN, YMAX - Y1];
    
    U1 = 0.0; U2 = 1.0;
    ACCEPT = true;
    
    for I = 1:4
        if P(I) == 0
            if Q(I) < 0
                ACCEPT = false;
                return;
            end
        else
            T = Q(I) / P(I);
            if P(I) < 0
                if T > U1
                    U1 = T;
                end
            else
                if T < U2
                    U2 = T;
                end
            end
        end
    end
    
    if U1 > U2
        ACCEPT = false;
        return;
    end
    
    NX1 = X1 + U1 * DX;
    NY1 = Y1 + U1 * DY;
    NX2 = X1 + U2 * DX;
    NY2 = Y1 + U2 * DY;
    
    X1 = NX1; Y1 = NY1;
    X2 = NX2; Y2 = NY2;
end

figure('Position', [100, 100, 800, 600]);
hold on; grid on; axis equal;
title('Liang-Barsky Line Clipping Algorithm');
xlabel('X-axis'); ylabel('Y-axis');

% Draw clipping window
plot([XMIN, XMAX, XMAX, XMIN, XMIN], [YMIN, YMIN, YMAX, YMAX, YMIN], 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Window');
fill([XMIN, XMAX, XMAX, XMIN], [YMIN, YMIN, YMAX, YMAX], 'b', 'FaceAlpha', 0.1);

% Process each line
for I = 1:length(LINES)
    LINE = LINES{I};
    X1 = LINE(1); Y1 = LINE(2); X2 = LINE(3); Y2 = LINE(4);
    
    % Plot original line
    plot([X1, X2], [Y1, Y2], 'r--', 'LineWidth', 1.5, 'Color', [1, 0, 0, 0.5]);
    
    % Clip and plot
    [ACCEPT, CX1, CY1, CX2, CY2] = liang_barsky_clip(X1, Y1, X2, Y2, XMIN, YMIN, XMAX, YMAX);
    if ACCEPT
        plot([CX1, CX2], [CY1, CY2], 'g-', 'LineWidth', 2.5);
        
        % Mark endpoints
        plot(CX1, CY1, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
        plot(CX2, CY2, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
    end
end

xlim([0, 12]); ylim([0, 12]);
legend('Clip Window', 'Location', 'best');
title('Liang-Barsky Line Clipping Algorithm');
