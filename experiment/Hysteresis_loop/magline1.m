X = [0.2 0.4 0.6 0.8 1.0 2.0 3.0 4.0 5.0];
Y = [0.2 0.45 0.65 1.0 1.25 2.8 3.6 3.8 5.1];
Sx = 0.2;
Sy = 0.02;%V/格
N1 = 100;
N2 = 100;%匝
S = 1.2*10^-4;
C = 20*10^-6;%F
L = 0.13;%m
R1 = 5.8;%ohm
R2 = 3000;%ohm

H = (N1*Sx)/(L*R1)*X;
B = (R2*C*Sy)/(N2*S)*Y;

A = polyfit(H,B,3);
x = 5.3:0.1:132.6;
y = A(1)*x.^3+A(2)*x.^2+A(3)*x+A(4);

plot(x,y);
hold on;
scatter(H,B);
title('基本磁化曲线');
xlabel('H/(A/m)');
ylabel('B/T');
legend('拟合','实验');

% legend('实验','拟合');
% xlabel('I_{s}');
% ylabel('V_{\sigma}');


