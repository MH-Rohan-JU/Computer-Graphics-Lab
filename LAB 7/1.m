clc; clear; close all;

% Original point
P = [1; 2; 3; 1]; % homogeneous coordinates

% Translation matrix
Tx = 4; Ty = -2; Tz = 5;
T = [1 0 0 Tx;
     0 1 0 Ty;
     0 0 1 Tz;
     0 0 0 1];

% Transformed point
P_new = T * P;

disp('Translated Point:');
disp(P_new);