# 谱熵（Spectral Entropy）

## 算法概述

基本想法就是将香农熵应用到功率谱上（这句话我脑补的，不一定准确）。

[香农熵](https://zh.wikipedia.org/wiki/%E7%86%B5_(%E4%BF%A1%E6%81%AF%E8%AE%BA))

[Spectral Entropy 的具体计算方法]( [https://zh.wikipedia.org/wiki/%E7%86%B5_(%E4%BF%A1%E6%81%AF%E8%AE%BA)](https://zh.wikipedia.org/wiki/熵_(信息论)) 

经过这两个链接对比，我发现谱熵就是先对信号做傅里叶变换，然后求出功率谱，再求香农熵：

先计算$X\left(\omega_{i}\right)$，然后根据公式：

$$P\left(\omega_{i}\right)=\frac{1}{N}\left|X\left(\omega_{i}\right)\right|^{2}$$

得到功率谱，再按照下面公式得到概率密度函数：

$$p_{i}=\frac{P\left(\omega_{i}\right)}{\sum_{i} P\left(\omega_{i}\right)}$$

最终计算其香农熵：

$$P S E=-\sum_{i=1}^{n} p_{i} \ln p_{i}$$

以上就是算法的主要思路。

## 算法实现

### MATLAB版轮子：

[封装好的函数]( https://www.mathworks.com/help/signal/ref/pentropy.html )

未封装的代码：

```
% This script computes the entropy of any given distribution.



% Simulate Make a pure tone
pure_tone = zeros(1,1000);
pure_tone(200) = 1;


figure
plot(pure_tone)
xlabel('Frequency')
ylabel('Normalized Power')
entropy_pure_tone = -nansum(pure_tone .* log2(pure_tone));
title(['Simulated pure tone spectra, entropy = ' num2str(entropy_pure_tone) ])


% Make a harmonic complex
harmonic_complex = zeros(1,1000);
harmonic_complex(200:200:1000) = 1;
norm_factor = sum(harmonic_complex);
harmonic_complex = harmonic_complex ./ norm_factor;

figure
plot(harmonic_complex)
xlabel('Frequency')
ylabel('Normalized Power')
entropy_harmonic_complex = -nansum(harmonic_complex .* log2(harmonic_complex));
title(['Simulated complex tone spectra, entropy = ' num2str(entropy_harmonic_complex) ])

% Simulate white noise spectra
white_noise = ones(1,1000);
norm_factor = sum(white_noise);
white_noise = white_noise ./ norm_factor;

figure
plot(white_noise)
xlabel('Frequency')
ylabel('Normalized Power')
entropy_white_noise = -nansum(white_noise .* log2(white_noise));
title(['Simulated white noise spectra, entropy = ' num2str(entropy_white_noise) ])

% Simulate pink noise spectra
pink_noise = 1 - (1:1000)*.001;
norm_factor = sum(pink_noise);
pink_noise = pink_noise ./ norm_factor;

figure
plot(pink_noise)
xlabel('Frequency')
ylabel('Normalized Power')
entropy_pink_noise = -nansum(pink_noise .* log2(pink_noise));
title(['Simulated pink noise spectra, entropy = ' num2str(entropy_pink_noise) ])
```

GitHub嫖的，还没仔细读过…但是我看到关键公式似乎都有了。

### Python版

[Scipy的]( https://docs.scipy.org/doc/scipy-0.18.1/reference/generated/scipy.signal.periodogram.html )

至于纯手撕的Python代码我还没淘到，我想自己写一个or直接看库的源码，但是我还没尝试过直接读工具包的源码，我担心会有依赖问题之类的，所以我正想办法手写一个。

### Mathematica版

MMA是世界上最好的语言（斜眼笑）

我写了一个极简版的轮子：

```
PSE[list_]:=Module[{a,b,fourier},
fourier=Abs[Fourier[list,FourierParameters->{-1, 1}]]^2;
a=fourier/Total[fourier];
b=Map[#*Log[#]&,a];
Return[-Total[b]]
]
```

## 算法优缺点

这个问题我试图通过理解谱熵的物理意义来回答。但是由于我还没有找严肃的文献来读，一般的信息来源就是GitHub,SE,SO之类的，所以……

不过我还是找到了一个相关度比较高的：

[Spectral Entropy of a signal and its physical significance]( https://www.dsprelated.com/showthread/matlab/7515-1.php )



