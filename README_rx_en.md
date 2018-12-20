###  Overview
&emsp;&emsp;As you can see, when using RxDataSources, we can not combine SkeletonView together, so I wrote this code to support for using SkeletonView with RxDataSources.

### How To Use
&emsp;&emsp;When working with RxDataSources on UITableView, you specify RxTableViewSectionedReloadDataSource or RxTableViewSectionedAnimatedDataSource and then do the configurations that RxDataSources requires(the same goes for UICollectionView).</br>
&emsp;&emsp;It's really easy to use this code, basically everything is the same as you use RxDataSources.For extends ability to working with SkeletonView on UICollectionView, we provide `RxCollectionViewSkeletonedReloadDataSource` and `RxCollectionViewSkeletonedAnimatedDataSource` instead of RxDataSources provides(also same to UITableView).</br>
&emsp;&emsp;These two classes are fully compatible with the previous ones but provide some additional configuration, the following codes shows that:
```
private func collectionViewSkeletonedReloadDataSource() -> RxCollectionViewSkeletonedReloadDataSource<SectionModel<String, Int>>  {
    return RxCollectionViewSkeletonedReloadDataSource(configureCell: { (ds, cv, ip, item) in
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: ip) as! CollectionViewCell
        cell.titleLabel.text = "Current number for cell is \(item), have fun."
        return cell
    }, numberOfSections: { _, _ in
        return 1
    }, numberOfItemsInSection: { _, _, section in
        return 7
    }, reuseIdentifierForItemAtIndexPath: { _, _, _ in
        return "CollectionViewCell"
    })
}
```
&emsp;&emsp;You may have noticed that these additional configurations are provided by the `SkeletonCollectionViewDataSource` protocol, with `numberOfSections` and `numberOfItemsInSection` has a default implementation, there is only one closure you need to implement to let Skeleton know the cell identifier, that is `reuseIdentifierForItemAtIndexPath`.</br>
&emsp;&emsp;We also provide a `bind(to:)` method, so the rest of your code hardly needs modification, here is a demonstrate:
```
// definition of dataSource
private lazy var dataSource = collectionViewSkeletonedReloadDataSource()

private func loadData() {
    let sections = [SectionModel(model: "hello world", items: [1, 2, 3, 4, 5, 6, 7, 8])]
    // Simulates network request,
    // we just wait a second here
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
        Observable.just(sections)
        .bind(to: self.collectionView.rx.items(dataSource: self.dataSource))
        .disposed(by: self.disposeBag)
        // hides skeleton when data received
        self.view.hideSkeleton()
    }
}
```
You can check demo project for more details.

### Requirements
Xcode 10.0
Swift 4.2








