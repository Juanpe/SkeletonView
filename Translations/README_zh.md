![](../Assets/header2.jpg)

<p align="center">
    <a href="https://github.com/Juanpe/SkeletonView/actions?query=workflow%3ACI">
      <img src="https://github.com/Juanpe/SkeletonView/workflows/CI/badge.svg">
    </a>
    <a href="https://codebeat.co/projects/github-com-juanpe-skeletonview-master"><img alt="codebeat badge" src="https://codebeat.co/badges/f854fdfd-31e5-4689-ba04-075d83653e60" /></a>
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <img src="http://img.shields.io/badge/dependency%20manager-swiftpm%2Bcocoapods%2Bcarthage-green" />
    <img src="https://img.shields.io/badge/platforms-ios%2Btvos-green" />
    <a href="https://badge.bow-swift.io/recipe?name=SkeletonView&description=An%20elegant%20way%20to%20show%20users%20that%20something%20is%20happening%20and%20also%20prepare%20them%20to%20which%20contents%20he%20is%20waiting&url=https://github.com/juanpe/skeletonview&owner=Juanpe&avatar=https://avatars0.githubusercontent.com/u/1409041?v=4&tag=1.8.7"><img src="https://raw.githubusercontent.com/bow-swift/bow-art/master/badges/nef-playgrounds-badge.svg" alt="SkeletonView Playground" style="height:20px"></a>   
    <br/>
    <a href="https://twitter.com/JuanpeCatalan">
        <img src="https://img.shields.io/badge/contact-@JuanpeCatalan-blue.svg?style=flat" alt="Twitter: @JuanpeCatalan" />
    </a>
    <a href="https://gitter.im/SkeletonView/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge">
        <img src="https://badges.gitter.im/SkeletonView/community.svg?style=flat" />
    </a>
    <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=MJ4Y2D9DEX6FL&lc=ES&item_name=SkeletonView&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted">
        <img src="https://img.shields.io/badge/Donate-PayPal-green.svg" alt="PayPal" />
    <a href="https://twitter.com/intent/tweet?text=Wow%20This%20library%20is%20awesome:&url=https%3A%2F%2Fgithub.com%2FJuanpe%2FSkeletonView">
      <img src="https://img.shields.io/twitter/url/https/github.com/Juanpe/SkeletonView.svg?style=social" alt="License" />
    </a>
</p>

**🌎 翻译: [🇬🇧](../README.md) . [🇨🇳](README_zh.md) . [🇧🇷](README_pt-br.md) . [🇰🇷](README_ko.md) . [🇫🇷](README_fr.md) . [🇩🇪](README_de.md) . [🇹🇷](README_tr.md)**

今天，几乎所有的应用程序都有异步流程，例如：Api请求、长时间运行的流程等。虽然流程正在运行，但通常开发人员会设置一个加载视图来向用户显示正在发生的事情。

```SkeletonView``` 已经构想出来满足这种需求，这是一种优雅的方式，向用户展示正在发生的事情，并为他们等待的内容做好准备。

好好享受! 🙂

- [🌟 特征](#-特征)
  - [📋 版本要求](#-版本要求)
  - [🔮 示例](#-示例)
- [📲 安装](#-安装)
    - [使用 CocoaPods](#使用-cocoapods)
    - [使用 Carthage](#使用-carthage)
- [🐒 如何使用](#-如何使用)
  - [🌿 集合](#-集合)
        - [UITableView](#uitableview)
        - [UICollectionView](#uicollectionview)
  - [📰 多行文字](#-多行文字)
      - [🎛 定制](#-定制)
  - [🎨 自定义颜色](#-自定义颜色)
        - [从网站 https://flatuicolors.com捕获的图像](#从网站-httpsflatuicolorscom捕获的图像)
  - [🤓 自定义动画](#-自定义动画)
  - [👨‍👧‍👦 等级制度](#-等级制度)
  - [📚 文档](#-文档)
- [📬 下一步](#-下一步)
- [❤️ 特约](#️-特约)
        - [使用 SwiftPlate 生成的项目](#使用-swiftplate-生成的项目)
- [📢 提及](#-提及)
- [👨🏻‍💻 作者](#-作者)
- [👮🏻 许可证](#-许可证)


## 🌟 特征

- [x] 使用方便
- [x] 支持所有 UIView
- [x] 完全可定制
- [x] 通用（iPhone和iPad）
- [x] Interface Builder 友好
- [x] 简单的 Swift 语法
- [x] 轻量级可读代码库

### 📋 版本要求

* iOS 10.0+
* tvOS 10.0+
* Swift 4.2

### 🔮 示例

要运行示例项目，请克隆并运行 `SkeletonViewExample` 项目。

## 📲 安装

#### 使用 [CocoaPods](https://cocoapods.org)

使用 CocoaPods 编辑您的 Podfile 并指定依赖项：

```ruby
pod "SkeletonView"
```

#### 使用 [Carthage](https://github.com/carthage)

编辑您的 Cartfile 并指定依赖项:

```bash
github "Juanpe/SkeletonView"
```

## 🐒 如何使用

只需 **3** 个步骤即可使用 `SkeletonView`:

**1.** 在适当的位置导入SkeletonView
```swift
import SkeletonView
```

**2.** 现在，您可以通过两种设置方式实现 `SkeletonView` 效果

**使用纯代码：**
```swift
avatarImageView.isSkeletonable = true
```
**使用 IB/Storyboards：**

![](../Assets/storyboard.png)

**3.** 设置视图后，可以显示 **skeleton**. 并且您有 **4** 种效果可供选择:

```swift
(1) view.showSkeleton()                 // 固体
(2) view.showGradientSkeleton()         // 渐变
(3) view.showAnimatedSkeleton()         // 纯色动画
(4) view.showAnimatedGradientSkeleton() // 渐变动画
```

**Preview**

<table>
<tr>
<td width="25%">
<center>固体</center>
</td>
<td width="25%">
<center>渐变</center>
</td>
<td width="25%">
<center>纯色动画</center>
</td>
<td width="25%">
<center>渐变动画</center>
</td>
</tr>
<tr>
<td width="25%">
<img src="../Assets/solid.png"></img>
</td>
<td width="25%">
<img src="../Assets/gradient.png"></img>
</td>
<td width="25%">
<img src="../Assets/solid_animated.gif"></img>
</td>
<td width="25%">
<img src="../Assets/gradient_animated.gif"></img>
</td>
</tr>
</table>

> **重要!**
>>```SkeletonView``` 是递归的，所以如果你想在所有可骨架化的视图中显示骨架，你只需要在主容器视图中调用show方法。例如，使用UIViewControllers

### 🌿 集合

现在，```SkeletonView``` 兼容 ```UITableView``` 和 ```UICollectionView```。

###### UITableView

如果你要显示 skeleton 在一个 ```UITableView```上，你需要符合 ```SkeletonTableViewDataSource``` 协议。

``` swift
public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```
如您所见，此协议继承自 UITableViewDataSource，因此您可以使用骨架协议替换此协议。

该协议具有默认实现：

``` swift
func numSections(in collectionSkeletonView: UITableView) -> Int
// 默认值：1
```

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
// 默认值：
// 它计算填充整个tableview需要多少个单元格
```

为了让Skeleton知道单元标识符，您只需要实现一种方法。此方法没有默认实现：

 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
 ```

**示例**
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return "CellIdentifier"
}
 ```

> **重要!**
> 如果您使用可调整大小的单元格 (`tableView.rowHeight = UITableViewAutomaticDimension` )，则必须定义 `estimatedRowHeight`。

###### UICollectionView

要为 ```UICollectionView``` 设置效果, 您需要符合 ```SkeletonCollectionViewDataSource``` 协议。

``` swift
public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```

其余操作与 ```UITableView``` 相同。

### 📰 多行文字


![](../Assets/multilines2.png)

使用带有文本的元素时， ```SkeletonView``` 绘制线条以模拟文本。此外，您可以决定您想要多少行。如果 ```numberOfLines``` 设置为零，它将计算填充整个骨架所需的行数，并将绘制它。相反，如果将其设置为一，二或任何大于零的数字，它将只绘制此行数。

##### 🎛 定制

您可以为多行元素设置一些属性。


| 属性 | 值范围 | 默认 | 延时
| ------- | ------- |------- | -------
| **Filling percent** 最后一行的长度百分比 | `0...100` | `70%` | ![](../Assets/multiline_lastline.png)
| **Corner radius** 条目圆角半径. (**新**) | `0...10` | `0` | ![](../Assets/multiline_corner.png)



**纯代码**修改百分比或半径：

```swift
descriptionTextView.lastLineFillPercent = 50
descriptionTextView.linesCornerRadius = 5
```

或者，如果您更喜欢使用 **IB/Storyboard**:

![](../Assets/multiline_customize.png)

### 🎨 自定义颜色

您可以决定 ```SkeletonView``` 的显示颜色。您只需要传递颜色或渐变的参数。

**使用纯色**
``` swift
view.showSkeleton(usingColor: UIColor.gray) // 固体效果
// 或者
view.showSkeleton(usingColor: UIColor(red: 25.0, green: 30.0, blue: 255.0, alpha: 1.0))
```
**使用渐变色**
``` swift
let gradient = SkeletonGradient(baseColor: UIColor.midnightBlue)
view.showGradientSkeleton(usingGradient: gradient) // 梯度效果
```

此外， ```SkeletonView``` 附带的 20 种颜色 🤙🏼

```UIColor.turquoise, UIColor.greenSea, UIColor.sunFlower, UIColor.flatOrange  ...```

![](../Assets/flatcolors.png)
###### 从网站 [https://flatuicolors.com](https://flatuicolors.com)捕获的图像

### 🤓 自定义动画

现在，```SkeletonView``` 有两个内置动画，*pulse* 脉冲效果和 *sliding* 渐变滑动效果。

此外，如果你想做自己的 skeleton 动画，那真的很容易。


Skeleton 提供了 `showAnimatedSkeleton` 一个具有 ```SkeletonLayerAnimation``` 闭包的功能，您可以在其中定义自定义动画。

```swift
public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation
```

您可以像这样调用函数：

```swift
view.showAnimatedSkeleton { (layer) -> CAAnimation in
  let animation = CAAnimation()
  // 在这里自定义你的动画

  return animation
}
```

**新** 它可用 ```SkeletonAnimationBuilder```。这是一个 ```SkeletonLayerAnimation```的衍生。

今天，您可以为渐变创建 **滑动动画**，确定 **方向** 并设置动画的 **持续时间**  (默认值 = 1.5s)。

```swift
// func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation

let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftToRight)
view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)

```

```GradientDirection``` 是一个枚举，在这种情况下：

|  方向 | 效果
|------- | -------
| .leftRight | ![](../Assets/sliding_left_to_right.gif)
| .rightLeft | ![](../Assets/sliding_right_to_left.gif)
| .topBottom | ![](../Assets/sliding_top_to_bottom.gif)
| .bottomTop | ![](../Assets/sliding_bottom_to_top.gif)
| .topLeftBottomRight | ![](../Assets/sliding_topLeft_to_bottomRight.gif)
| .bottomRightTopLeft | ![](../Assets/sliding_bottomRight_to_topLeft.gif)

> **😉 技巧!**
存在另一种创建滑动动画的方法，只需使用此快捷方式：
>>```let animation = GradientDirection.leftToRight.slidingAnimation()```

### 👨‍👧‍👦 等级制度

由于 ```SkeletonView``` 是递归的，我们希望 skeleton 效率高效, 我们希望尽快停止递归。因此，您必须将容器视图设置为 `Skeletonable` ，因为`skeletonable` 一旦视图不是 Skeletonable, Skeleton 将停止查找子视图，然后断开递归。

一图胜千言：

> 设置 ```ìsSkeletonable```= ☠️

| 分组 | 结果
|------- | -------
|![](../Assets/no_skeletonable.png) | ![](../Assets/no_skeletonables_result.png)
|![](../Assets/container_no_skeletonable.png) | ![](../Assets/no_skeletonables_result.png)
|![](../Assets/container_skeletonable.png) | ![](../Assets/container_skeletonable_result.png)
|![](../Assets/all_skeletonables.png) | ![](../Assets/all_skeletonables_result.png)



### 📚 文档
快出来...😅

## 📬 下一步

* [x] 设置多行元素中最后一行的填充百分比
* [x] 添加更多渐变动画
* [x] 支持可调整大小的单元
* [x] CollectionView 兼容
* [x] tvOS 兼容
* [x] 添加恢复状态
* [ ] 自定义集合兼容
* [ ] 在显示/隐藏骨架时添加动画
* [ ] MacOS 和 WatchOS兼容

## ❤️ 特约
这是一个开源项目，所以请随时贡献。怎么样？

- 打开一个 [issue](https://github.com/Juanpe/SkeletonView/issues/new)
- 反馈通过发送 [email](mailto://juanpecatalan.com)
- 提出您自己的修复和建议，并带有拉取的请求。

查看 [所有贡献者](https://github.com/Juanpe/SkeletonView/graphs/contributors)

###### 使用 [SwiftPlate](https://github.com/JohnSundell/SwiftPlate) 生成的项目

## 📢 提及

- [iOS Dev Weekly #327](https://iosdevweekly.com/issues/327#start)
- [Hacking with Swift Articles](https://www.hackingwithswift.com/articles/40/skeletonview-makes-loading-content-beautiful)
- [Top 10 Swift Articles November](https://medium.mybridge.co/swift-top-10-articles-for-the-past-month-v-nov-2017-dfed7861cd65)
- [30 Amazing iOS Swift Libraries (v2018)](https://medium.mybridge.co/30-amazing-ios-swift-libraries-for-the-past-year-v-2018-7cf15027eee9)
- [AppCoda Weekly #44](http://digest.appcoda.com/issues/appcoda-weekly-issue-44-81899)
- [iOS Cookies Newsletter #103](https://us11.campaign-archive.com/?u=cd1f3ed33c6527331d82107ba&id=48131a516d)
- [Swift Developments Newsletter #113](https://andybargh.com/swiftdevelopments-113/)
- [iOS Goodies #204](http://ios-goodies.com/post/167557280951/week-204)
- [Swift Weekly #96](http://digest.swiftweekly.com/issues/swift-weekly-issue-96-81759)
- [CocoaControls](https://www.cocoacontrols.com/controls/skeletonview)
- [Awesome iOS Newsletter #74](https://ios.libhunt.com/newsletter/74)



## 👨🏻‍💻 作者
[1.1]: http://i.imgur.com/tXSoThF.png
[1]: http://www.twitter.com/JuanpeCatalan

* Juanpe Catalán [![alt text][1.1]][1]

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/CDou4xtIK"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"><span style="margin-left:5px"></span></a>

## 👮🏻 许可证

```
MIT License

Copyright (c) 2017 Juanpe Catalán

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
