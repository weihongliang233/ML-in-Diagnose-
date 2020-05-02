% 数据生成
c = 0.5; k = 2;
x = (0:.1:5)';
y = c*k.^x + 2*(rand(size(x))-0.5);

% 拟合
ft = fittype(@(c, k, x)c*k.^x); % 需要拟合的函数形式
f = fit(x, y, ft, 'StartPoint', [1 1]);
plot(f, x, y);