nmpath = '/Users/niuboheng/Downloads/xc_data/nm/';

for k = 1:26
    subpath = [nmpath,'sub',num2str(k),'.mat'];
    temp = load(subpath);
    matname = char(fieldnames(temp));
    nm{k} = getfield(temp,matname);%�洢Ϊcell
end

% save('nm.mat','nm');