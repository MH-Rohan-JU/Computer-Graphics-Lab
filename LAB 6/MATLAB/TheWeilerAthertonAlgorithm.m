clc; clear; close all;

XMIN = 3; YMIN = 3; XMAX = 8; YMAX = 8;

SUBJECT = [2, 2; 10, 2; 10, 10; 2, 10; 2, 2];
CLIP = [XMIN, YMIN; XMAX, YMIN; XMAX, YMAX; XMIN, YMAX; XMIN, YMIN];

function [INTERSECTIONS, PARAM1, PARAM2] = find_intersections(SUBJ, CLIP)
    INTERSECTIONS = [];
    PARAM1 = [];
    PARAM2 = [];
    
    for I = 1:size(SUBJ, 1)-1
        A1 = SUBJ(I, :);
        A2 = SUBJ(I+1, :);
        
        for J = 1:size(CLIP, 1)-1
            B1 = CLIP(J, :);
            B2 = CLIP(J+1, :);
            
            % Line intersection calculation
            DENOM = (B2(2) - B1(2))*(A2(1) - A1(1)) - (B2(1) - B1(1))*(A2(2) - A1(2));
            
            if abs(DENOM) < 1e-10
                continue;
            end
            
            UA = ((B2(1) - B1(1))*(A1(2) - B1(2)) - (B2(2) - B1(2))*(A1(1) - B1(1))) / DENOM;
            UB = ((A2(1) - A1(1))*(A1(2) - B1(2)) - (A2(2) - A1(2))*(A1(1) - B1(1))) / DENOM;
            
            if UA >= 0 && UA <= 1 && UB >= 0 && UB <= 1
                X = A1(1) + UA * (A2(1) - A1(1));
                Y = A1(2) + UA * (A2(2) - A1(2));
                INTERSECTIONS = [INTERSECTIONS; X, Y];
                PARAM1 = [PARAM1; I, UA];
                PARAM2 = [PARAM2; J, UB];
            end
        end
    end
end

function INSIDE = point_inside_polygon(POINT, POLY)
    INSIDE = false;
    N = size(POLY, 1) - 1;
    
    for I = 1:N
        J = mod(I, N) + 1;
        if ((POLY(I, 2) > POINT(2)) ~= (POLY(J, 2) > POINT(2))) && ...
           (POINT(1) < (POLY(J, 1) - POLY(I, 1)) * (POINT(2) - POLY(I, 2)) / ...
           (POLY(J, 2) - POLY(I, 2)) + POLY(I, 1))
            INSIDE = ~INSIDE;
        end
    end
end

function RESULT = weiler_atherton_clip(SUBJECT, CLIP)
    RESULT = [];
    
    % Find intersections
    [INTERSECTIONS, ~, ~] = find_intersections(SUBJECT, CLIP);
    
    if isempty(INTERSECTIONS)
        % Check if subject is completely inside clip
        if point_inside_polygon(SUBJECT(1, :), CLIP)
            RESULT = SUBJECT;
        end
        return;
    end
    
    % Simple approximation: return intersection points and inside vertices
    INSIDE_PTS = [];
    for I = 1:size(SUBJECT, 1)-1
        if point_inside_polygon(SUBJECT(I, :), CLIP)
            INSIDE_PTS = [INSIDE_PTS; SUBJECT(I, :)];
        end
    end
    
    RESULT = [INSIDE_PTS; INTERSECTIONS];
    
    % Sort points angularly around center for proper polygon formation
    if ~isempty(RESULT)
        CENTER = mean(RESULT, 1);
        ANGLES = atan2(RESULT(:, 2) - CENTER(2), RESULT(:, 1) - CENTER(1));
        [~, IDX] = sort(ANGLES);
        RESULT = RESULT(IDX, :);
        RESULT = [RESULT; RESULT(1, :)];
    end
end

figure('Position', [100, 100, 1200, 500]);

subplot(1, 2, 1);
hold on; grid on; axis equal;
title('Weiler-Atherton: Before Clipping');
xlabel('X-axis'); ylabel('Y-axis');

% Draw polygons
plot(SUBJECT(:, 1), SUBJECT(:, 2), 'r-', 'LineWidth', 2, 'DisplayName', 'Subject Polygon');
fill(SUBJECT(:, 1), SUBJECT(:, 2), 'r', 'FaceAlpha', 0.3);

plot(CLIP(:, 1), CLIP(:, 2), 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Polygon');
fill(CLIP(:, 1), CLIP(:, 2), 'b', 'FaceAlpha', 0.1);

% Find and plot intersections
[INTERSECTIONS, ~, ~] = find_intersections(SUBJECT, CLIP);
if ~isempty(INTERSECTIONS)
    plot(INTERSECTIONS(:, 1), INTERSECTIONS(:, 2), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Intersections');
end

xlim([0, 12]); ylim([0, 12]);
legend('Location', 'best');
title('Weiler-Atherton Polygon Clipping - Original');

subplot(1, 2, 2);
hold on; grid on; axis equal;
title('Weiler-Atherton: After Clipping');
xlabel('X-axis'); ylabel('Y-axis');

% Draw clip window
plot(CLIP(:, 1), CLIP(:, 2), 'b-', 'LineWidth', 2, 'DisplayName', 'Clip Window');
fill(CLIP(:, 1), CLIP(:, 2), 'b', 'FaceAlpha', 0.1);

% Perform clipping
RESULT = weiler_atherton_clip(SUBJECT, CLIP);

if ~isempty(RESULT) && size(RESULT, 1) > 2
    plot(RESULT(:, 1), RESULT(:, 2), 'g-', 'LineWidth', 2.5, 'DisplayName', 'Clipped Polygon');
    fill(RESULT(:, 1), RESULT(:, 2), 'g', 'FaceAlpha', 0.5);
    
    % Plot vertices
    plot(RESULT(:, 1), RESULT(:, 2), 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
end

xlim([0, 12]); ylim([0, 12]);
legend('Location', 'best');
title('Weiler-Atherton Polygon Clipping - Result');

% Display information
fprintf('=== Weiler-Atherton Polygon Clipping Results ===\n');
fprintf('Clip Window: [%d, %d] to [%d, %d]\n', XMIN, YMIN, XMAX, YMAX);
fprintf('Subject Polygon vertices: %d\n', size(SUBJECT, 1)-1);
fprintf('Clip Polygon vertices: %d\n', size(CLIP, 1)-1);

[INTERSECTIONS, ~, ~] = find_intersections(SUBJECT, CLIP);
fprintf('Intersection points found: %d\n', size(INTERSECTIONS, 1));

if ~isempty(RESULT) && size(RESULT, 1) > 2
    fprintf('Clipped polygon vertices: %d\n', size(RESULT, 1)-1);
    fprintf('Clipped polygon area: %.2f square units\n', polyarea(RESULT(:, 1), RESULT(:, 2)));
else
    fprintf('No visible polygon after clipping\n');
end
