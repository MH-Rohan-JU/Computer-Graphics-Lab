clc; clear;

% Point in world coordinates
P = [5; 5; 5; 1];

% Simple camera translation (moving world opposite)
Tx = -2; Ty = -3; Tz = -4;

T = [1 0 0 Tx;
     0 1 0 Ty;
     0 0 1 Tz;
     0 0 0 1];

P_view = T * P;

disp('View Coordinate:');
disp(P_view);