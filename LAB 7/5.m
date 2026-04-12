clc; clear;

P = [1; 1; 1; 1];

% Scaling
S = [2 0 0 0;
     0 2 0 0;
     0 0 2 0;
     0 0 0 1];

% Rotation (Z-axis)
theta = pi/4;
R = [cos(theta) -sin(theta) 0 0;
     sin(theta)  cos(theta) 0 0;
     0           0          1 0;
     0           0          0 1];

% Translation
T = [1 0 0 3;
     0 1 0 4;
     0 0 1 5;
     0 0 0 1];

% Composite matrix
C = T * R * S;

P_new = C * P;

disp('Composite Transformed Point:');
disp(P_new);