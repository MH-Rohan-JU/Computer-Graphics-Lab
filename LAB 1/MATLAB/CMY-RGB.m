c_val = 0.70;
m_val = 0.90;
y_val = 0.10;

r_val = 1 - c_val;
g_val = 1 - m_val;
b_val = 1 - y_val;

fprintf('R = %.3f\n', r_val);
fprintf('G = %.3f\n', g_val);
fprintf('B = %.3f\n', b_val);

cmy_block = cat(3, c_val, m_val, y_val);
rgb_block = cat(3, r_val, g_val, b_val);

figure;
subplot(1,2,1), imshow(cmy_block), title('CMY Color');
subplot(1,2,2), imshow(rgb_block), title('Converted RGB Color');
