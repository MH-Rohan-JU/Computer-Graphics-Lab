clc;
clear;
close all;

max_iter = 200;

x_vals = linspace(-2.5, 1, 1000);
y_vals = linspace(-1.5, 1.5, 1000);
[x_grid, y_grid] = meshgrid(x_vals, y_vals);
c_grid = x_grid + 1i*y_grid;

z_grid = zeros(size(c_grid));
mandelbrot = zeros(size(c_grid));

for k = 1:max_iter
    z_grid = z_grid.^2 + c_grid;
    mask = abs(z_grid) <= 2;
    mandelbrot(mask) = mandelbrot(mask) + 1;
end

figure;
imagesc(x_vals, y_vals, mandelbrot);
axis equal tight;
colormap(hot);
colorbar;
title('Mandelbrot Set');
xlabel('Real Axis');
ylabel('Imaginary Axis');
