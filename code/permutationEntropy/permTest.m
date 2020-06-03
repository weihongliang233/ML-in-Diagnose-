x = linspace(1,100);
y_sin = sin(x);
% r_sin = 0.2*std(y_sin);

y_rand = rand(1,100);
% r_rand = 0.2*std(y_rand);

en_sin = MPerm(y_sin,3,1,1);
disp(en_sin);

en_rand = MPerm(y_rand,3,1,1);
disp(en_rand);




