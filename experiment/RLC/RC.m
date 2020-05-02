t = [0 28 56 78 102 176 254 518];
Uc = [4.78 3.79 2.78 2.39 1.79 0.76 0.18 0.1];
% scatter(t,Uc);
lnUc = log(Uc);
scatter(t,lnUc);
hold on;
[p,s] = polyfit(t,lnUc,1);
x = 0:0.1:600;
y = p(1).*x+p(2);
plot(x,y);
xlabel('t/us');
ylabel('lnUc');

k = num2str(p(1));
b = num2str(p(2));

text(400,1,['y=' k 'x+' b]);