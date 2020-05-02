Sx = 0.2;
Sy = 0.02;%V/╦Я
N1 = 100;
N2 = 100;%тя
S = 1.2*10^-4;
C = 20*10^-6;%F
L = 0.13;%m
R1 = 5.8;%ohm
R2 = 3000;%ohm

H1 = (N1*Sx)/(L*R1)*X1;
B_up = (R2*C*Sy)/(N2*S)*Y_up;

H2 = (N1*Sx)/(L*R1)*X2;
B_down = (R2*C*Sy)/(N2*S)*Y_down;

% A = polyfit(H1,B_up,4);
% B = polyfit(H2,B_down,4);
% 
% x = -150:0.1:150;
% y1 = A(1)*x.^4+A(2)*x.^3+A(3)*x.^2+A(4)*x+A(5);
% y2 = B(1)*x.^4+B(2)*x.^3+B(3)*x.^2+B(4)*x+B(5);

% plot(x,y1);
% hold on;
% plot(x,y2);
% hold on;

x = linspace(min(H1),max(H1));
y1 = spline(H1,B_up,x);
y2 = spline(H2,B_down,x);

plot(x,y1);
hold on;
plot(x,y2)

scatter(H1,B_up);
hold on;
scatter(H2,B_down);




