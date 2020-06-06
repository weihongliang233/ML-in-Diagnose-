# 测试pentropy函数

## 介绍

pentropy是matlab的函数。能够用于计算谱熵。

导入数据

```
shaped_data=reshape(data(1,20,1,:),[1,240])
```

![image-20200606135028191](http://q9o2ymmbp.bkt.clouddn.com/img/image-20200606135028191.png)

建立时间表（pentropy的输入数据是时间表的格式，而不是普通数组的格式；输出数据也是如此，得想办法转化）。

```
time=seconds(linspace(0,1,240))
xt=timetable(time',shaped_data')
```

计算谱熵	

```
entropy=pentropy(xt)
```

画图

```
stackedplot(entropy)
```

