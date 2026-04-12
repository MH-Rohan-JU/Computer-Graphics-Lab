clc; clear;

theta = pi/4; % 45 degrees

Rz = [cos(theta) -sin(theta) 0 0;
      sin(theta)  cos(theta) 0 0;
      0           0          1 0;
      0           0          0 1];

P = [1; 1; 1; 1];

P_new = Rz * P;

disp('Rotated Point (Z-axis):');
disp(P_new);