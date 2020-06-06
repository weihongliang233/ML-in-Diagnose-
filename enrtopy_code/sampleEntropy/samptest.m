clc;
clear all;

x = linspace(0,300);
y_sin = sin(x);
r_sin = std(y_sin);

m = 5;
tau = 1;

% [e_sin] = multiscaleSampleEntropy(y_sin,2,r_sin,1);
% disp(e_sin);

y_rand = rand(1,300);
r_rand = std(y_rand);

% [e_rand] = multiscaleSampleEntropy(y_rand,m,r_rand,tau);
% disp(e_rand);

e_pre_sin = sampen(y_sin,m,r_sin);
disp(e_pre_sin);

e_pre_rand = sampen(y_rand,m,r_rand);
disp(e_pre_rand);





