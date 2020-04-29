% xx=-4*pi:0.1:4*pi;
% y1=100.*sin(1000.*xx);
% y2=100.*rand(1,length(xx));
% subplot(1,2,1)
% ts(y1,10,2)
% subplot(1,2,2)
% ts(y2,10,2)
fprintf("TsEn of 4 data series:\n")
for (i=1:4)
%     subplot(2,2,i)
    TsEn(i)=ts2(e(:,i),2);
    fprintf('%d:%f\n',i,TsEn(i));
end
