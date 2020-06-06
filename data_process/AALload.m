AALpath = '/Users/niuboheng/Downloads/xc_data/the_region_of_interest_AAL/';

for k = 1:116
    subpath = [AALpath,'aal',num2str(k),'.mat'];
    temp = load(subpath);
    matname = char(fieldnames(temp));
    aal{k} = getfield(temp,matname);%�洢Ϊcell
end

% all_staypoint = cat(1,aal{:});
save('aal.mat','aal');
% save('all_staypoint.mat','all_staypoint');