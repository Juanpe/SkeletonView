//
//  RxTableViewSkeletonedDataSourceProxy.swift
//  RxSkeleton
//
//  Created by Archer on 2018/11/30.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa
import SkeletonView

fileprivate let tableViewSkeletonedDataSourceNotSet = TableViewSkeletonedDataSourceNotSet()

fileprivate final class TableViewSkeletonedDataSourceNotSet
    : NSObject
    , SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Data Source Not Set")
    }
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 0
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        fatalError("Data Source Not Set")
    }
}

/// For more information take a look at `DelegateProxyType`.
public class RxTableViewSkeletonedDataSourceProxy
    : DelegateProxy<UITableView, SkeletonTableViewDataSource>
    , DelegateProxyType
    , SkeletonTableViewDataSource {
    
    /// Typed parent object.
    public weak private(set) var tableView: UITableView?
    
    /// - parameter tableView: Parent object for delegate proxy.
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init(parentObject: tableView, delegateProxy: RxTableViewSkeletonedDataSourceProxy.self)
    }
    
    // Register known implementations
    public static func registerKnownImplementations() {
        self.register { RxTableViewSkeletonedDataSourceProxy(tableView: $0) }
    }
    
    public static func currentDelegate(for object: UITableView) -> SkeletonTableViewDataSource? {
        return object.dataSource as? SkeletonTableViewDataSource
    }

    public static func setCurrentDelegate(_ delegate: SkeletonTableViewDataSource?, to object: UITableView) {
        object.dataSource = delegate
    }
    
    // MARK: delegate
    fileprivate weak var _requiredMethodsDataSource: SkeletonTableViewDataSource? = tableViewSkeletonedDataSourceNotSet
    
    /// Required delegate method implementation.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_requiredMethodsDataSource ?? tableViewSkeletonedDataSourceNotSet).tableView(tableView, numberOfRowsInSection: section)
    }
    
    /// Required delegate method implementation.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (_requiredMethodsDataSource ?? tableViewSkeletonedDataSourceNotSet).tableView(tableView, cellForRowAt: indexPath)
    }
    
    public func numSections(in collectionSkeletonView: UITableView) -> Int {
        return (_requiredMethodsDataSource ?? tableViewSkeletonedDataSourceNotSet).numSections(in: collectionSkeletonView)
    }
    
    public func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_requiredMethodsDataSource ?? tableViewSkeletonedDataSourceNotSet).collectionSkeletonView(skeletonView, numberOfRowsInSection: section)
    }
    
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return (_requiredMethodsDataSource ?? tableViewSkeletonedDataSourceNotSet).collectionSkeletonView(skeletonView, cellIdentifierForRowAt: indexPath)
    }
    
    /// For more information take a look at `DelegateProxyType`.
    public override func setForwardToDelegate(_ forwardToDelegate: SkeletonTableViewDataSource?, retainDelegate: Bool) {
        _requiredMethodsDataSource = forwardToDelegate ?? tableViewSkeletonedDataSourceNotSet
        super.setForwardToDelegate(forwardToDelegate, retainDelegate: retainDelegate)
    }
}

#endif
