clc;
% clear all;
% load('matlab.mat','data');

some_point = data(2,2,2,:);
some_point_1d = reshape(some_point,1,240);

% plot(some_point_1d);

r = std(some_point_1d)*0.2;
en = Fuzzy_Entropy(5,r,some_point_1d);

disp("fuzzy entropy of one specific point is:");
disp(en);




