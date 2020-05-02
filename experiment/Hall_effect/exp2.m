clear all;clc;
vp = [28 60 87 117 149 182 212 238];
vm = [27 59 88 118 147 184 212 244];
vs = (1/2)*(vp+vm);
Is = [0.04 0.08 0.12 0.16 0.20 0.24 0.28 0.32];

b = polyfit(Is,vs,1);
x = linspace(0.04,0.32,100);
y = b(1)*x+b(2);

scatter(Is,vs);
hold on;
plot(x,y);
legend('ÊµÑé','ÄâºÏ');
xlabel('I_{s}');
ylabel('V_{\sigma}');
title('I_{s}-V_{\sigma}');
text(0.25,50,'V_{\sigma}=766.07I_{s}-3.39');