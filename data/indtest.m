%example: use of ind2sub
A = rand(3,3,3);
ind = [12,14];
[row,col,page] = ind2sub(size(A),ind);

%check
for i = 1:length(ind)
    logi = A(row(i),col(i),page(i)) == A(ind(i));
    disp(logi);
end


%example of REGION_OF_INTEREST
%!load alal42.mat first!
%!the data includes region of interest is stored in 'inter'!
intind = find(inter~=0);
sz = size(inter);
[r,c,p] = ind2sub(sz,intind);
%check
for i = 1:length(intind)
    logi = inter(r(i),c(i),p(i)) == inter(intind(i));
    disp(logi);
end
