![](../Assets/header2.jpg)

<p align="center">
    <a href="https://github.com/Juanpe/SkeletonView/actions?query=workflow%3ACI">
      <img src="https://github.com/Juanpe/SkeletonView/workflows/CI/badge.svg">
    </a>
    <a href="https://codebeat.co/projects/github-com-juanpe-skeletonview-main"><img alt="codebeat badge" src="https://codebeat.co/badges/1f37bbab-a1c8-4a4a-94d7-f21740d461e9" /></a>
    <a href="https://cocoapods.org/pods/SkeletonView"><img src="https://img.shields.io/cocoapods/v/SkeletonView.svg?style=flat"></a>
    <a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
    <a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-Green.svg?style=flat"></a>
    <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FJuanpe%2FSkeletonView%2Fbadge%3Ftype%3Dplatforms"/>
    <a href="https://badge.bow-swift.io/recipe?name=SkeletonView&description=An%20elegant%20way%20to%20show%20users%20that%20something%20is%20happening%20and%20also%20prepare%20them%20to%20which%20contents%20he%20is%20waiting&url=https://github.com/juanpe/skeletonview&owner=Juanpe&avatar=https://avatars0.githubusercontent.com/u/1409041?v=4&tag=1.20.0"><img src="https://raw.githubusercontent.com/bow-swift/bow-art/master/badges/nef-playgrounds-badge.svg" alt="SkeletonView Playground" style="height:20px"></a>   
</p>

<p align="center">
    <a href="#-features">Özellikler</a>
  • <a href="#-guides">Rehberler</a>
  • <a href="#-installation">Kurulum</a>
  • <a href="#-usage">Kullanım</a>
  • <a href="#-miscellaneous">Diğer Konular</a>
  • <a href="#️-contributing">Katkıda Bulun</a>
</p>

**🌎 README diğer dillerde de mevcuttur: [🇬🇧](../README.md) . [🇪🇸](README_es.md) . [🇨🇳](README_zh.md) . [🇧🇷](README_pt-br.md) . [🇰🇷](README_ko.md) . [🇫🇷](README_fr.md) . [🇩🇪](README_de.md)**

Günümüzde neredeyse tüm uygulamalar, API istekleri, uzun süren işlemler vb. gibi asenkron süreçlere sahiptir. Bu işlemler çalışırken, geliştiriciler genellikle kullanıcılara bir şeylerin devam ettiğini göstermek için bir yükleme görünümü yerleştirir.

**SkeletonView**, kullanıcılara bir şeylerin gerçekleştiğini şık bir şekilde göstermek ve onları hangi içeriğin yükleneceğine hazırlamak için bu ihtiyacı karşılamak amacıyla tasarlanmıştır.

Keyifli kullanımlar! 🙂


##
- [🌟 Özellikler](#-özellikler)
- [🎬 Rehberler](#-rehberler)
- [📲 Kurulum](#-kurulum)
- [🐒 Kullanım](#-kullanım)
  - [🌿 Koleksiyonlar](#-koleksiyonlar)
  - [🔠 Metinler](#-metinler)
  - [🦋 Görünüm](#-görünüm)
  - [🎨 Özel renkler](#-özel-renkler)
  - [🏃‍♀️ Animasyonlar](#️-animasyonlar)
  - [🏄 Geçişler](#-geçişler)
- [✨ Diğer Konular](#-diğer-konular)
- [❤️ Katkıda Bulun](#️-katkıda-bulun)
- [📢 Bahsedenler](#-bahsedenler)
- [🏆 Sponsorlar](#-sponsorlar)
- [👨🏻‍💻 Yazar](#-yazar)
- [👮🏻 Lisans](#-lisans)



## 🌟 Özellikler

* Kullanımı kolay
* Tüm UIView'lar iskeletlenebilir
* Tamamen özelleştirilebilir
* Evrensel (iPhone ve iPad)
* Interface Builder dostu
* Basit Swift sözdizimi
* Hafif, okunabilir kod tabanı




> 📣 **ÖNEMLİ!** 
>
> `SkeletonView` özyinelemeli (recursive) olduğundan, tüm iskeletlenebilir (skeletonable) görünümlerde iskeleti göstermek isterseniz, sadece ana kapsayıcı görünümünde gösterme yöntemini çağırmanız yeterlidir. Örneğin, `UIViewControllers` ile.

  


### 🌿 Koleksiyonlar

```SkeletonView```, ```UITableView``` ve ```UICollectionView``` ile uyumludur.


**UITableView**

Bir ```UITableView```'da iskeleti göstermek istiyorsanız, ```SkeletonTableViewDataSource``` protokolüne uymanız gerekir.

``` swift
public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int // Varsayılan: 1
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? // Varsayılan: nil
    func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath)
}
```
Gördüğünüz gibi, bu protokol ```UITableViewDataSource```'dan miras alır, bu nedenle bu protokolü iskelet protokolü ile değiştirebilirsiniz.

Bu protokolün bazı yöntemler için varsayılan bir uygulaması vardır. Örneğin, her bölüm için satır sayısı çalışma zamanında hesaplanır:

``` swift
func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
// Varsayılan:
// Tüm tableview'ı doldurmak için kaç hücreye ihtiyaç olduğunu hesaplar
```

> 📣 **ÖNEMLİ!** 
>
> Yukarıdaki yöntemde `UITableView.automaticNumberOfSkeletonRows` döndürürseniz, varsayılan davranış gibi çalışır (yani, tüm tableview'ı doldurmak için kaç hücre gerektiğini hesaplar).

Skeleton'a hücre tanımlayıcısını bildirmek için uygulamanız gereken sadece bir yöntem vardır. Bu yöntemin varsayılan bir uygulaması yoktur:
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return "CellIdentifier"
}
 ```
 
Varsayılan olarak, kütüphane her indexPath'ten hücreleri kuyruğa alır, ancak iskelet görünmeden önce bazı değişiklikler yapmak isterseniz bunu da yapabilirsiniz:
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
     let cell = skeletonView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as? Cell
     cell?.textField.isHidden = indexPath.row == 0
     return cell
 }
 ```
 
Kuyruğa alma kısmını kütüphaneye bırakmayı tercih ederseniz, bu yöntemi kullanarak hücreyi yapılandırabilirsiniz:
 ``` swift
 func collectionSkeletonView(_ skeletonView: UITableView, prepareCellForSkeleton cell: UITableViewCell, at indexPath: IndexPath) {
     let cell = cell as? Cell
     cell?.textField.isHidden = indexPath.row == 0
 }
 ```

 
Ayrıca, hem başlıkları hem de altbilgileri iskeletlendirebilirsiniz. Bunun için `SkeletonTableViewDelegate` protokolüne uymanız gerekir.

```swift
public protocol SkeletonTableViewDelegate: UITableViewDelegate {
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForHeaderInSection section: Int) -> ReusableHeaderFooterIdentifier? // Varsayılan: nil
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForFooterInSection section: Int) -> ReusableHeaderFooterIdentifier? // Varsayılan: nil
}
```

> 📣 **ÖNEMLİ!** 
> 
> 1️⃣ Eğer yeniden boyutlandırılabilir hücreler kullanıyorsanız (**`tableView.rowHeight = UITableViewAutomaticDimension`**), **`estimatedRowHeight`** tanımlamanız zorunludur.
> 
> 2️⃣ Bir **`UITableViewCell`**'e öğeler eklediğinizde, bunları doğrudan hücreye değil, **`contentView`**'a eklemelisiniz.
> ```swift
> self.contentView.addSubview(titleLabel) ✅         
> self.addSubview(titleLabel) ❌
> ```

  

**UICollectionView**

`UICollectionView` için, `SkeletonCollectionViewDataSource` protokolüne uymanız gerekir.

``` swift
public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int  // Varsayılan: 1
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewIdentifierOfKind: String, at indexPath: IndexPath) -> ReusableCellIdentifier? // Varsayılan: nil
    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell?  // Varsayılan: nil
    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareCellForSkeleton cell: UICollectionViewCell, at indexPath: IndexPath)
    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareViewForSkeleton view: UICollectionReusableView, at indexPath: IndexPath)
}
```

Sürecin geri kalanı ```UITableView``` ile aynıdır


### 🔠 Metinler

![](../Assets/multilines2.png)

Metin içeren öğeler kullanırken, ```SkeletonView``` metni simüle etmek için çizgiler çizer.

Çok satırlı öğeler için bazı özellikler ayarlayabilirsiniz.

| Özellik | Tür | Varsayılan | Önizleme
| ------- | ------- |------- | -------
| **lastLineFillPercent**  | `CGFloat` | `70`| ![](../Assets/multiline_lastline.png)
| **linesCornerRadius**  | `Int` | `0` | ![](../Assets/multiline_corner.png)
| **skeletonLineSpacing**  | `CGFloat` | `10` | ![](../Assets/multiline_lineSpacing.png)
| **skeletonPaddingInsets**  | `UIEdgeInsets` | `.zero` | ![](../Assets/multiline_insets.png)
| **skeletonTextLineHeight**  | `SkeletonTextLineHeight` | `.fixed(15)` | ![](../Assets/multiline_lineHeight.png)
| **skeletonTextNumberOfLines**  | `SkeletonTextNumberOfLines` | `.inherited` | ![](../Assets/multiline_corner.png)

<br />

Yüzde veya yarıçapı **kod kullanarak** değiştirmek için, özellikleri ayarlayın:
```swift
descriptionTextView.lastLineFillPercent = 50
descriptionTextView.linesCornerRadius = 5
```

Veya, **IB/Storyboard** kullanmayı tercih ederseniz:

![](../Assets/multiline_customize.png)

<br />

**Satır sayısı nasıl tanımlanır?**


Varsayılan olarak, satır sayısı `numberOfLines` özelliğinin değeriyle aynıdır. Ve eğer bu değer **sıfır** olarak ayarlanmışsa, tüm iskeleti doldurmak ve çizmek için kaç satır gerektiğini hesaplayacaktır.

Ancak, belirli bir iskelet satır sayısı ayarlamak istiyorsanız, bunu `skeletonTextNumberOfLines` özelliğini ayarlayarak yapabilirsiniz. Bu özelliğin iki olası değeri vardır: `numberOfLines` değerini döndüren `inherited` ve ilişkilendirilmiş değer olarak belirtilen belirli satır sayısını döndüren `custom(Int)`.

Örneğin:

```swift
label.skeletonTextNumberOfLines = 3   // .custom(3)
``` 

<br />

> **⚠️ KULLANIM DIŞI!**
>
> **useFontLineHeight** kullanımdan kaldırılmıştır. Bunun yerine **skeletonTextLineHeight** kullanabilirsiniz:
> ```swift
> descriptionTextView.skeletonTextLineHeight = .relativeToFont
> ```

> **📣 ÖNEMLİ!**
>
> Lütfen çoklu satırları olmayan görünümler için, tek satırın son satır olarak kabul edileceğini unutmayın.



- **multilineHeight**: `CGFloat`
  - *varsayılan: 15*
- **multilineSpacing**: `CGFloat`
  - *varsayılan: 10*
- **multilineLastLineFillPercent**: `Int`
  - *varsayılan: 70*
- **multilineCornerRadius**: `Int`
  - *varsayılan: 0*
- **skeletonCornerRadius**: `CGFloat` (IBInspectable)  (İskelet görünümünüzü köşelerle yapın)
  - *varsayılan: 0*

Bu varsayılan değerleri almak için `SkeletonAppearance.default` kullanabilirsiniz. Bu özelliği kullanarak değerleri de ayarlayabilirsiniz:
```swift
SkeletonAppearance.default.multilineHeight = 20
SkeletonAppearance.default.tintColor = .green
```

> **⚠️ KULLANIM DIŞI!**
>
> **useFontLineHeight** kullanımdan kaldırılmıştır. Bunun yerine **textLineHeight** kullanabilirsiniz:
> ```swift
> SkeletonAppearance.default.textLineHeight = .relativeToFont
> ```


### 🎨 Özel renkler

İskeletin hangi renkle renklendirildiğine karar verebilirsiniz. Parametre olarak sadece istediğiniz rengi veya gradyanı geçmeniz yeterlidir.

**Düz renkler kullanma**
```swift
view.showSkeleton(usingColor: UIColor.gray) // Solid
// veya
view.showSkeleton(usingColor: UIColor(red: 25.0, green: 30.0, blue: 255.0, alpha: 1.0))
```
**Gradyanlar kullanma**
``` swift
let gradient = SkeletonGradient(baseColor: UIColor.midnightBlue)
view.showGradientSkeleton(usingGradient: gradient) // Gradient
```

Ayrıca, **SkeletonView** 20 düz renk içerir 🤙🏼

```UIColor.turquoise, UIColor.greenSea, UIColor.sunFlower, UIColor.flatOrange  ...```

![](../Assets/flatcolors.png)
###### [https://flatuicolors.com](https://flatuicolors.com) web sitesinden alınan görüntü


### 🏃‍♀️ Animasyonlar

**SkeletonView**, düz iskeletler için *pulse* (nabız) ve gradyanlar için *sliding* (kaydırma) olmak üzere iki yerleşik animasyona sahiptir.

Ayrıca, kendi iskelet animasyonunuzu yapmak istiyorsanız, bu gerçekten kolaydır.


Skeleton, özel animasyonunuzu tanımlayabileceğiniz bir ```SkeletonLayerAnimation``` closure'ına sahip olan `showAnimatedSkeleton` fonksiyonunu sağlar.

```swift
public typealias SkeletonLayerAnimation = (CALayer) -> CAAnimation
```

Fonksiyonu şu şekilde çağırabilirsiniz:

```swift
view.showAnimatedSkeleton { (layer) -> CAAnimation in
  let animation = CAAnimation()
  // Customize here your animation

  return animation
}
```

```SkeletonAnimationBuilder``` mevcuttur. Bu, ```SkeletonLayerAnimation``` oluşturmak için bir oluşturucudur.

Bugün, gradyanlar için **yön** belirleyerek ve animasyonun **süresini** ayarlayarak (varsayılan = 1.5s) **kaydırma animasyonları** oluşturabilirsiniz.

```swift
// func makeSlidingAnimation(withDirection direction: GradientDirection, duration: CFTimeInterval = 1.5) -> SkeletonLayerAnimation

let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftToRight)
view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)

```

```GradientDirection``` bir enum'dır ve şu durumları içerir:

|  Yön | Önizleme
|------- | -------
| .leftRight | ![](../Assets/sliding_left_to_right.gif)
| .rightLeft | ![](../Assets/sliding_right_to_left.gif)
| .topBottom | ![](../Assets/sliding_top_to_bottom.gif)
| .bottomTop | ![](../Assets/sliding_bottom_to_top.gif)
| .topLeftBottomRight | ![](../Assets/sliding_topLeft_to_bottomRight.gif)
| .bottomRightTopLeft | ![](../Assets/sliding_bottomRight_to_topLeft.gif)

> **😉 İPUCU!**
>
> Kaydırma animasyonları oluşturmanın başka bir yolu da vardır, sadece bu kısayolu kullanarak:
> ```swift
> let animation = GradientDirection.leftToRight.slidingAnimation()
> ```

  

### 🏄 Geçişler

**SkeletonView**, iskeletleri *daha pürüzsüz* bir şekilde **göstermek** veya **gizlemek** için yerleşik geçişlere sahiptir 🤙

Geçişi kullanmak için, ```showSkeleton()``` veya ```hideSkeleton()``` fonksiyonunuza geçiş süresiyle birlikte ```transition``` parametresini ekleyin, bu şekilde:

```swift
view.showSkeleton(transition: .crossDissolve(0.25))     //0,25 saniyelik solma süresiyle iskelet çapraz çözülme geçişi göster
view.hideSkeleton(transition: .crossDissolve(0.25))     //0,25 saniyelik solma süresiyle iskelet çapraz çözülme geçişi gizle

```

Varsayılan değer `crossDissolve(0.25)`'dir

**Önizleme**

<table>
<tr>
<td width="50%">
<center>Hiçbiri</center>
</td>
<td width="50%">
<center>Çapraz çözülme</center>
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


## ✨ Diğer Konular 

  

**Hiyerarşi**

```SkeletonView``` özyinelemeli olduğundan ve iskeletin çok verimli olmasını istediğimizden, özyinelemeyi mümkün olan en kısa sürede durdurmak istiyoruz. Bu nedenle, kapsayıcı görünümü `Skeletonable` olarak ayarlamanız gerekir, çünkü Skeleton, bir görünüm Skeletonable olmadığı anda `skeletonable` alt görünümleri aramayı durdurur ve özyinelemeyi keser.

Bir resim bin kelimeye bedeldir:

Bu örnekte, bir `ContainerView` ve bir `UITableView` içeren bir `UIViewController` var. Görünüm hazır olduğunda, iskeleti bu yöntemi kullanarak gösteriyoruz:
```
view.showSkeleton()
```

> ```isSkeletonable```= ☠️

| Konfigürasyon | Sonuç|
|:-------:|:-------:|
|<img src="../Assets/no_skeletonable.jpg" width="350"/> | <img src="../Assets/no_skeletonables_result.png" width="350"/>|
|<img src="../Assets/container_no_skeletonable.jpg" width="350"/> | <img src="../Assets/no_skeletonables_result.png" width="350"/>|
|<img src="../Assets/container_skeletonable.jpg" width="350"/> | <img src="../Assets/container_skeletonable_result.png" width="350"/>|
|<img src="../Assets/all_skeletonables.jpg" width="350"/>| <img src="../Assets/all_skeletonables_result.png" width="350"/>|
|<img src="../Assets/tableview_no_skeletonable.jpg" width="350"/> | <img src="../Assets/tableview_no_skeletonable_result.png" height="350"/>|
|<img src="../Assets/tableview_skeletonable.jpg" width="350"/> | <img src="../Assets/tableview_skeletonable_result.png" height="350"/>|

  

**İskelet görünümlerin düzeni**

Bazen iskelet düzeni, üst görünüm sınırları değiştiği için düzeninize uymayabilir. ~Örneğin, cihazı döndürme.~

İskelet görünümlerini şu şekilde yeniden düzenleyebilirsiniz:

```swift
override func viewDidLayoutSubviews() {
    view.layoutSkeletonIfNeeded()
}
```

> 📣 **ÖNEMLİ!** 
> 
> Bu yöntemi çağırmamalısınız. **Sürüm 1.8.1**'den itibaren bu yöntemi çağırmanıza gerek yok, kütüphane otomatik olarak yapıyor. Bu nedenle, bu yöntemi **SADECE** iskeletin düzenini manuel olarak güncellemeniz gereken durumlarda kullanabilirsiniz.


  

**İskeleti güncelleme**

Aşağıdaki yöntemlerle iskelet yapılandırmasını, rengi, animasyonu vb. gibi herhangi bir zamanda değiştirebilirsiniz:

```swift
(1) view.updateSkeleton()                 // Düz
(2) view.updateGradientSkeleton()         // Gradyan
(3) view.updateAnimatedSkeleton()         // Düz animasyonlu
(4) view.updateAnimatedGradientSkeleton() // Gradyan animasyonlu
```

**Animasyon başladığında görünümleri gizleme**

Bazen animasyon başladığında bazı görünümleri gizlemek istersiniz, bu nedenle bunu gerçekleştirmek için kullanabileceğiniz hızlı bir özellik vardır:

```swift
view.isHiddenWhenSkeletonIsActive = true  // Bu sadece isSkeletonable = true olduğunda çalışır
```

**İskelet aktif olduğunda kullanıcı etkileşimini değiştirmeyin**


Varsayılan olarak, iskeletlenen öğeler için kullanıcı etkileşimi devre dışı bırakılır, ancak iskelet aktif olduğunda kullanıcı etkileşim göstergesini değiştirmek istemiyorsanız, `isUserInteractionDisabledWhenSkeletonIsActive` özelliğini kullanabilirsiniz:

```swift
view.isUserInteractionDisabledWhenSkeletonIsActive = false  // İskelet aktif olduğunda görünüm aktif olacaktır.
```

**Etiketlerdeki iskelet çizgileri için yazı tipi satır yüksekliğini kullanmayın**

Bir `UILabel` veya `UITextView` için iskeletin yazı tipi yüksekliğine otomatik olarak ayarlanmasını devre dışı bırakmak için false olarak ayarlayın. Varsayılan olarak, iskelet çizgileri yüksekliği, sınırlayıcı kutuyu kullanmak yerine etiket dikdörtgenindeki metni daha doğru bir şekilde yansıtmak için yazı tipi yüksekliğine otomatik olarak ayarlanır.

```swift
label.useFontLineHeight = false
```

**Gecikmeli iskelet gösterimi**

Görünümler hızlı güncelleniyorsa iskeletin sunumunu geciktirebilirsiniz.

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

**Debug**

Bir şey düzgün çalışmadığında hata ayıklama görevlerini kolaylaştırmak için **`SkeletonView`** bazı yeni araçlara sahiptir.

İlk olarak, `UIView` iskelet bilgisiyle kullanılabilen bir özelliğe sahiptir:
```swift
var sk.skeletonTreeDescription: String

```

Ayrıca, yeni **hata ayıklama modunu** etkinleştirebilirsiniz. Sadece `SKELETON_DEBUG` ortam değişkenini ekleyip etkinleştirmeniz yeterlidir.

![](../Assets/debug_mode.png)

Daha sonra, iskelet göründüğünde, Xcode konsolunda görünüm hiyerarşisini görebilirsiniz.

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
  
**Desteklenen İşletim Sistemleri ve SDK Sürümleri**

* iOS 9.0+
* tvOS 9.0+
* Swift 5.3

## ❤️ Katkıda Bulun
Bu bir açık kaynak projesidir, bu yüzden katkıda bulunmaktan çekinmeyin. Nasıl mı?

- Bir [sorun](https://github.com/Juanpe/SkeletonView/issues/new) açın.
- [E-posta](mailto://juanpecatalan.com) aracılığıyla geri bildirim gönderin.
- Kendi düzeltmelerinizi, önerilerinizi önerin ve değişikliklerle bir pull request açın.

[Tüm katkıda bulunanları](https://github.com/Juanpe/SkeletonView/graphs/contributors) görün

Daha fazla bilgi için lütfen [katkıda bulunma yönergelerini](https://github.com/Juanpe/SkeletonView/blob/main/CONTRIBUTING.md) okuyun.


## 📢 Bahsedenler

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

## 🏆 Sponsorlar

Açık kaynak projeler sizin yardımınız olmadan uzun süre yaşayamaz. Eğer **SkeletonView**'u yararlı bulursanız, lütfen sponsor olarak bu projeyi desteklemeyi düşünün. 

[GitHub Sponsors](https://github.com/sponsors/Juanpe) aracılığıyla sponsor olun :heart:

## 👨🏻‍💻 Yazar

[Juanpe Catalán](http://www.twitter.com/JuanpeCatalan)

<a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/CDou4xtIK"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Bana bir kahve ısmarla" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"><span style="margin-left:5px"></span></a>


## 👮🏻 Lisans

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
