%experiment datas
D = [5.955 5.955 8.577 8.577 8.577 7.622 7.622...
    7.622 11.055 11.055 14.775 14.775 16.220 16.220];%cm
D = D.*0.01;%m
V = [0.8 1.6 0.8 1.2 1.4 0.7 1.1 ...
    1.3 1.0 1.2 0.4 0.9 1.0 1.5];
rou = 1.205;
ita = 1.81*10^-5;
R = (rou/ita)*(D.*V);
%make a meshgrid
[x,y] = meshgrid(0.05:0.01:0.20,0:0.1:1.6);
z = (rou/ita)*(x.*y);
%plot
mesh(x,y,z);
hold on;
plot3(D,V,R,'ro');
x1 = xlabel('直径D/(m)');
x2 = ylabel('流速V/(m/s)');
x3 = zlabel('雷诺数R');
set(x1,'Rotation',25); 
set(x2,'Rotation',-30); 
title('D-V-R数据与曲面(1)');
colorbar();
%mark datas on the figure 
R_mark = R.*10^-4;%just for image mark
R_mark = round(R_mark*1000)/1000;
a = R_mark';
b = cellstr(num2str(a));
dD = -0.01;dV = -0.1;dR = 0.05;
text(D+dD,V+dV,R+dR,b);



