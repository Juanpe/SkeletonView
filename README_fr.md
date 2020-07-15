![](Assets/header2.jpg)

<p align="center">
    <a href="https://github.com/Juanpe/SkeletonView/workflows/build">
      <img src="https://github.com/Juanpe/SkeletonView/workflows/build/badge.svg">
    </a>
    <a href="https://codebeat.co/projects/github-com-juanpe-skeletonview-master"><img alt="codebeat badge" src="https://codebeat.co/badges/f854fdfd-31e5-4689-ba04-075d83653e60" /></a>
    <a href="https://github.com/Juanpe/SkeletonView">
        <img src="https://img.shields.io/cocoapods/p/SkeletonView.svg" alt="Plates-formes">
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
    <a href="https://gitter.im/SkeletonView/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge">
        <img src="https://badges.gitter.im/SkeletonView/community.svg?style=flat" />
    </a>
    <a href="https://twitter.com/intent/tweet?text=Wow%20This%20library%20is%20awesome:&url=https%3A%2F%2Fgithub.com%2FJuanpe%2FSkeletonView">
      <img src="https://img.shields.io/twitter/url/https/github.com/Juanpe/SkeletonView.svg?style=social" alt="Licence" />
    </a>
</p>


🌎 Traductions : </br>
[🇨🇳](https://github.com/Juanpe/SkeletonView/blob/master/README_zh.md) par [@WhatsXie](https://twitter.com/WhatsXie) </br>
[🇧🇷](https://github.com/Juanpe/SkeletonView/blob/master/README_pt-br.md) par [@brunomunizaf](https://twitter.com/brunomuniz_af) </br>
[🇰🇷](https://github.com/Juanpe/SkeletonView/blob/master/README_ko.md) par [@techinpark](https://twitter.com/techinpark)

Aujourd'hui, presque toutes les applications ont des processus asynchrones, tels que les requêtes Api, les processus de longue durée, etc. Et pendant que les processus fonctionnent, les développeurs affichent généralement une vue de chargement pour montrer aux utilisateurs que quelque chose se passe.

"SkeletonView" a été créé pour répondre à ce besoin, une manière élégante de montrer aux utilisateurs que quelque chose se passe et aussi de les préparer aux contenus qu'ils attendent.

Profitez-en! 🙂

* [Caractéristiques](#-caractéristiques)
* [Guides](#-guides)
* [Installation](#-installation)
  * [Cocoapods] (#utilisation-de-cocoapods)
  * [Carthage](#utilisation-de-carthage)
  * [SPM](#using-swift-package-manager)
* [Comment utiliser](#comment-utiliser)
  * [Collections](#-collections)
  * [Texte Multiligne](#-multiline-texte)
  * [Couleurs personnalisées] (#couleurs-personnalisées)
  * [Apparition](#apparition)
  * [Animations personnalisées](#-custom-animations)
  * [Transitions](#-transitions)
  * [Hiérarchie](#-hiérarchie)
  * [Debug](#-debug)
* [Documentation](#-documentation)
* [Versions OS & SDK supportées] (#-supportedos--sdk-versions)
* [Prochaines étapes](#prochaines-étapes)
* [Contribuant](#-contribuant)
* [Mentions](#-mentions)
* [Auteur](#-autor)
* [Licence](#-licence)

## 🌟 Caractéristiques

- [x] Facile à utiliser
- [x] Tous les UIViews sont squelettisables
- [x] Entièrement personnalisable
- [x] Universel (iPhone et iPad)
- [x] Interface Builder friendly
- [x] Syntaxe Swift simple
- [x] Base de code légère et lisible

## 🎬 Guides

 [<img src="Assets/thumb_getting_started.png">](https://youtu.be/75kgOhWsPNA)

## 📲 Installation

#### Utilisation de [CocoaPods](https://cocoapods.org)

Editez votre "podfile" et spécifiez la dépendance:

```ruby
pod "SkeletonView"
```

#### Utilisation de [Carthage] (https://github.com/carthage)

Modifiez votre "Cartfile" et spécifiez la dépendance:

```bash
github "Juanpe/SkeletonView"
```

#### Utilisation du [gestionnaire de paquets Swift] (https://github.com/apple/swift-package-manager)

Une fois que vous avez configuré votre paquet Swift, ajouter `SkeletonView` comme dépendance est aussi facile que de l'ajouter à la valeur des `dépendances` de votre `Package.swift`.

```swift
  dependencies: [
    .package(url: "https://github.com/Juanpe/SkeletonView.git", from: "1.7.0")
  ]
```

## 🐒 Mode d'emploi

Seulement **3** étapes nécessaires pour utiliser `SkeletonView` :

**1.** Importer SkeletonView au bon endroit.
```swift
import SkeletonView
```

**2.** Maintenant, définissez les vues qui seront `squelettisables`. Vous y arrivez de deux façons :

**En utilisant du code:**
```swift
avatarImageView.isSkeletonable = true
```
**Utilisation des IB/Storyboards:**

![](Assets/storyboard.png)

**Une fois que vous avez défini les vues, vous pouvez montrer le **squelette**. Pour le faire, vous avez quatre choix :

```swift
(1) view.showSkeleton() // Solide
(2) view.showGradientSkeleton() // Gradient
(3) view.showAnimatedSkeleton() // Solide animé
(4) view.showAnimatedGradientSkeleton() // Gradient animé
```

**Preview**

<table>
<tr>
<td width="25%">
<center>Solide</center>
</td>
<td width="25%">
<center>Gradient</center>
</td>
<td width="25%">
<center>Animé Solide</center>
</td>
<td width="25%">
<center>Animé Gradient</center>
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
>>```SkeletonView``` est récursif, donc si vous voulez montrer le squelette dans toutes les vues squelettables, il vous suffit d'appeler la méthode `show` dans la vue principale du conteneur. Par exemple, avec UIViewControllers

### Extra

#### Mise en page des vues squelettes

Il arrive que le squelette ne corresponde pas à votre mise en page parce que les limites de la vue parent ont changé. ~Par exemple, la rotation de l'appareil.~

Vous pouvez relayer les vues du squelette de cette manière :

```swift
override func viewDidLayoutSubviews() {
    view.layoutSkeletonIfNeeded()
}
```

⚠️⚠️ Vous ne devriez pas appeler cette méthode. À partir de la *version 1.8.1*, vous n'avez pas besoin d'appeler cette méthode, la bibliothèque le fait automatiquement. Vous pouvez donc utiliser cette méthode *seulement* dans les cas où vous devez mettre à jour manuellement la présentation du squelette.

#### Mise à jour de la configuration du squelette

Vous pouvez modifier la configuration du squelette à tout moment comme sa couleur, son animation, etc :

```swift
(1) view.updateSkeleton() // Solide
(2) view.updateGradientSkeleton() // Gradient
(3) view.updateAnimatedSkeleton() // Solid animated
(4) view.updateAnimatedGradientSkeleton() // Gradient animé
```

### 🌿 Collections

 Maintenant, `SkeletonView` est compatible avec `UITableView` et `UICollectionView`.

#### UITableView

Si vous voulez montrer le squelette dans un `UITableView`, vous devez vous conformer au protocole `SkeletonTableViewDataSource`.

``` swift
public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForHeaderInSection section: Int) -> ReusableHeaderFooterIdentifier?
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForFooterInSection section: Int) -> ReusableHeaderFooterIdentifier?
}
```

Comme vous pouvez le voir, ce protocole hérite de `UITableViewDataSource`, vous pouvez donc remplacer ce protocole par le protocole squelette.

Ce protocole a une implémentation par défaut:

``` swift
func numSections(in collectionSkeletonView: UITableView) -> Int
// Par défaut: 1
```

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
// Par défaut:
// Il calcule le nombre de cellules nécessaires pour remplir l'ensemble du tableau
```

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, identifierForHeaderInSection section: Int) -> ReusableHeaderFooterIdentifier?
// Par défaut: nil
```

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, identifierForFooterInSection section: Int) -> ReusableHeaderFooterIdentifier?
// Par défaut: nil
```

Il n'y a qu'une seule méthode à mettre en œuvre pour faire connaître au Squelette l'identifiant de la cellule. Cette méthode n'a pas d'implémentation par défaut :
``` swift
 func collectionSkeletonView(_ skeletonView : UITableView, cellIdentifierForRowAt indexPath : IndexPath) -> ReusableCellIdentifier
```

**Exemple**
``` swift
 func collectionSkeletonView(_ skeletonView : UITableView, cellIdentifierForRowAt indexPath : IndexPath) -> ReusableCellIdentifier {
    return "CellIdentifier".
}
 ```

> **IMPORTANT!**
> Si vous utilisez des cellules redimensionnables (`tableView.rowHeight = UITableViewAutomaticDimension` ), il est obligatoire de définir la `estimatedRowHeight`.

👩🏼 **Comment préciser quels éléments sont squelettisables ?

Voici une illustration qui montre comment vous devez spécifier quels éléments sont squelettisables lorsque vous utilisez une `UITableView` :

![](Assets/tableview_scheme.png)

Comme vous pouvez le voir, nous devons faire `skeletonable` la tableview, la cellule et les éléments de l'interface visuelle, mais nous n'avons pas besoin de faire `skeletonable` le `contentView`.

#### UICollectionView

Pour ```UICollectionView```, vous devez conformer le protocole `SkeletonCollectionViewDataSource`.

``` swift
public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
}
```

Le reste du processus ressemble à une `UITableView`.

### 📰 Texte multiligne

![](Assets/multilines2.png)

Lorsqu'on utilise des éléments avec du texte, `SkeletonView` dessine des lignes pour simuler le texte.
En outre, vous pouvez décider combien de lignes vous voulez. Si `numberOfLines` est réglé à zéro, il calculera le combien de lignes sont nécessaires pour remplir tout le squelette et il sera dessiné. Au contraire, si vous le réglez sur un, deux ou tout autre nombre supérieur à zéro, il ne dessinera que ce nombre de lignes.

##### 🎛 Personnaliser

Vous pouvez définir certaines propriétés pour les éléments multilignes.

| Propriété | Valeurs | Par défaut | Aperçu
| ------- | ------- |------- | -------
| **Pourcentage de remplissage** de la dernière ligne. | `0...100` | `70%` | ![](Assets/multiline_lastline.png)
| **Corner radius** des lignes. (**NEW**) | `0...10` | `0` | ![](Assets/multiline_corner.png)


Pour modifier le pourcentage ou le rayon **à l'aide du code**, définissez les propriétés :
``` swift
descriptionTextView.lastLineFillPercent = 50
descriptionTextView.linesCornerRadius = 5
```

Ou, si vous préférez, utilisez l'**IB/Storyboard** :

![](Assets/multiline_customize.png)

### 🎨 Couleurs personnalisées

Vous pouvez décider la couleur du squelette. Il vous suffit de passer comme paramètre la couleur ou le gradient que vous souhaitez.

**Utiliser des couleurs solides**
``` swift
view.showSkeleton(usingColor : UIColor.gray) // Solide
// ou
view.showSkeleton(usingColor : UIColor(red : 25.0, green : 30.0, blue : 255.0, alpha : 1.0))
```
**Utilisation des gradients**
``` swift
let gradient = SkeletonGradient(baseColor : UIColor.midnightBlue)
view.showGradientSkeleton(usingGradient : gradient) // Gradient
```

En outre, `SkeletonView` dispose de 20 couleurs unies 🤙🏼

`UIColor.turquoise, UIColor.greenSea, UIColor.sunFlower, UIColor.flatOrange ...`

![](Assets/flatcolors.png)
###### Image tirée du site web [https://flatuicolors.com](https://flatuicolors.com)

### 🦋 Présentation

**NOUVEAU** Les squelettes ont une apparence par défaut. Ainsi, lorsque vous ne spécifiez pas la couleur, le gradient ou les propriétés multilignes, `SkeletonView` utilise les valeurs par défaut.

Valeurs par défaut :
- **tintColor** : UIColor
    - *défaut : `.skeletonDefault` (comme `.clouds` mais adaptable au thème sombre)*
- **gradient** : SkeletonGradient
  - *défaut : `SkeletonGradient(baseColor : .skeletonDefault)`*
- **multilineHeight** : CGFloat
  - *défaut : 15*
- **multilineSpacing** : CGFloat
  - *défaut : 10*
- **multilineLastLineFillPercent** : Int
  - *défaut : 70*
- **multilineCornerRadius** : Int
  - *défaut : 0*
- **skeletonCornerRadius** : CGFloat (IBInspectable) (Faites votre vue squelette avec des coins)
  - *défaut : 0*

Pour obtenir ces valeurs par défaut, vous pouvez utiliser `SkeletonAppearance.default`. En utilisant cette propriété, vous pouvez également définir les valeurs :
``` swift
SkeletonAppearance.default.multilineHeight = 20
SkeletonAppearance.default.tintColor = .green
```

### 🤓 Animations personnalisées

`SkeletonView` a deux animations intégrées, *pulse* pour les squelettes solides et *sliding* pour les gradients.

De plus, si vous voulez faire votre propre animation de squelette, c'est très facile.

Skeleton fournit la fonction `showAnimatedSkeleton` qui possède une fermeture `SkeletonLayerAnimation` où vous pouvez définir votre animation personnalisée.

``` swift
public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation
```

Vous pouvez appeler la fonction comme ceci :

```swift
view.showAnimatedSkeleton { (layer) -> CAAnimation in
  let animation = CAAnimation()
  // Personnalisez ici votre animation

  return animation
}
```

`SkeletonAnimationBuilder` est disponible. C'est un constructeur pour faire `SkeletonLayerAnimation`.

Aujourd'hui, vous pouvez créer des **animations glissantes** pour les gradients, en décidant de la **direction** et en fixant la **durée** de l'animation (par défaut = 1,5s).

```swift
// func makeSlidingAnimation(withDirection direction : GradientDirection, duration : CFTimeInterval = 1.5) -> SkeletonLayerAnimation

let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection : .leftToRight)
view.showAnimatedGradientSkeleton(usingGradient : gradient, animation : animation)

```

`GradientDirection` est une `enum`, avec ces cas :

| Direction | Aperçu
|------- | -------
| .leftRight | ![](Assets/sliding_left_to_right.gif)
| .rightLeft | ![](Assets/sliding_right_to_left.gif)
| .topBottom | ![](Assets/sliding_top_to_bottom.gif)
| .bottomTop | ![](Assets/sliding_bottom_to_top.gif)
| .topLeftBottomRight | ![](Assets/sliding_topLeft_to_bottomRight.gif)
| .bottomRightTopLeft | ![](Assets/sliding_bottomRight_to_topLeft.gif)

> **😉 TRICK!**
Il existe une autre façon de créer des animations de glissement, en utilisant simplement ce raccourci :
>>```let animation = GradientDirection.leftToRight.slidingAnimation()```

### 🏄 Transitions

`SkeletonView` a des transitions intégrées pour **montrer** ou **cacher** les squelettes d'une manière *lisse* 🤙

Pour utiliser la transition, il suffit d'ajouter le paramètre "transition" à votre fonction `showSkeleton()` ou `hideSkeleton()` avec le temps de transition, comme ceci :

```swift
view.showSkeleton(transition : .crossDissolve(0.25))     //Montrer la transition de dissolution croisée du squelette avec un temps de fondu de 0,25 seconde
view.hideSkeleton(transition : .crossDissolve(0.25))     //Cachez la transition de dissolution croisée du squelette avec un temps de fondu de 0,25 seconde
```

La valeur par défaut est `crossDissolve(0.25)`.

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
<img src="Assets/skeleton_transition_nofade.gif"></img>
</td>
<td width="50%">
<img src="Assets/skeleton_transition_fade.gif"></img>
</td>
</tr>
</table>

### 👨👧👦 Hiérarchie

Puisque `SkeletonView` est récursif, et que nous voulons que le squelette soit très efficace, nous voulons arrêter la récursivité dès que possible. Pour cette raison, vous devez définir la vue du conteneur comme `Skeletonable`, parce que Skeleton arrêtera de chercher des sous-vues `squelettisables` dès qu'une vue n'est pas `Skeletonable`, cassant alors la récursivité.

Parce qu'une image vaut mille mots :

Dans cet exemple, nous avons un `UIViewController` avec une `ContainerView` et une `UITableView`. Lorsque la vue est prête, nous montrons le squelette en utilisant cette méthode :
```
view.showSkeleton()
```

> ```isSkeletonable```= ☠️

| Configuration | Résultat|
|:-------:|:-------:|
|<img src="Assets/no_skeletonable.jpg" width="350"/> | <img src="Assets/no_skeletonables_result.png" width="350"/>|
|<img src="Assets/container_no_skeletonable.jpg" width="350"/> | <img src="Assets/no_skeletonables_result.png" width="350"/>|
|<img src="Assets/container_skeletonable.jpg" width="350"/> | <img src="Assets/container_skeletonable_result.png" width="350"/>|
|<img src="Assets/all_skeletonables.jpg" width="350"/>| <img src="Assets/all_skeletonables_result.png" width="350"/>|
|<img src="Assets/tableview_no_skeletonable.jpg" width="350"/> | <img src="Assets/tableview_no_skeletonable_result.png" height="350"/>|
|<img src="Assets/tableview_skeletonable.jpg" width="350"/> | <img src="Assets/tableview_skeletonable_result.png" height="350"/>|

### 🔬 Débugger

**NOUVEAU** Afin de faciliter les tâches de debuggage lorsque quelque chose ne fonctionne pas bien. `SkeletonView` a de nouveaux outils.

Tout d'abord, `UIView` a une nouvelle propriété disponible avec son squelette d'information :
```swift
var skeletonDescription : String
```
La représentation du squelette ressemble à ceci :

![](Assets/debug_description.png)

En outre, vous pouvez activer le nouveau mode **debug**. Il suffit d'ajouter la variable d'environnement `SKELETON_DEBUG` et de l'activer.

![](Assets/debug_mode.png)

Ensuite, lorsque le squelette apparaît, vous pouvez voir la hiérarchie des vues dans la console Xcode.

<details>
<summary>Ouvrez pour voir un exemple de sortie</summary>
<img src="Assets/hierarchy_output.png" />
</details>

### 📚 Documentation
Bientôt disponible...😅

### 📋 Versions OS et SDK supportées

* iOS 9.0+
* tvOS 9.0+
* Swift 5

## 📬  Prochaines étapes

* [x] Fixer le pourcentage de remplissage de la dernière ligne dans les éléments multilignes
* [x] Ajout d'autres animations en dégradé
* [x] Cellules redimensionnables prises en charge
* [x] Compatible avec CollectionView
* [x] Compatible avec tvOS
* [x] Ajouter l'état de recouvrement
* [x] Apparence personnalisée par défaut
* [x] Mode de debuggage
* [x] Ajouter des animations lorsqu'il montre/cache les squelettes
* [ ] Compatible avec les collections personnalisées
* [ ] Compatible avec MacOS et WatchOS

## ❤️  Contribuer
Il s'agit d'un projet open source, alors n'hésitez pas à y contribuer. Comment ?
- Ouvrez un [numéro] (https://github.com/Juanpe/SkeletonView/issues/new).
- Envoyez vos commentaires via [email](mailto://juanpecatalan.com).
- Proposez vos propres correctifs, suggestions et ouvrez une `pull request` avec les changements.

Voir [tous les contributeurs](https://github.com/Juanpe/SkeletonView/graphs/contributors)

###### Projet généré avec [SwiftPlate] (https://github.com/JohnSundell/SwiftPlate)

## 📢 Mentions

- [iOS Dev Weekly #327](https://iosdevweekly.com/issues/327#start)
- [Hacking with Swift Articles] (https://www.hackingwithswift.com/articles/40/skeletonview-makes-loading-content-beautiful)
- [Top 10 articles Swift de novembre] (https://medium.mybridge.co/swift-top-10-articles-for-the-past-month-v-nov-2017-dfed7861cd65)
- [30 bibliothèques incroyables pour iOS Swift (v2018)](https://medium.mybridge.co/30-amazing-ios-swift-libraries-for-the-past-year-v-2018-7cf15027eee9)
- [AppCoda Weekly #44](http://digest.appcoda.com/issues/appcoda-weekly-issue-44-81899)
- [iOS Cookies Newsletter #103](https://us11.campaign-archive.com/?u=cd1f3ed33c6527331d82107ba&id=48131a516d)
- [Bulletin d'information sur les développements Swift #113](https://andybargh.com/swiftdevelopments-113/)
- [iOS Goodies #204](http://ios-goodies.com/post/167557280951/week-204)
- [Swift Weekly #96](http://digest.swiftweekly.com/issues/swift-weekly-issue-96-81759)
- [CocoaControls](https://www.cocoacontrols.com/controls/skeletonview)
- [Bulletin d'information Génial iOS #74](https://ios.libhunt.com/newsletter/74)
- [Swift News #36](https://www.youtube.com/watch?v=mAGpsQiy6so)
- [Meilleurs articles sur iOS, nouveaux outils et plus](https://medium.com/flawless-app-stories/best-ios-articles-new-tools-more-fcbe673e10d)

## 👨🏻 Auteur
[1.1] : http://i.imgur.com/tXSoThF.png
[1] : http://www.twitter.com/JuanpeCatalan

* Juanpe Catalán [![alt text][1.1]][1]

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/CDou4xtIK"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"><span style="margin-left:5px"></span></a>

## 👮🏻 Licence

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



