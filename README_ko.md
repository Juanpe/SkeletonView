![](Assets/header2.jpg)

<p align="center">
    <a href="https://app.bitrise.io/app/6d289a17e22c8323">
      <img src="https://app.bitrise.io/app/6d289a17e22c8323/status.svg?token=fI7gKC41XD9-aRXDScCKBw&branch=master">
    </a>
    <a href="https://codebeat.co/projects/github-com-juanpe-skeletonview-master"><img alt="codebeat badge" src="https://codebeat.co/badges/f854fdfd-31e5-4689-ba04-075d83653e60" /></a>
    <a href="https://github.com/Juanpe/SkeletonView">
        <img src="https://img.shields.io/cocoapods/p/SkeletonView.svg" alt="Platforms">
    </a>
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://cocoapods.org/pods/SkeletonView">
        <img src="https://img.shields.io/cocoapods/v/SkeletonView.svg" alt="CocoaPods" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
    </a>
    <a href="https://github.com/apple/swift-package-manager">
        <img src="https://img.shields.io/badge/SPM-compatible-brightgreen.svg" alt="SPM" />
    </a>
    <a href="https://twitter.com/JuanpeCatalan">
        <img src="https://img.shields.io/badge/contact-@JuanpeCatalan-blue.svg?style=flat" alt="Twitter: @JuanpeCatalan" />
    </a>
    <br/>
    <a href="https://twitter.com/intent/tweet?text=Wow%20This%20library%20is%20awesome:&url=https%3A%2F%2Fgithub.com%2FJuanpe%2FSkeletonView">
      <img src="https://img.shields.io/twitter/url/https/github.com/Juanpe/SkeletonView.svg?style=social" alt="License" />
    </a>
</p>

🌎  번역에 도움을 주신분들: </br>
[🇨🇳](https://github.com/Juanpe/SkeletonView/blob/master/README_zh.md) by [@WhatsXie](https://twitter.com/WhatsXie) </br>
[🇧🇷](https://github.com/Juanpe/SkeletonView/blob/master/README_pt-br.md) by [@brunomunizaf](https://twitter.com/brunomuniz_af) </br>
[🇰🇷](https://github.com/Juanpe/SkeletonView/blob/master/README_ko.md) by [@techinpark](https://twitter.com/techinpark)


오늘날 거의 대부분의 앱들은 비동기 방식의 API 호출을 사용하는 프로세스를 가지고 있습니다. 
프로세스가 작동하는동안 개발자들은 작업이 실행되고 있다는것을 사용자들에게 보여주기 위해서 로딩 뷰를 배치합니다. 

```SkeletonView```는 이러한 필요에 의해 고안되었고, 사용자들에게 무엇인가 로딩이 되고 있다는것을 보여주면서 기다리는 콘텐츠에 대해서도 미리 준비할 수 있게 해주는 우아하게 표현할수 있는 방법입니다 

맘껏 누리세요 🙂

* [기능](#-features)
* [가이드](#-guides)
* [설치방법](#-installation)
  * [Cocoapods](#using-cocoapods)
  * [Carthage](#using-carthage)
  * [SPM](#using-swift-package-manager)
* [어떻게 사용하나요?](#-how-to-use)
  * [Collections](#-collections)
  * [Multiline text](#-multiline-text)
  * [Custom colors](#-custom-colors)
  * [Appearance](#-appearance)
  * [Custom animations](#-custom-animations)
  * [Hierarchy](#-hierarchy)
  * [Debug](#-debug)
* [문서화](#-documentation)
* [지원되는 OS와 SDK 버전](#-supported-os--sdk-versions)
* [Next steps](#-next-steps)
* [Contributing](#-contributing)
* [Mentions](#-mentions)
* [개발자](#-author)
* [라이센스](#-license)


## 🌟 기능

- [x] 사용이 쉽습니다 
- [x] 모든 `UIView`에서 사용가능합니다 
- [x] 전체 커스터마이징이 가능합니다 
- [x] 공통으로 이용가능합니다 (iPhone & iPad)
- [x] `Interface Builder` 에서 사용 가능합니다.
- [x] 간단한 스위프트 문법
- [x] 가볍고 가독성 좋은 코드

## 🎬 사용가이드

 [<img src="Assets/thumb_getting_started.png">](https://youtu.be/75kgOhWsPNA)

## 📲 설치 방법

#### [CocoaPods](https://cocoapods.org) 로 사용하기

당신의 프로젝트 `Podfile` 파일에 아래와 같이 입력합니다:

```ruby
pod "SkeletonView"
```

#### [Carthage](https://github.com/carthage)로 사용하기

당신의 프로젝트 `Cartfile` 파일에 아래와 같이 입력합니다:

```bash
github "Juanpe/SkeletonView"
```

#### [Swift Package Manager](https://github.com/apple/swift-package-manager)로 사용하기


당신의 프로젝트에 Swift package를 설정한다면, `SkeletonView` 를 `Package.swift` 파일에 있는 `dependencies`에 추가하시면 됩니다.


```swift
  dependencies: [
    .package(url: "https://github.com/Juanpe/SkeletonView.git", from: "1.6")
  ]
```



## 🐒 어떻게 사용하나요?

`SkeletonView` 를 이용하기 위해서는 딱 **3** 단계만 기억하세요:

**1.** 사용하고자 하는 파일에서 `SkeletonView` 를 `Import` 합니다.
```swift
import SkeletonView
```

**2.** 자, 그렇다면 UIView 속성에  `skeletonables` 를 이용하실 수 있습니다. 두가지 옵션이 있습니다

**코드로 사용하는 방법:**
```swift
avatarImageView.isSkeletonable = true
```
**인터페이스빌더 / 스토리보드를 이용하는 방법:**

![](Assets/storyboard.png)

**3.** 당신이 뷰를 세팅할때, **skeleton** 옵션을 사용 할 수 있습니다. 총 **4** 가지 옵션을 지원합니다:

```swift
(1) view.showSkeleton()                 // Solid
(2) view.showGradientSkeleton()         // Gradient
(3) view.showAnimatedSkeleton()         // Solid animated
(4) view.showAnimatedGradientSkeleton() // Gradient animated
```

**미리보기**

<table>
<tr>
<td width="25%">
<center>Solid</center>
</td>
<td width="25%">
<center>Gradient</center>
</td>
<td width="25%">
<center>Solid Animated</center>
</td>
<td width="25%">
<center>Gradient Animated</center>
</td>
</tr>
<tr>
<td width="25%">
<img src="Assets/solid.png"></img>
</td>
<td width="25%">
<img src="Assets/gradient.png"></img>
</td>
<td width="25%">
<img src="Assets/solid_animated.gif"></img>
</td>
<td width="25%">
<img src="Assets/gradient_animated.gif"></img>
</td>
</tr>
</table>

> **중요!**
>>```SkeletonView``` 는 재귀적으로 되어있습니다, 만약 모든 뷰에 대해서 skeleton을 호출하고 싶다면, 메인 컨테이너 뷰에서 show `method`를 호출하여야 합니다. 예를 들자면 UIViewControllers가 있습니다. 



### 🌿 Collections

 현재, ```SkeletonView``` 는  ```UITableView``` 와 ```UICollectionView```에서 호환됩니다.

#### UITableView

만약 ```UITableView```에서 skeleton을 호출하고 싶다면, ```SkeletonTableViewDataSource``` protocol 을 구현하여야 합니다. 

``` swift
public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```

해당 프로토클은 보시다시피  ```UITableViewDataSource```를 상속받아 구현하였으므로, skeleton의 protocol과 대체 가능합니다. 

프로토콜의 기본 구현은 다음과 같습니다: 

``` swift
func numSections(in collectionSkeletonView: UITableView) -> Int
// Default: 1
```

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
// Default:
// 전체 테이블 뷰를 채우는데 필요한 셀 수를 계산합니다 
```

해당 메소드는 당신이 구현하여야할 cell identifier을 아는 경우에만 사용합니다, 해당 메소드는 기본으로 구현하지 않아도됩니다 : 

 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
 ```

**Example**
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return "CellIdentifier"
}
 ```

> **중요!**
> 만약 사이즈가 변하는 셀을 사용한다면 (`tableView.rowHeight = UITableViewAutomaticDimension` ),`estimatedRowHeight`를 무조건 정의해주세요.


👩🏼‍🏫  **How specify which elements are skeletonables?**

Here is an illustration that shows how you should specify which elements are skeletonables when you are using an `UITableView`:

![](Assets/tableview_scheme.png)

As you can see, we have to make skeletonable the tableview, the cell and the UI elements, but we don't need to set as skeletonable the `contentView`

####  UICollectionView

For ```UICollectionView```, you need to conform to ```SkeletonCollectionViewDataSource``` protocol.

``` swift
public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```

The rest of the process is the same as ```UITableView```

### 📰 Multiline text


![](Assets/multilines2.png)

When using elements with text, ```SkeletonView``` draws lines to simulate text.
Besides, you can decide how many lines you want. If  ```numberOfLines``` is set to zero, it will calculate how many lines needed to populate the whole skeleton and it will be drawn. Instead, if you set it to one, two or any number greater than zero, it will only draw this number of lines.

##### 🎛 Customize

You can set some properties for multilines elements.


| Property | Values | Default | Preview
| ------- | ------- |------- | -------
| **Filling percent** of the last line. | `0...100` | `70%` | ![](Assets/multiline_lastline.png)
| **Corner radius** of lines. (**NEW**) | `0...10` | `0` | ![](Assets/multiline_corner.png)



To modify the percent or radius **using code**, set the properties:
```swift
descriptionTextView.lastLineFillPercent = 50
descriptionTextView.linesCornerRadius = 5
```

Or, if you prefer use **IB/Storyboard**:

![](Assets/multiline_customize.png)

### 🎨 Custom colors

You can decide which color the skeleton is tinted with. You only need to pass as a parameter the color or gradient you want.

**Using solid colors**
``` swift
view.showSkeleton(usingColor: UIColor.gray) // Solid
// or
view.showSkeleton(usingColor: UIColor(red: 25.0, green: 30.0, blue: 255.0, alpha: 1.0))
```
**Using gradients**
``` swift
let gradient = SkeletonGradient(baseColor: UIColor.midnightBlue)
view.showGradientSkeleton(usingGradient: gradient) // Gradient
```

Besides, ```SkeletonView``` features 20 flat colors 🤙🏼

```UIColor.turquoise, UIColor.greenSea, UIColor.sunFlower, UIColor.flatOrange  ...```

![](Assets/flatcolors.png)
###### Image captured from website [https://flatuicolors.com](https://flatuicolors.com)

### 🦋 Appearance

**NEW** The skeletons have a default appearance. So, when you don't specify the color, gradient or multilines properties, `SkeletonView` uses the default values.

Default values:
- **tintColor**: UIColor
    - *default: .clouds*
- **gradient**: SkeletonGradient
  - *default: SkeletonGradient(baseColor: .clouds)*
- **multilineHeight**: CGFloat
  - *default: 15*
- **multilineSpacing**: CGFloat
  - *default: 10*
- **multilineLastLineFillPercent**: Int
  - *default: 70*
- **multilineCornerRadius**: Int
  - *default: 0*

To get these default values you can use `SkeletonAppearance.default`. Using this property you can set the values as well:
```Swift
SkeletonAppearance.default.multilineHeight = 20
SkeletonAppearance.default.tintColor = .green
```


### 🤓 Custom animations

```SkeletonView``` has two built-in animations, *pulse* for solid skeletons and *sliding* for gradients.

Besides, if you want to do your own skeleton animation, it's really easy.


Skeleton provides the `showAnimatedSkeleton` function which has a ```SkeletonLayerAnimation``` closure where you can define your custom animation.

```swift
public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation
```

You can call the function like this:

```swift
view.showAnimatedSkeleton { (layer) -> CAAnimation in
  let animation = CAAnimation()
  // Customize here your animation

  return animation
}
```

It's available ```SkeletonAnimationBuilder```. It's a builder to make ```SkeletonLayerAnimation```.

Today, you can create **sliding animations** for gradients, deciding the **direction** and setting the **duration** of the animation (default = 1.5s).

```swift
// func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation

let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftToRight)
view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)

```

```GradientDirection``` is an enum, with this cases:

|  Direction | Preview
|------- | -------
| .leftRight | ![](Assets/sliding_left_to_right.gif)
| .rightLeft | ![](Assets/sliding_right_to_left.gif)
| .topBottom | ![](Assets/sliding_top_to_bottom.gif)
| .bottomTop | ![](Assets/sliding_bottom_to_top.gif)
| .topLeftBottomRight | ![](Assets/sliding_topLeft_to_bottomRight.gif)
| .bottomRightTopLeft | ![](Assets/sliding_bottomRight_to_topLeft.gif)

> **😉 TRICK!**
Exist another way to create sliding animations, just using this shortcut:
>>```let animation = GradientDirection.leftToRight.slidingAnimation()```

### 👨‍👧‍👦 Hierarchy

Since ```SkeletonView``` is recursive, and we want skeleton to be very efficient, we want to stop recursion as soon as possible. For this reason, you must set the container view as `Skeletonable`, because Skeleton will stop looking for `skeletonable` subviews as soon as a view is not Skeletonable, breaking then the recursion.

Because an image is worth a thousand words:

> ```ìsSkeletonable```= ☠️

| Configuration | Result
|------- | -------
|![](Assets/no_skeletonable.png) | ![](Assets/no_skeletonables_result.png)
|![](Assets/container_no_skeletonable.png) | ![](Assets/no_skeletonables_result.png)
|![](Assets/container_skeletonable.png) | ![](Assets/container_skeletonable_result.png)
|![](Assets/all_skeletonables.png) | ![](Assets/all_skeletonables_result.png)


### 🔬 Debug

**NEW** In order to facilitate the debug tasks when something is not working fine. `SkeletonView` has some new tools.

First, `UIView` has available a new property with his skeleton info:
```swift
var skeletonDescription: String

```
The skeleton representation looks like this:

![](Assets/debug_description.png)

Besides, you can activate the new **debug mode**. You just add the environment variable `SKELETON_DEBUG` and activate it.

![](Assets/debug_mode.png)

Then, when the skeleton appears, you can see the view hierarchy in the Xcode console.

<details>
<summary>Open to see an output example </summary>
<img src="Assets/hierarchy_output.png" />
</details>



### 📚 Documentation
Coming soon...😅

### 📋 Supported OS & SDK Versions

* iOS 9.0+
* tvOS 9.0+
* Swift 4.2

## 📬 예정된 기능들

* [x] Set the filling percent of the last line in multiline elements
* [x] Add more gradient animations
* [x] Supported resizable cells
* [x] CollectionView compatible
* [x] tvOS compatible
* [x] Add recovery state
* [x] Custom default appearance
* [x] Debug mode
* [ ] Custom collections compatible
* [ ] Add animations when it shows/hides the skeletons
* [ ] MacOS and WatchOS compatible

## ❤️ 기여하기
이 프로젝트는 오픈소스 프로젝트 입니다, 마음편하게 기여해주시면 됩니다 어떻게 하냐구요?
- 새로운 [이슈](https://github.com/Juanpe/SkeletonView/issues/new)를 등록합니다.
- [email](mailto://juanpecatalan.com)을 보냅니다.
- 당신의 수정을 제안합니다, pull request를 포함한 수정을 권장합니다.

전체 [기여자목록](https://github.com/Juanpe/SkeletonView/graphs/contributors)

###### [SwiftPlate](https://github.com/JohnSundell/SwiftPlate)를 통해 프로젝트가 생성되었습니다

## 📢 소식들

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
- [Swift News #36](https://www.youtube.com/watch?v=mAGpsQiy6so)



## 👨🏻‍💻 개발자
[1.1]: http://i.imgur.com/tXSoThF.png
[1]: http://www.twitter.com/JuanpeCatalan

* Juanpe Catalán [![alt text][1.1]][1]

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/CDou4xtIK"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"><span style="margin-left:5px"></span></a>

## 👮🏻 라이센스

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
