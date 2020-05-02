T = [100 95 90 85 80 75 70 65 60 55 50 45 40 35 30 25];%C
% T = T+273.15;%K
VF = [0.4 0.411 0.423 0.435 0.447 0.459 0.471 0.483 0.495...
    0.507 0.519 0.530 0.542 0.554 0.566 0.578];%V
VF = VF.*10^3;%mV

n = polyfit(T,VF,1);
x = 20:0.1:100;
S = n(1);
Vg0 = n(2);
y = S.*x+Vg0;
% 
% S = num2str(S);
% Vg0 = num2str(Vg0);
% tex1 = ['V_{F}=ST+V_{g(0)}'];
% tex2 = ['S=',S,'mV/^{o}C'];
% tex3 = ['V_{g(0)}=',Vg0,'mV'];
% 
% plot(x,y);
% xlabel('T/^{o}C');
% ylabel('VF/mV');
% text(30,5*10^2,tex1);
% text(30,4.8*10^2,tex2);
% text(30,4.6*10^2,tex3);
% title('½µÎÂT-V_{F}Í¼Ïñ');
% hold on;
% scatter(T,VF);
