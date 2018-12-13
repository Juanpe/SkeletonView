//
//  RxCollectionViewSkeletonedDataSourceProxy.swift
//  RxSkeleton
//
//  Created by Archer on 2018/11/30.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa
import SkeletonView

fileprivate let collectionViewSkeletonedDataSourceNotSet = CollectionViewSkeletonedDataSourceNotSet()

fileprivate final class CollectionViewSkeletonedDataSourceNotSet
    : NSObject
    , SkeletonCollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Data Source Not Set")
    }
    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        return 0
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> String {
        fatalError("Data Source Not Set")
    }
}

/// For more information take a look at `DelegateProxyType`.
public class RxCollectionViewSkeletonedDataSourceProxy
    : DelegateProxy<UICollectionView, SkeletonCollectionViewDataSource>
    , DelegateProxyType
    , SkeletonCollectionViewDataSource {
    
    /// Typed parent object.
    public weak private(set) var collectionView: UICollectionView?
    
    /// - parameter collectionView: Parent object for delegate proxy.
    public init(collectionView: ParentObject) {
        self.collectionView = collectionView
        super.init(parentObject: collectionView, delegateProxy: RxCollectionViewSkeletonedDataSourceProxy.self)
    }
    
    // Register known implementations
    public static func registerKnownImplementations() {
        self.register { RxCollectionViewSkeletonedDataSourceProxy(collectionView: $0) }
    }
    
    public static func currentDelegate(for object: UICollectionView) -> SkeletonCollectionViewDataSource? {
        return object.dataSource as? SkeletonCollectionViewDataSource
    }
    
    public static func setCurrentDelegate(_ delegate: SkeletonCollectionViewDataSource?, to object: UICollectionView) {
        object.dataSource = delegate
    }
    
    // MARK: delegate
    private weak var _requiredMethodsDataSource: SkeletonCollectionViewDataSource? = collectionViewSkeletonedDataSourceNotSet

    /// Required delegate method implementation.
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (_requiredMethodsDataSource ?? collectionViewSkeletonedDataSourceNotSet).collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    /// Required delegate method implementation.
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (_requiredMethodsDataSource ?? collectionViewSkeletonedDataSourceNotSet).collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    public func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        return (_requiredMethodsDataSource ?? collectionViewSkeletonedDataSourceNotSet).numSections(in: collectionSkeletonView)
    }
    
    public func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (_requiredMethodsDataSource ?? collectionViewSkeletonedDataSourceNotSet).collectionSkeletonView(skeletonView, numberOfItemsInSection: section)
    }
    
    public func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> String {
        return (_requiredMethodsDataSource ?? collectionViewSkeletonedDataSourceNotSet).collectionSkeletonView(skeletonView, cellIdentifierForItemAt: indexPath)
    }
    
    /// For more information take a look at `DelegateProxyType`.
    public override func setForwardToDelegate(_ forwardToDelegate: SkeletonCollectionViewDataSource?, retainDelegate: Bool) {
        _requiredMethodsDataSource = forwardToDelegate ?? collectionViewSkeletonedDataSourceNotSet
        super.setForwardToDelegate(forwardToDelegate, retainDelegate: retainDelegate)
    }
}

#endif


