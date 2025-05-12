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

**🌎 번역에 도움을 주신분들: [🇬🇧](../README.md) . [🇨🇳](README_zh.md) . [🇧🇷](README_pt-br.md) . [🇰🇷](README_ko.md) . [🇫🇷](README_fr.md) . [🇩🇪](README_de.md) . [🇹🇷](README_tr.md)**

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

 [<img src="../Assets/thumb_getting_started.png">](https://youtu.be/75kgOhWsPNA)

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

![](../Assets/storyboard.png)

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


👩🏼‍🏫  **어떻게 특정 요소에 skeleton 을 지정할까요?**

아래의 그림은 `UITableView` 에서 특정한 요소에 skeleton 을 지정하는 방법을 보여주는 이미지 입니다:

![](../Assets/tableview_scheme.png)

위의 이미지에서 보이듯, 테이블 뷰와 셀에 들어가는 UI 요소들에는 적용을 해야하지만, `contentView`에 skeleton을 적용할 필요는 없습니다.

####  UICollectionView

 ```UICollectionView``` 에 적용을 하기 위해서는, ```SkeletonCollectionViewDataSource``` protocol 을 구현할 필요가 있습니다.

``` swift
public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```

```UITableView``` 와 사용방법은 같습니다.

### 📰 Multiline text


![](../Assets/multilines2.png)

텍스트가 들어있는 요소를 사용한다면, ```SkeletonView``` 에서 텍스트의 라인을 그려줍니다.
그리고, 원하는 라인 수를 설정할 수 있습니다. 만약   ```numberOfLines``` 을 0으로 설정한다면, 자동으로 필요한 라인수를 계산해서 그려줍니다. 대신 값이 설정되어있다면 설정된 수만큼의 라인이 그려집니다.

##### 🎛 Customize

당신은 멀티라인을 위해 몇가지 옵션을 설정할 수 있습니다.


| 속성                                              | 값         | 기본값   | 미리보기                               |
| ----------------------------------------------- | --------- | ----- | ---------------------------------- |
| 마지막 라인의 **퍼센트** 를 지정 할 수 있습니다.                  | `0...100` | `70%` | ![](../Assets/multiline_lastline.png) |
| 라인의 **Corner radius** 를 지정할 수 있습니다. (**새로운기능**) | `0...10`  | `0`   | ![](../Assets/multiline_corner.png)   |



라인의 radius를 지정하기 위해서는  **코드** 를 이용합니다, 아래 처럼 코드를 작성합니다:
```swift
descriptionTextView.lastLineFillPercent = 50
descriptionTextView.linesCornerRadius = 5
```

혹은 **IB/Storyboard** 를 이용하실 수 있습니다:

![](../Assets/multiline_customize.png)

### 🎨 Custom colors

당신은 skeleton의 색상을 지정 할 수 있습니다. 간단하게 원하는 색상을 파라미터로 넘겨주시면 됩니다.

**단색 이용방법**
``` swift
view.showSkeleton(usingColor: UIColor.gray) // Solid
// or
view.showSkeleton(usingColor: UIColor(red: 25.0, green: 30.0, blue: 255.0, alpha: 1.0))
```
**그라디언트 이용 방법**
``` swift
let gradient = SkeletonGradient(baseColor: UIColor.midnightBlue)
view.showGradientSkeleton(usingGradient: gradient) // Gradient
```

게다가, ```SkeletonView``` 에서는 20가지의 기본 컬러를 지원합니다 🤙🏼

```UIColor.turquoise, UIColor.greenSea, UIColor.sunFlower, UIColor.flatOrange  ...```

![](../Assets/flatcolors.png)
###### 위 이미지는 [https://flatuicolors.com](https://flatuicolors.com) 사이트에서 발췌했습니다.

### 🦋 Appearance

**새로운 사항** skeleton 은  기본설정 값이 정해져 있습니다. 만약 커스텀 컬러를 사용할 필요가 없다면, `SkeletonView` 에 지정 되어있는 기본설정을 사용하시면 됩니다.

기본 설정값:
- **tintColor**: UIColor
    - *기본값: .clouds*
- **gradient**: SkeletonGradient
  - *기본값: SkeletonGradient(baseColor: .clouds)*
- **multilineHeight**: CGFloat
  - *기본값: 15*
- **multilineSpacing**: CGFloat
  - *기본값: 10*
- **multilineLastLineFillPercent**: Int
  - *기본값: 70*
- **multilineCornerRadius**: Int
  - *기본값: 0*

`SkeletonAppearance.default` 에는 사용 되어지는 기본 값들이 설정되어 있습니다 . 아래의 코드와 같이 사용할 수 있습니다:
```Swift
SkeletonAppearance.default.multilineHeight = 20
SkeletonAppearance.default.tintColor = .green
```


### 🤓 커스텀 애니메이션

```SkeletonView``` 에는 두가지 애니메이션이 내장되어 있습니다, 단색 *바운스* 애니메이션과  그라디언트 *슬라이드* 애니메이션 입니다 .

게다가, 직접 애니메이션을 추가하고 싶다면 정말 간단합니다.


Skeleton 에서는 `showAnimatedSkeleton` 함수를  ```SkeletonLayerAnimation```에 정의하여 맞춤형 애니메이션을 정의할 수 있도록 되어 있습니다.

```swift
public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation
```

함수는 이렇게 호출 가능합니다:

```swift
view.showAnimatedSkeleton { (layer) -> CAAnimation in
  let animation = CAAnimation()
  // Customize here your animation

  return animation
}
```

```SkeletonAnimationBuilder```의 사용이 가능합니다. ```SkeletonLayerAnimation```을 만들기 위해 사용됩니다.

이제, 그라디언트를 위한 **슬라이딩 애니메이션** 을 만들 수 있습니다, 애니메이션을 위한  **방향** 과  **지속시간** 을 설정 할 수 있습니다.  (기본값 = 1.5초).

```swift
// func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation

let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftToRight)
view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)

```

```GradientDirection``` 는 enum 으로 정의 되어있습니다., 아래의 케이스를 참조하세요:

| 방향                  | 미리보기                                           |
| ------------------- | ---------------------------------------------- |
| .leftRight          | ![](../Assets/sliding_left_to_right.gif)          |
| .rightLeft          | ![](../Assets/sliding_right_to_left.gif)          |
| .topBottom          | ![](../Assets/sliding_top_to_bottom.gif)          |
| .bottomTop          | ![](../Assets/sliding_bottom_to_top.gif)          |
| .topLeftBottomRight | ![](../Assets/sliding_topLeft_to_bottomRight.gif) |
| .bottomRightTopLeft | ![](../Assets/sliding_bottomRight_to_topLeft.gif) |

> **😉 꿀팁!**
슬라이딩 애니메이션을 만들기 위한 또다른 방법이 있습니다, 아래의 코드를 참조하세요:
>>```let animation = GradientDirection.leftToRight.slidingAnimation()```

### 👨‍👧‍👦 계층 구조

```SkeletonView```는 재귀적입니다 , 그리고 우리는 skeleton이 효율적으로 작동하기를 원하기 때문에, 가능한 빨리 재귀작업을 중단하기를 원합니다. 이러한 이유때문에 반드시 컨테이너 뷰를  `Skeletonable` 로 설정해야 합니다,  `skeletonable` 되지 않는 뷰를 만나는 순간 재귀 작업을 중단하기 떄문입니다.

아래의 이미지를 참고하세요 이미지는 한눈에 이해되실겁니다:

> ```ìsSkeletonable```= ☠️

| 설정값                             | 결과                                        |
| ----------------------------------------- | --------------------------------------------- |
| ![](../Assets/no_skeletonable.png)           | ![](../Assets/no_skeletonables_result.png)       |
| ![](../Assets/container_no_skeletonable.png) | ![](../Assets/no_skeletonables_result.png)       |
| ![](../Assets/container_skeletonable.png)    | ![](../Assets/container_skeletonable_result.png) |
| ![](../Assets/all_skeletonables.png)         | ![](../Assets/all_skeletonables_result.png)      |


### 🔬 디버그

**새로운소식** 어떤것들이 잘 동작 하지 않을때를 위해 디버그 작업을 용이하게 하기 위해서  `SkeletonView` 에는 몇가지 새로운 것들이 있습니다.

첫번쨰로, `UIView` 에서 skeleton 정보를 보기위해 다음과 같이 지원하고 있습니다:
```swift
var skeletonDescription: String

```
skeleton은 이렇게 생겼습니다:

![](../Assets/debug_description.png)

그리고, 새로운 **디버그 모드**를 활성화 시킬 수 있습니다. 간단하게 `SKELETON_DEBUG` 이라는 환경 변수를 추가해 활성화 하면 됩니다.

![](../Assets/debug_mode.png)

그런 이후 skeleton이 나오면 Xcode 콘솔창에서 계층 구조를 볼 수 있습니다.

<details>
<summary>예제를 확인해보세요. </summary>
<img src="../Assets/hierarchy_output.png" />
</details>



### 📚 문서화
조금만 기다려주세요...😅

### 📋 지원 가능한 OS & SDK 버전

* iOS 9.0+
* tvOS 9.0+
* Swift 4.2

## 📬 예정된 기능들

* [x] 멀티라인 에서의 마지막 라인의 채우기 비율 설정
* [x] 더많은 그라디언트 애니메이션
* [x] resizable cells 지원
* [x] CollectionView 호환
* [x] tvOS 호환
* [x] recovery state 추가
* [x] Custom default appearance
* [x] 디버그 모드
* [ ] Custom collections 호환
* [ ] skeletons 가 보이거나 가려질때 애니메이션 추가
* [ ] MacOS 와 WatchOS 호환

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
