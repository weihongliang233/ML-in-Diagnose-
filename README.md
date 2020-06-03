# 校创-利用机器学习实现“烟雾病”诊断
## 说明
1. 该仓库用于 兰州大学-物理科学与技术学院-ML校创项目 使用
2. 成员：钮博恒、魏弘量、吴若岑、王悦晨、张峰瑞
3. 本次校创旨在 从具体的项目中，相互学习。大家应该都是第一次参与校创/使用GitHub合作，如有任何建议或问题，均可以在仓库专门区域，或者是qq群中提出😁

## 4月2日更新
我跟俞老师联系了一下，他表示确实需要计算多种熵，所以目前主要在于**搜集熵计算方法**，不仅要**了解算法，还要给出代码实现**。我们最后拿到的是3+1维（空间+时间）的时间序列，熵算法分为时域和频域，所以还涉及到**数值傅里叶变换**，这个后面再说。我大概查了下，表格中给出的算法基本上在谷歌上可以查到具体的代码，但是读懂原理，理解代码可能还是比较费劲。
现分配如下：

* 钮博恒和王悦晨：Time domain entropy全部
* 吴若岑：Renyi entropy
* 魏弘量：Spectral entropy
* 张峰瑞：Tsallis entropy

文章我已经查了一些了，在article文件夹里，可以直接参考。大家查的时候依据自己搜索习惯来查吧，知网啥的我没去看。
**最后以md文档形式总结，上传到Idea-report文件夹里，内容包括：**

* 原参考文献（上传到article文件夹里），网址等
* 算法概述（包含算法特征，优缺点等）
* 实现代码（目前不限语言）
* 因为最终拿到手的数据形式未知，不可能一拿到就可以套用别人的函数，所以对算法越了解越好。必要时可能要复现。

我目前的感觉是，处理数据，处理时间序列可能会是整个项目的主要内容。如果数据都处理好了，调ML算法调参还不是几行的事情（真实）。

目测四月份开学还是危险，所以截止时间5月1号。大家尽快做吧！

## 4月26日更新
上传了一部分熵算法描述，在data文件夹里上传了一个网上搜来的时间序列example.txt，并在该例上测试了部分代码。一些频域的熵计算方法可能较复杂，考虑直接使用封装好的MATLAB模块。

大家尽快找代码！跳过复杂的理论论证，先把代码或封装好的函数找到，在example数据上测试！

## 5月1日更新

熵算法资料搜索基本结束，对各个算法建立了简要的文档，并找到或实现了对应的代码。并且在example数据上做了测试确保可用。

## 5月12日更新

已经看到一部分真实数据，最近几天预计可以拿到具体的数据（仅正常人）。

数据储存在MATLAB的.mat文件中，使用MATLAB，读取，输出都很方便。（在之前拿到的那个大文件里，sub001目录下的data.mat就是一个处理好的病例数据，其他都是原始nii文件，对我们无用）

对于**每一个病例**，大脑信号信息是一个结构为(61,73,61,240)的4D矩阵。下面我简单讲一下数据。

矩阵的前三个索引确定一个三维空间中的点。也就是说，空间上，我们有一个长61、宽73、高61的长方体，作为“大脑”。第四个指标是时间，也就是说，对于大脑中的每一个点，有240个时间信号被记录。以上是一个病例的信息。大家可以在MATLAB里玩一下这个数据熟悉下。（见我在```code/Fuzzy_Entropy/```里的```test.m```，以及一张在点(2,2,2)的时间序列图像。）

目前看来，我们搜索到的熵算法以MATLAB代码为主，部分python代码很容易改写。*所以初步计划，对于熵计算，全部使用MATLAB进行*。而训练部分应该是交给python。要开学了，具体的数据规范过一段时间再说。

## 5月15日更新

学长已经发给我处理过后的正常人时间序列，如上所述的形式。共有26个mat文件，意味着，有26个正常人病例，每个都以(61,73,61，240)数组的形式储存。也就是说，每个病例都有271633个长度为240的时间序列！    这显然不可取，故我问学长要了大脑的*分区*模式，（储存在```region_of_interest```中，大家和其他数据一并下载。）查看了一下，可以简化数据，并且我认为是重要的信息。下面说一下这个***分区***。

```region_of_interest```包含了116个```aalxxx.mat```文件，也就是116个感兴趣的区域。每个mat文件中的inter数据是(61,73,61)数组，就是说只有空间信息（因为这里只需要分区信息，不需要时间）。数组中，值为0表示对该坐标处的时间序列不感兴趣，1表示感兴趣。那么利用MATLAB的**find**函数，可以提取出非零的元素的索引（这就是我们需要的“分区坐标”）。但是find只返回线性索引（就是把无脑按列排序，而我们往往要使用一般的三维索引），可以使用**ind2sub**函数转换成下标索引，例子见```data/indtest.m```。

初步观察，大概每个感兴趣的分区，包含几十到几百个坐标，这样就大大简化了原始时间序列的个数，而不是对每个病例遍历27万多个时间序列。

目前的想法是，任然需要查阅***aal分区***的资料，了解各个脑区的意义，以供后期可能的*特征构建*。

这两天就要返校了，大家各有事情忙。以上是我拿到数据后的想法，大家这两天看下数据，有*问题，想法，建议，甚至完全不同的思路*，在群里说就行。

