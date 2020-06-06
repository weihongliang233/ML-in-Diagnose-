%aal存储了116个区域
%aal{1,1}则是第一个aal区域中的 点的坐标
testregion = aal{1,1};

intind = find(testregion~=0);%intind数组里存储数值不为0的顺序索引
sz = size(testregion);
[r,c,p] = ind2sub(sz,intind);%将要用的顺序索引值转换为下标索引
%r,c,p数组中存储了第一个区域中的下标索引
%从len(r)中可见第一个区域包含1028个点


% %check
% for i = 1:length(intind)%检查转化是否正确
%     logi = testregion(r(i),c(i),p(i)) == testregion(intind(i));
%     disp(logi);
% end