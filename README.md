# TZRotateViewController

此demo的转屏是真正意义上的转屏，不是使用transform简单的旋转某个view。
使用的是**UIViewControllerTransitioningDelegate**，类似爱奇艺的视频转屏动画。
解决了闪烁灯转屏问题，是用于小屏转全屏的动画，有需要的可以下载看看。

具体效果图如下，点击黄色区域的时候把黄色区域view所属的vc直接present到全屏。

![](images/demo.gif)