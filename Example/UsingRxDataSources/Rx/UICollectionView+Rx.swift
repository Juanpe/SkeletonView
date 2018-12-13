//
//  UICollectionView+Rx.swift
//  RxSkeleton
//
//  Created by Archer on 2018/11/30.
//

import UIKit
import RxSwift
import RxCocoa
import SkeletonView
import RxDataSources

extension Reactive where Base: UICollectionView {
    /**
     Binds sequences of elements to collection view items using a custom reactive data used to perform the transformation.
     
     - parameter dataSource: Data source used to transform elements to view cells.
     - parameter source: Observable sequence of items.
     - returns: Disposable object that can be used to unbind.
     
     Example
     
     let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Double>>()
     
     let items = Observable.just([
     SectionModel(model: "First section", items: [
     1.0,
     2.0,
     3.0
     ]),
     SectionModel(model: "Second section", items: [
     1.0,
     2.0,
     3.0
     ]),
     SectionModel(model: "Third section", items: [
     1.0,
     2.0,
     3.0
     ])
     ])
     
     dataSource.configureCell = { (dataSource, cv, indexPath, element) in
     let cell = cv.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCell
     cell.value?.text = "\(element) @ row \(indexPath.row)"
     return cell
     }
     
     items
     .bind(to: collectionView.rx.items(dataSource: dataSource))
     .disposed(by: disposeBag)
     */
    public func items<
        DataSource: RxCollectionViewDataSourceType & SkeletonCollectionViewDataSource,
        O: ObservableType>
        (dataSource: DataSource)
        -> (_ source: O)
        -> Disposable where DataSource.Element == O.E
    {
        return { source in
            // This is called for sideeffects only, and to make sure delegate proxy is in place when
            // data source is being bound.
            // This is needed because theoretically the data source subscription itself might
            // call `self.rx.delegate`. If that happens, it might cause weird side effects since
            // setting data source will set delegate, and UICollectionView might get into a weird state.
            // Therefore it's better to set delegate proxy first, just to be sure.
            _ = self.delegate
            // Strong reference is needed because data source is in use until result subscription is disposed
            return source.subscribeProxyDataSource(ofObject: self.base, dataSource: dataSource, retainDataSource: true) { [weak collectionView = self.base] (_: RxCollectionViewSkeletonedDataSourceProxy, event) -> Void in
                guard let collectionView = collectionView else {
                    return
                }
                dataSource.collectionView(collectionView, observedEvent: event)
            }
        }
    }
}

