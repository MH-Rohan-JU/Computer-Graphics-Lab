clc; clear; close all;

figure;
hold on;
title('Unequal Brightness Levels');
axis off;

for I = 0:7
    BRIGHTNESS = I / 7;
    fill([I*2, I*2+1.5, I*2+1.5, I*2], [0, 0, 5, 5], [BRIGHTNESS, BRIGHTNESS, BRIGHTNESS]);
    if I < 4
        TEXT_COLOR = 'white';
    else
        TEXT_COLOR = 'black';
    end
    text(I*2+0.75, 2.5, num2str(I), 'HorizontalAlignment', 'center', ...
         'Color', TEXT_COLOR, 'FontSize', 12);
end

xlim([0, 16]);
ylim([0, 5]);
