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

**🌎 번역에 도움을 주신분들: [🇬🇧](../README.md) . [🇨🇳](README_zh.md) . [🇧🇷](README_pt-br.md) . [🇰🇷](README_ko.md) . [🇫🇷](README_fr.md) . [🇩🇪](README_de.md)**

최근 앱들은 대부분 비동기 방식의 API 호출을 사용하는 프로세스를 가지고 있습니다.
프로세스가 작동하는 동안 개발자들은 작업이 실행되고 있다는것을 사용자들에게 보여주기 위해서 로딩 뷰를 배치합니다.

```SkeletonView```는 이러한 필요에 의해 고안되었고, 사용자들에게 무엇인가 로딩이 되고 있다는것을 보여주면서 기다리는 콘텐츠에 대해서도 미리 준비할 수 있게 해주는 우아하게 표현할수 있는 방법입니다

맘껏 누리세요 🙂

- [🌟 기능](#-기능)
- [🎬 사용 가이드](#-사용-가이드)
- [📲 설치 방법](#-설치-방법)
- [🐒 사용법](#-사용법)
  - [🌿 Collections](#-collections)
  - [🔠 Text](#-text)
  - [🦋 Appearance](#-appearance)
  - [🎨 Custom colors](#-custom-colors)
  - [🏃‍♀️ Animations](#️-animations)
  - [🏄 Transitions](#-transitions)
- [✨ 기타](#-기타)
- [❤️ 기여하기](#️-기여하기)
- [📢 소식](#-소식)
- [🏆 스폰서](#-스폰서)
- [👨🏻‍💻 개발자](#-개발자)
- [👮🏻 라이센스](#-라이센스)

## 🌟 기능

- [x] 사용이 쉽습니다
- [x] 모든 `UIView`에서 사용가능합니다
- [x] 전체 커스터마이징이 가능합니다
- [x] 공통으로 이용가능합니다 (iPhone & iPad)
- [x] `Interface Builder` 에서 사용 가능합니다.
- [x] 간단한 스위프트 문법
- [x] 가볍고 가독성 좋은 코드

## 🎬 사용 가이드

 [<img src="../Assets/thumb_getting_started.png">](https://youtu.be/75kgOhWsPNA)
| [![](https://img.youtube.com/vi/75kgOhWsPNA/maxresdefault.jpg)](https://youtu.be/75kgOhWsPNA)|[![](https://img.youtube.com/vi/MVCiM_VdxVA/maxresdefault.jpg)](https://youtu.be/MVCiM_VdxVA)|[![](https://img.youtube.com/vi/Qq3Evspeea8/maxresdefault.jpg)](https://youtu.be/Qq3Evspeea8)|[![](https://img.youtube.com/vi/Zx1Pg1gPfxA/maxresdefault.jpg)](https://www.youtube.com/watch?v=Zx1Pg1gPfxA)
|:---:  | :---:  | :---: | :---:
|[**SkeletonView 가이드 - 시작하기**](https://youtu.be/75kgOhWsPNA)|[**SkeletonView를 사용해 로딩 뷰 만들기 (Swift 5.2)**](https://youtu.be/MVCiM_VdxVA)    by iKh4ever Studio|[**앱에서 스켈레톤 로딩 뷰 만들기 (Swift 5) - Xcode 11, 2020**](https://youtu.be/Qq3Evspeea8)    by iOS Academy| [**iOS에서 데이터 로딩 애니메이션 만들기 (스페인어)**](https://www.youtube.com/watch?v=Zx1Pg1gPfxA) by MoureDev


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

> 📣 **중요!** 
>
> 버전 1.30.0 부터, `SkeletonView`가 **XCFrameworks** 를 지원합니다. **XCFramework** 를 설치하고 싶다면, 이 [레포지토리](https://github.com/Juanpe/SkeletonView-XCFramework.git) 를 참고해주세요.

## 🐒 사용법

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
    func numSections(in collectionSkeletonView: UITableView) -> Int // Default: 1
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? // Default: nil
    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath)
}
```

해당 프로토클은 보시다시피  ```UITableViewDataSource```를 상속받아 구현하였으므로, skeleton의 protocol과 대체 가능합니다.

프로토콜의 기본 구현은 다음과 같습니다. 예를 들어 각 섹션에 몇 개의 셀(=rows)이 들어가는지 런타임에 계산됩니다.

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
// Default:
// 전체 테이블 뷰를 채우는데 필요한 셀 수를 계산합니다
```

> **중요!**
>> 위 메소드에서 ```UITableView.automaticNumberOfSkeletonRows``` 를 리턴하는 경우 기본 값(default)과 동일하게 동작합니다. (즉 전체 테이블 뷰를 채우는데 필요한 셀 수를 계산합니다)


Skeleton 라이브러리가 cell identifier를 알기 위해 구현해야 할 메소드는 1개입니다. 이 메소드는 기본 값이 없습니다.

**Example**
``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return "CellIdentifier"
}
```

기본적으로 라이브러리는 각 indexPath에서 cell을 dequeue 합니다. 하지만 skeleton이 나타나기 전에 변화를 주고 싶다면 아래 코드와 같이 작성하면 됩니다.

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
    let cell = skeletonView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as? Cell
    cell?.textField.isHidden = indexPath.row == 0
    return cell
}
```

deque 부분을 라이브러리에게 맡기는 경우, 아래 방법을 사용해 cell을 구성할 수 있습니다.

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath) {
    let cell = cell as? Cell
    cell?.textField.isHidden = indexPath.row == 0
}
```

Tableview의 header와 footer에도 skeleton을 적용할 수 있습니다. 이를 위해 ```SkeletonTableViewDelegate```를 채택하세요.

``` swift
public protocol SkeletonTableViewDelegate: UITableViewDelegate {
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForHeaderInSection section: Int) -> ReusableHeaderFooterIdentifier? // default: nil
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForFooterInSection section: Int) -> ReusableHeaderFooterIdentifier? // default: nil
}
```

> 📣 **중요!** 
> 
> 1️⃣ 만약 사이즈가 변하는 셀을 사용한다면 (`tableView.rowHeight = UITableViewAutomaticDimension` ),`estimatedRowHeight`를 무조건 정의해주세요.
> 
> 2️⃣ **`UITableViewCell`**에 항목을 추가할 경우, cell에 직접적으로 추가하는 것이 아닌 **`contentView`** 에 추가해주어야 합니다.
> ```swift
> self.contentView.addSubview(titleLabel) ✅         
> self.addSubview(titleLabel) ❌
> ```


👩🏼‍🏫  **어떻게 특정 요소에 skeleton 을 지정할까요?**

아래의 그림은 `UITableView` 에서 특정한 요소에 skeleton 을 지정하는 방법을 보여주는 이미지 입니다:

![](../Assets/tableview_scheme.png)

위의 이미지에서 보이듯, 테이블 뷰와 셀에 들어가는 UI 요소들에는 적용을 해야하지만, `contentView`에 skeleton을 적용할 필요는 없습니다.

####  UICollectionView

 ```UICollectionView``` 에 적용을 하기 위해서는, ```SkeletonCollectionViewDataSource``` protocol 을 구현할 필요가 있습니다.

``` swift
public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int  // default: 1
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewIdentifierOfKind: String, at indexPath: IndexPath) -> ReusableCellIdentifier? // default: nil
    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?  // default: nil
    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareCellForSkeleton cell: UICollectionViewCell, at indexPath: IndexPath)
    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareViewForSkeleton view: UICollectionReusableView, at indexPath: IndexPath)
}
```

사용방법은 ```UITableView``` 와 같습니다.

### 🔠 Text


![](../Assets/multilines2.png)

텍스트가 들어있는 요소를 사용한다면, ```SkeletonView``` 에서 텍스트의 라인을 그려줍니다.

| 프로퍼티 | 타입 | 기본값 | Preview
| ------- | ------- |------- | -------
| **lastLineFillPercent**  | `CGFloat` | `70`| ![](../Assets/multiline_lastline.png)
| **linesCornerRadius**  | `Int` | `0` | ![](../`Assets/multiline_corner.png)
| **skeletonLineSpacing**  | `CGFloat` | `10` | ![](../Assets/multiline_lineSpacing.png)
| **skeletonPaddingInsets**  | `UIEdgeInsets` | `.zero` | ![](../Assets/multiline_insets.png)
| **skeletonTextLineHeight**  | `SkeletonTextLineHeight` | `.fixed(15)` | ![](../Assets/multiline_lineHeight.png)
| **skeletonTextNumberOfLines**  | `SkeletonTextNumberOfLines` | `.inherited` | ![](../Assets/multiline_corner.png)

코드를 통해 radius의 비율을 조절하고 싶다면, 프로퍼티를 설정하세요.

``` swift
descriptionTextView.lastLineFillPercent = 50
descriptionTextView.linesCornerRadius = 5
```

**IB/Storyboard**를 사용한다면 그림과 같습니다.

![](../Assets/multiline_customize.png)

<br />

**어떻게 원하는 라인 수를 설정할까요?**

기본적으로 라인 수는 `numberofLines` 프로퍼티 값과 동일합니다. 그리고, 원하는 라인 수를 설정할 수 있습니다. 만약   `numberOfLines` 을 0으로 설정한다면, 자동으로 필요한 라인수를 계산해서 그려줍니다.  

만약 특정 라인 수로 설정하고 싶다면 `skeletonTextNumberOfLines`를 설정합니다. 이 프로퍼티는 2개의 값을 가집니다. `inherited`는 `numberOfLine` 값을 리턴합니다. `custom(Int)`는 연관 값(associated value)으로 특정 라인 수를 리턴합니다.

예를 들어

``` swift
label.skeletonTextNumberOfLines = 3   // .custom(3)
```

<br />

> **⚠️ 사라짐 주의!**
>
> **useFontLineHeight** 는 더 이상 사용되지 않습니다. 대신 **skeletonTextLineHeight**를 사용합니다.:
> ```swift
> descriptionTextView.skeletonTextLineHeight = .relativeToFont
> ```

> **📣 중요!**
>
> 여러 줄이 아닌 View의 경우 , 하나의 줄이 마지막 줄로 간주됩니다.

### 🦋 Appearance

skeletons은 기본 appearance(=외형)을 가집니다. 색, 그라디언트, 줄 옵션을 설정하지 않으면, 기본값을 사용합니다.

기본 값:
- **tintColor**: `UIColor`
    - *default: `.skeletonDefault` (`.clouds`와 동일하지만, 다크모드에도 적용됩니다.)*
- **gradient**: SkeletonGradient
  - *default: `SkeletonGradient(baseColor: .skeletonDefault)`*
- **multilineHeight**: `CGFloat`
  - *default: 15*
- **multilineSpacing**: `CGFloat`
  - *default: 10*
- **multilineLastLineFillPercent**: `Int`
  - *default: 70*
- **multilineCornerRadius**: `Int`
  - *default: 0*
- **skeletonCornerRadius**: `CGFloat` (IBInspectable)  (스켈레톤 view 모서리를 둥글게 만들어보세요)
  - *default: 0*

`SkeletonAppearance.default`를 사용해 이 기본 값들을 얻을 수 있습니다. 이 프로퍼티에 값을 할당해서 사용할 수 있습니다.

``` swift
SkeletonAppearance.default.multilineHeight = 20
SkeletonAppearance.default.tintColor = .green
```

> **⚠️ 사라짐 주의!**
>
> **useFontLineHeight** 는 더 이상 사용되지 않습니다. 대신 **textLineHeight**를 사용합니다.:
> ```swift
> SkeletonAppearance.default.textLineHeight = .relativeToFont
> ```

### 🎨 Custom colors

skeleton의 색상을 지정 할 수 있습니다. 단지 원하는 색상을 파라미터로 넘겨주시면 됩니다.

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

### 🏃‍♀️ Animations

```SkeletonView``` 에는 두 가지 애니메이션이 내장되어 있습니다, 단색 *바운스* 애니메이션과  그라디언트 *슬라이드* 애니메이션 입니다 .

직접 애니메이션을 추가하고 싶다면 정말 간단합니다.

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

```GradientDirection``` 는 enum 으로 정의 되어있습니다. 아래의 케이스를 참조하세요:

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

### 🏄 Transitions

**SkeletonView** 에는 부드럽게 **show** 하거나 **hide** 하는 transition이 내장되어 있습니다. 

Transition을 사용하기 위해, ```showSkeleton()```나 ```hideSkeleton()``` 함수에 ```transition```파라미터를 추가하면 됩니다.  

```swift
view.showSkeleton(transition: .crossDissolve(0.25))     //Show skeleton cross dissolve transition with 0.25 seconds fade time
view.hideSkeleton(transition: .crossDissolve(0.25))     //Hide skeleton cross dissolve transition with 0.25 seconds fade time

```

기본 값은  `crossDissolve(0.25)` 입니다.

**Preview**

<table>
<tr>
<td width="50%">
<center>None</center>
</td>
<td width="50%">
<center>Cross dissolve</center>
</td>
</tr>
<tr>
<td width="50%">
<img src="../Assets/skeleton_transition_nofade.gif"></img>
</td>
<td width="50%">
<img src="../Assets/skeleton_transition_fade.gif"></img>
</td>
</tr>
</table>


## ✨ 기타

**Hierarchy**

```SkeletonView```는 재귀적입니다 , 그리고 우리는 skeleton이 효율적으로 작동하기를 원하기 때문에, 가능한 빨리 재귀작업을 중단하기를 원합니다. 이러한 이유에서, 반드시 컨테이너 뷰를  `Skeletonable` 로 설정해야 합니다.  `skeletonable` 되지 않는 뷰를 만나는 순간 재귀 작업을 중단하기 떄문입니다.

아래의 이미지를 참고하세요 이미지는 한눈에 이해되실겁니다:

> ```ìsSkeletonable```= ☠️

| Configuration | Result|
|:-------:|:-------:|
|<img src="../Assets/no_skeletonable.jpg" width="350"/> | <img src="../Assets/no_skeletonables_result.png" width="350"/>|
|<img src="../Assets/container_no_skeletonable.jpg" width="350"/> | <img src="../Assets/no_skeletonables_result.png" width="350"/>|
|<img src="../Assets/container_skeletonable.jpg" width="350"/> | <img src="../Assets/container_skeletonable_result.png" width="350"/>|
|<img src="../Assets/all_skeletonables.jpg" width="350"/>| <img src="../Assets/all_skeletonables_result.png" width="350"/>|
|<img src="../Assets/tableview_no_skeletonable.jpg" width="350"/> | <img src="../Assets/tableview_no_skeletonable_result.png" height="350"/>|
|<img src="../Assets/tableview_skeletonable.jpg" width="350"/> | <img src="../Assets/tableview_skeletonable_result.png" height="350"/>|


**Skeleton views layout**  

부모 뷰 bounds가 바뀜에 따라 skeleton layout이 view의 layout과 잘 안 맞을 수 있습니다.  
이런 경우 relayout을 할 수 있습니다.  

```swift
override func viewDidLayoutSubviews() {
    view.layoutSkeletonIfNeeded()
}
```

> 📣 **중요!** 
> 
> 이 메소드를 호출하면 안 됩니다. 1.8.1 버전부터 라이브러리가 자동으로 호출합니다. **수동으로 skeleton layout을 업데이트할 때**만 메소드를 호출해야 합니다.


**Update Skeleton**    

skeleton 색, 애니메이션을 언제든지 바꿀 수 있습니다. 아래 메소드를 사용하세요.  

```swift
(1) view.updateSkeleton()                 // Solid
(2) view.updateGradientSkeleton()         // Gradient
(3) view.updateAnimatedSkeleton()         // Solid animated
(4) view.updateAnimatedGradientSkeleton() // Gradient animated
```

**애니메이션 시작시 view 숨기기**    

애니메이션이 시작될 때 view를 숨기고 싶은 경우가 있습니다. 이럴 때 쉽게 사용할 수 있는 프로퍼티가 있습니다.

```swift
view.isHiddenWhenSkeletonIsActive = true  // This works only when isSkeletonable = true
```

**skeleton이 동작 중일 때 user interaction을 수정하지 마세요**    

기본적으로, skeleton된 아이템들에 대해 user interacion이 비활성화 돼있습니다. skeleton이 동작 중일 때도 user interaction이 가능하게 하고 싶다면 `isUserInteractionDisabledWhenSkeletonIsActive ` 프로퍼티를 설정해주세요.

```swift
view.isUserInteractionDisabledWhenSkeletonIsActive = false  // The view will be active when the skeleton will be active.
```

**label에서 skeleton 라인 설정을 위해 font line height을 사용하지 마세요**  

skeleton이 `UILabel`과 `UITextView`의 font height에 자동 조절되는 것을 비활성화 할 수 있습니다. 기본적으로 skeleton line height은 text를 더 정확하게 반영하기 위해 font height에 자동 조절됩니다. bounding box를 사용하는 것보다 낫기 때문입니다.

```swift
label.useFontLineHeight = false
```

**skeleton 지연해서 보여주기**  
view가 빨리 업데이트 되는 경우에 skeleton이 나타나는 것을 지연시킬 수 있습니다.  

```swift
func showSkeleton(usingColor: UIColor,
                  animated: Bool,
                  delay: TimeInterval,
                  transition: SkeletonTransitionStyle)
```  

```swift
func showGradientSkeleton(usingGradient: SkeletonGradient,
                          animated: Bool,
                          delay: TimeInterval,
                          transition: SkeletonTransitionStyle)
```

**디버그**

어떤 것들이 잘 동작 하지 않을 때, 디버그 작업을 용이하게 하기 위해서  `SkeletonView` 에는 몇가지 새로운 것들이 있습니다.

첫 번째로, `UIView` 에서 skeleton 정보를 보기위해 다음과 같이 지원하고 있습니다:
```swift
var skeletonDescription: String
```

그리고, 새로운 **디버그 모드**를 활성화 시킬 수 있습니다. 간단하게 `SKELETON_DEBUG` 이라는 환경 변수를 추가해 활성화 하면 됩니다.

![](../Assets/debug_mode.png)

그런 이후 skeleton이 나오면 Xcode 콘솔창에서 계층 구조를 볼 수 있습니다.

```
{ 
  "type" : "UIView", // UITableView, UILabel...
  "isSkeletonable" : true,
  "reference" : "0x000000014751ce30",
  "children" : [
    {
      "type" : "UIView",
      "isSkeletonable" : true,
      "children" : [ ... ],
      "reference" : "0x000000014751cfa0"
    }
  ]
}
```

**📋 지원 가능한 OS & SDK 버전**

* iOS 9.0+
* tvOS 9.0+
* Swift 5.3

## ❤️ 기여하기
이 프로젝트는 오픈소스 프로젝트 입니다, 마음편하게 기여해주시면 됩니다 어떻게 하냐구요?
- 새로운 [이슈](https://github.com/Juanpe/SkeletonView/issues/new)를 등록합니다.
- [email](mailto://juanpecatalan.com)을 보냅니다.
- 당신의 수정을 제안합니다, pull request를 포함한 수정을 권장합니다.

전체 [기여자목록](https://github.com/Juanpe/SkeletonView/graphs/contributors)

자세한 정보는, [contributing guidelines](https://github.com/Juanpe/SkeletonView/blob/main/CONTRIBUTING.md) 를 확인하세요.

## 📢 소식

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
- [Best iOS articles, new tools & more](https://medium.com/flawless-app-stories/best-ios-articles-new-tools-more-fcbe673e10d)

## 🏆 스폰서

오픈 소스 프로젝트는 여러분의 도움없이 지속되지 않습니다. SkeletonView를 잘 사용하셨다면, 스폰서가 되어 보는 것은 어떠신가요?  

링크를 확인해주세요. [GitHub Sponsors](https://github.com/sponsors/Juanpe) :heart:  


## 👨🏻‍💻 개발자 

[Juanpe Catalán](http://www.twitter.com/JuanpeCatalan)

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
