r_val = 50;
g_val = 150;
b_val = 200;

r_norm = r_val / 255;
g_norm = g_val / 255;
b_norm = b_val / 255;

c_val = 1 - r_norm;
m_val = 1 - g_norm;
y_val = 1 - b_norm;

fprintf('C = %.3f\n', c_val);
fprintf('M = %.3f\n', m_val);
fprintf('Y = %.3f\n', y_val);

rgb_block = cat(3, r_norm, g_norm, b_norm);
cmy_block = cat(3, c_val, m_val, y_val);

figure;
subplot(1,2,1), imshow(rgb_block), title('RGB Color');
subplot(1,2,2), imshow(cmy_block), title('CMY Color');



clc;
clear;
close all;

julia_const = -0.7 + 0.27015i;
max_iter = 200;

x_vals = linspace(-1.5, 1.5, 1000);
y_vals = linspace(-1.5, 1.5, 1000);
[x_grid, y_grid] = meshgrid(x_vals, y_vals);
z_grid = x_grid + 1i*y_grid;

julia_set = zeros(size(z_grid));

for k = 1:max_iter
    z_grid = z_grid.^2 + julia_const;
    mask = abs(z_grid) <= 2;
    julia_set(mask) = julia_set(mask) + 1;
end

figure;
imagesc(x_vals, y_vals, julia_set);
axis equal tight;
colormap(hot);
colorbar;
title('Julia Set');
xlabel('Real Axis');
ylabel('Imaginary Axis');
