function TE=ts(DataName,N,q)                                         

x=detrend(DataName);                       
sigma=std(x);                          
segment=zeros(1,N+1);
for i=-25:25
    segment(i+26)=i*3*sigma/25;      %以三倍标准差为上下区间划分50等分（？）
end
n=hist(x,segment);                    
s=sum(n);                           
p=n./s;                                    
bar(segment,p);                   

TE=0;                                     %求Tsallis熵
for i=1:(N+1)
    TE=p(i)^q+TE;
end

TE=(TE-1)/(1-q);
 
