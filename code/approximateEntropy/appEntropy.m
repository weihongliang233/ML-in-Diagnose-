%两组序列，一组有序周期，一组随机
x = linspace(1,100);
y_sin = sin(x);

y_rand = rand(1,100);

ent_sin = approximateEntropy(y_sin,'dim',6);%该语法使用嵌入维度
disp(ent_sin);

ent_rand = approximateEntropy(y_rand);
disp(ent_rand);





