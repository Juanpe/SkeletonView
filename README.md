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

🌎  Translations: </br>
[🇨🇳](https://github.com/Juanpe/SkeletonView/blob/master/README_zh.md) by [@WhatsXie](https://twitter.com/WhatsXie) </br>
[🇧🇷](https://github.com/Juanpe/SkeletonView/blob/master/README_pt-br.md) by [@brunomunizaf](https://twitter.com/brunomuniz_af)

Today almost all apps have async processes, such as Api requests, long running processes, etc. And while the processes are working, usually developers place a loading view to show users that something is going on.

```SkeletonView``` has been conceived to address this need, an elegant way to show users that something is happening and also prepare them to which contents he is waiting.

Enjoy it! 🙂

* [Features](#-features)
* [Guides](#-guides)
* [Installation](#-installation)
  * [Cocoapods](#using-cocoapods)
  * [Carthage](#using-carthage)
  * [SPM](#using-swift-package-manager)
* [How to use](#-how-to-use)
  * [Collections](#-collections)
  * [Multiline text](#-multiline-text)
  * [Custom colors](#-custom-colors)
  * [Appearance](#-appearance)
  * [Custom animations](#-custom-animations)
  * [Hierarchy](#-hierarchy)
  * [Debug](#-debug)
* [Documentation](#-documentation)
* [Supported OS & SDK Versions](#-supported-os--sdk-versions)
* [Next steps](#-next-steps)
* [Contributing](#-contributing)
* [Mentions](#-mentions)
* [Author](#-author)
* [License](#-license)


## 🌟 Features

- [x] Easy to use
- [x] All UIViews are skeletonables
- [x] Fully customizable
- [x] Universal (iPhone & iPad)
- [x] Interface Builder friendly
- [x] Simple Swift syntax
- [x] Lightweight readable codebase

## 🎬 Guides

 [<img src="Assets/thumb_getting_started.png">](https://youtu.be/75kgOhWsPNA)

## 📲 Installation

#### Using [CocoaPods](https://cocoapods.org)

Edit your `Podfile` and specify the dependency:

```ruby
pod "SkeletonView"
```

#### Using [Carthage](https://github.com/carthage)

Edit your `Cartfile` and specify the dependency:

```bash
github "Juanpe/SkeletonView"
```

#### Using [Swift Package Manager](https://github.com/apple/swift-package-manager)

Once you have your Swift package set up, adding `SkeletonView` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
  dependencies: [
    .package(url: "https://github.com/Juanpe/SkeletonView.git", from: "1.6")
  ]
```



## 🐒 How to use

Only **3** steps needed to use `SkeletonView`:

**1.** Import SkeletonView in proper place.
```swift
import SkeletonView
```

**2.** Now, set which views will be `skeletonables`. You achieve this in two ways:

**Using code:**
```swift
avatarImageView.isSkeletonable = true
```
**Using IB/Storyboards:**

![](Assets/storyboard.png)

**3.** Once you've set the views, you can show the **skeleton**. To do so, you have **4** choices:

```swift
(1) view.showSkeleton()                 // Solid
(2) view.showGradientSkeleton()         // Gradient
(3) view.showAnimatedSkeleton()         // Solid animated
(4) view.showAnimatedGradientSkeleton() // Gradient animated
```

**Preview**

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

> **IMPORTANT!**
>>```SkeletonView``` is recursive, so if you want show the skeleton in all skeletonable views, you only need to call the show method in the main container view. For example, with UIViewControllers

### 🌿 Collections

 Now, ```SkeletonView``` is compatible with ```UITableView``` and ```UICollectionView```.

#### UITableView

If you want to show the skeleton in a ```UITableView```, you need to conform to ```SkeletonTableViewDataSource``` protocol.

``` swift
public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```
As you can see, this protocol inherits from ```UITableViewDataSource```, so you can replace this protocol with the skeleton protocol.

This protocol has a default implementation:

``` swift
func numSections(in collectionSkeletonView: UITableView) -> Int
// Default: 1
```

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
// Default:
// It calculates how many cells need to populate whole tableview
```

There is only one method you need to implement to let Skeleton know the cell identifier. This method doesn't have default implementation:
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
 ```

**Example**
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return "CellIdentifier"
}
 ```

> **IMPORTANT!**
> If you are using resizable cells (`tableView.rowHeight = UITableViewAutomaticDimension` ), it's mandatory define the `estimatedRowHeight`.

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

## 📬 Next steps

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

## ❤️ Contributing
This is an open source project, so feel free to contribute. How?
- Open an [issue](https://github.com/Juanpe/SkeletonView/issues/new).
- Send feedback via [email](mailto://juanpecatalan.com).
- Propose your own fixes, suggestions and open a pull request with the changes.

See [all contributors](https://github.com/Juanpe/SkeletonView/graphs/contributors)

###### Project generated with [SwiftPlate](https://github.com/JohnSundell/SwiftPlate)

## 📢 Mentions

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



## 👨🏻‍💻 Author
[1.1]: http://i.imgur.com/tXSoThF.png
[1]: http://www.twitter.com/JuanpeCatalan

* Juanpe Catalán [![alt text][1.1]][1]

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/CDou4xtIK"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"><span style="margin-left:5px"></span></a>

## 👮🏻 License

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
