%experiment datas
D = [5.955 5.955 7.622 7.622 8.577 8.577...
    11.055 11.055 14.775 16.220 ];%cm
D = D.*0.01;%m
V = [0.5 0.2 0.3 0.2 0.2 0.1 0.1 0.2 0.1 0.1];
rou = 1.205;
ita = 1.81*10^-5;
R = (rou/ita)*(D.*V);
%make a meshgrid
[x,y] = meshgrid(0.05:0.01:0.17,0.1:0.01:0.55);
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
title('D-V-R数据与曲面(2)');
colorbar();
%mark datas on the figure 
R_mark = R;%just for image mark
R_mark = round(R_mark*10)/10;
a = R_mark';
b = cellstr(num2str(a));
dD = -0.01;dV = -0.01;dR = 0.5;
text(D+dD,V+dV,R+dR,b);
