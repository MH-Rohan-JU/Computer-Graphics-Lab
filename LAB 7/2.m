clc; clear;

P = [1; 2; 3; 1];

Sx = 2; Sy = 3; Sz = 4;
S = [Sx 0  0  0;
     0  Sy 0  0;
     0  0  Sz 0;
     0  0  0  1];

P_new = S * P;

disp('Scaled Point:');
disp(P_new);