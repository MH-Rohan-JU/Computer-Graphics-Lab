clc; clear; close all;

RX = 15;
RY = 8;
CX = 25;
CY = 15;

figure;
hold on;
grid on;
axis equal;
title('Midpoint Ellipse Algorithm');
xlabel('X-axis');
ylabel('Y-axis');

X = 0;
Y = RY;
RX2 = RX * RX;
RY2 = RY * RY;
TWO_RX2 = 2 * RX2;
TWO_RY2 = 2 * RY2;

PX = 0;
PY = TWO_RX2 * Y;

X_VALS = [];
Y_VALS = [];

% Region 1
P = round(RY2 - (RX2 * RY) + (0.25 * RX2));
while PX < PY
    X_VALS = [X_VALS CX+X CX-X CX+X CX-X];
    Y_VALS = [Y_VALS CY+Y CY+Y CY-Y CY-Y];
    X = X + 1;
    PX = PX + TWO_RY2;
    if P < 0
        P = P + RY2 + PX;
    else
        Y = Y - 1;
        PY = PY - TWO_RX2;
        P = P + RY2 + PX - PY;
    end
end

% Region 2
P = round(RY2 * (X + 0.5)^2 + RX2 * (Y - 1)^2 - RX2 * RY2);
while Y >= 0
    X_VALS = [X_VALS CX+X CX-X CX+X CX-X];
    Y_VALS = [Y_VALS CY+Y CY+Y CY-Y CY-Y];
    Y = Y - 1;
    PY = PY - TWO_RX2;
    if P > 0
        P = P + RX2 - PY;
    else
        X = X + 1;
        PX = PX + TWO_RY2;
        P = P + RX2 - PY + PX;
    end
end

plot(X_VALS, Y_VALS, 'ks', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot(CX, CY, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
