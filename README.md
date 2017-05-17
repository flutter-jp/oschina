# exchanger
exchanger是一款汇率换算的app,目前只支持RMB和JPY(日元)之间的换算。当然，如果想实现其他币种的汇率换算也很简单,添加一个下拉框把参数放在里面.然后去请求api获取对应的汇率就可以实现计算啦.这个有空的时候再做吧

### 一. 主要功能
1. 点击对应数字按钮和小数点按钮会在输入栏中显示对应的结果
输入框中的数只能允许存在一个小数点
2. 删除按钮会将最后一位数字删除
如果最后一位数是小数点,则小数点也会被清除
3. 显示当前汇率
使用`Alamofire`异步获取汇率api,然后采用`swiftJSON`解析json数据并展示
4. 清除按钮
会将输入栏和结果栏的数据全部置0
5. 切换按钮
可以切换RMB和JPY(日元)的实时汇率和换算功能. 

### 二.使用技术
1. 整个功能采用swift3.0.2实现
2. pod 1.2.1 管理依赖
3. 网络框架`Alamofire`4.4 获取api数据
4. 使用`swiftJSON`3.1.4对获取的json数据进行解析
5. 使用`SnapKit`3.2.0做自动布局(暂未实现)

### 三.截图
![](http://image.xiaomo.info/swift/exchanger-icon.png)

![](http://image.xiaomo.info/swift/exchanger-ui.png)

### 四. 功能演示
![](http://image.xiaomo.info/swift/exchanger.gif)


### 五. 做此app的动机
1. 最近在学swift,这是个不错的练手项目
2. 打算去日本,所以做个app装到自己手机上用,即方便又有成就感,哈哈哈


# ykLive
仿映客直播(简化版)

学习swift过程中的模仿的项目,读万卷书,行万里路。给自己多找点项目做，让自己慢慢的熟悉起来。如果这个项目您下载之后无法正常运行,这是常理之中的事情。 项目中用到了没有受pod管理的第三方库,size有点大。github只允许上传100M以内的项目,所以依赖的框架并没有一并上传。
存于百度云盘,需要的自取。下载之后导入重新编译就可以正常运行咯。当然也要记得`pod install`,毕竟kingfisher和Alamofire是pod管理的。考虑到不受pod管理的库存在诸多不便,我也在积极在寻找替代品并不断的完善此项目。欢迎贡献代码。

链接: https://pan.baidu.com/s/1gf66hvd 密码: yhy9


## 截图

启动界面   
![](https://image.xiaomo.info/swift/yk-luncher.png)

app预览    
![](https://image.xiaomo.info/swift/yk-1.png)
![](https://image.xiaomo.info/swift/yk-2.png)
## 项目展示
![](https://image.xiaomo.info/swift/yk.gif)
![](https://image.xiaomo.info/swift/yklive-live.gif)

如果不显示,也可以手动打开链接哟(可能gif过大的原因)

https://image.xiaomo.info/swift/yk.gif

https://image.xiaomo.info/swift/yklive-live.gif

## 鸣谢
[小波](http://blog.xiaoboswift.com)
