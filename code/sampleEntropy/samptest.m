x = linspace(1,100);
y_sin = sin(x);
r_sin = 0.2*std(y_sin);

y_rand = rand(1,100);
r_rand = 0.2*std(y_rand);

m = 5;

sampe_sin = sampen(y_sin,m,r_sin,'chebychev');
disp(sampe_sin);
% disp(r_sin);
sampe_rand = sampen(y_rand,m,r_rand,'chebychev');
disp(sampe_rand);
