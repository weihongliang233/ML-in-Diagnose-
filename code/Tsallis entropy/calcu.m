clc,clear
xx=-4*pi:0.1:4*pi;
y(1,:)=ones(1,length(xx));
y(2,:)=(sin(1000.*xx));
y(3,:)=(rand(1,length(xx)));
y(4,:)=linspace(0,1,length(xx));
% subplot(1,2,1)
% ts(y1,10,2)
% subplot(1,2,2)
% ts(y2,10,2)
fprintf("TsEn of 4 data series:\n")
for (i=1:4)
    subplot(2,2,i)
    TsEn(i)=ts0(y(i,:),50,0.5);
    fprintf('%d:%f\n',i,TsEn(i));
end
