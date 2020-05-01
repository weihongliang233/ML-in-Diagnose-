非广延熵（Tsallis Entropy）

文献：

一、TsEn的提出：

Tsallis; Constantino. Generalized entropy-based criterion for consistent testing. Phys. Rev. E Stat. Phys. Plasmas Fluids Relat. Interdiscip. Top. 1998, 58, 1442–1445.

这种非广延熵的定义是

![img](file:///C:/Users/Z04/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)

其中q是一个大于零的常数，与被统计量的性质有关。

二、文献中TsEn在脑电、相关疾病检测的应用：

Quantitative EEG markers for early detection and characterization of vascular dementia during working memory tasks. In Proceedings of the 2016 IEEE EMBS Conference on Biomedical Engineering and Sciences (IECBES), Kuala Lumpur, Malaysia, 4–8 December 2016; pp. 347–351.

这篇文章介绍了在时域和频域中，使用各种熵判别一个人是否患AD的过程和结果。对TsEn提到：1.参数q取0.5；2.计算结果中稳定的数据组，TsEn非常小，最大仅为0.0075.这篇文章还提供了其数百MB的实验数据，已上传为“SupplementaryData.zip”

​    三、Entropy相关网站

http://www.cs.tut.fi/~timhome/tim/tim.htm

算法：

​    先计算一组数据x的概率密度函数或统计每个区间xi上数据的出现几率p(xi)，然后求熵：![img](file:///C:/Users/Z04/AppData/Local/Temp/msohtmlclip1/01/clip_image004.png).

根据需要，可以把区间取得大或小来获得低或高的精度。

代码1(matlab)



{

function TE=ts(DataName,N,q)                     

x=detrend(DataName);            sigma=std(x);             segment=zeros(1,N+1);

for i=-25:25

  segment(i+26)=i*3*sigma/25;   

end

n=hist(x,segment);         

s=sum(n);                

p=n./s;                  bar(segment,p);            

TE=0;                   

for i=1:(N+1)

  TE=p(i)^q+TE;

end

 

TE=(TE-1)/(1-q);

}

 

 

clc,clear

xx=-4*pi:0.1:4*pi;

y(1,:)=ones(1,length(xx));

y(2,:)=(sin(1000.*xx));

y(3,:)=(rand(1,length(xx)));

y(4,:)=linspace(0,1,length(xx));

fprintf("TsEn of 4 data series:\n")

for (i=1:4)

  subplot(2,2,i)

  TsEn(i)=ts0(y(i,:),50,0.5);

  fprintf('%d:%f\n',i,TsEn(i));

end

 

代码2(R)：

https://ericmarcon.github.io/entropart/

 