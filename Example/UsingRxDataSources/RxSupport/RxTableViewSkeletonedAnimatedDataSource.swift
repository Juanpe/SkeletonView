//
//  RxTableViewSkeletonedAnimatedDataSource.swift
//  Fate
//
//  Created by Archer on 2018/12/1.
//

import SkeletonView
import RxDataSources

public class RxTableViewSkeletonedAnimatedDataSource<S: AnimatableSectionModelType>
    : RxTableViewSectionedAnimatedDataSource<S>
    , SkeletonTableViewDataSource {
    
    public typealias NumberOfSections = (RxTableViewSkeletonedAnimatedDataSource<S>, UITableView) -> Int
    public typealias NumberOfRowsInSection = (RxTableViewSkeletonedAnimatedDataSource<S>, UITableView, Int) -> Int
    public typealias ReuseIdentifierForRowAtIndexPath = (RxTableViewSkeletonedAnimatedDataSource<S>, UITableView, IndexPath) -> String
    
    var numberOfSections: NumberOfSections
    var numberOfRowsInSection: NumberOfRowsInSection
    var reuseIdentifierForRowAtIndexPath: ReuseIdentifierForRowAtIndexPath
    
    #if os(iOS)
    public init(animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
                decideViewTransition: @escaping DecideViewTransition = { _, _, _ in .animated },
                configureCell: @escaping ConfigureCell,
                titleForHeaderInSection: @escaping  TitleForHeaderInSection = { _, _ in nil },
                titleForFooterInSection: @escaping TitleForFooterInSection = { _, _ in nil },
                canEditRowAtIndexPath: @escaping CanEditRowAtIndexPath = { _, _ in false },
                canMoveRowAtIndexPath: @escaping CanMoveRowAtIndexPath = { _, _ in false },
                sectionIndexTitles: @escaping SectionIndexTitles = { _ in nil },
                sectionForSectionIndexTitle: @escaping SectionForSectionIndexTitle = { _, _, index in index },
                numberOfSections: @escaping NumberOfSections = { _, _ in 1 },
                numberOfRowsInSection: @escaping NumberOfRowsInSection = { _, tv, _ in Int(ceil(tv.frame.height/tv.rowHeight)) },
                reuseIdentifierForRowAtIndexPath: @escaping ReuseIdentifierForRowAtIndexPath) {
        self.numberOfSections = numberOfSections
        self.numberOfRowsInSection = numberOfRowsInSection
        self.reuseIdentifierForRowAtIndexPath = reuseIdentifierForRowAtIndexPath
        super.init(animationConfiguration: animationConfiguration,
                   decideViewTransition: decideViewTransition,
                   configureCell: configureCell,
                   titleForHeaderInSection: titleForHeaderInSection,
                   titleForFooterInSection: titleForFooterInSection,
                   canEditRowAtIndexPath: canEditRowAtIndexPath,
                   canMoveRowAtIndexPath: canMoveRowAtIndexPath,
                   sectionIndexTitles: sectionIndexTitles,
                   sectionForSectionIndexTitle: sectionForSectionIndexTitle
        )
    }
    #else
    public init(animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
                decideViewTransition: @escaping DecideViewTransition = { _, _, _ in .animated },
                configureCell: @escaping ConfigureCell,
                titleForHeaderInSection: @escaping  TitleForHeaderInSection = { _, _ in nil },
                titleForFooterInSection: @escaping TitleForFooterInSection = { _, _ in nil },
                canEditRowAtIndexPath: @escaping CanEditRowAtIndexPath = { _, _ in false },
                canMoveRowAtIndexPath: @escaping CanMoveRowAtIndexPath = { _, _ in false },
                numberOfSections: @escaping NumberOfSections = { _, _ in 1 },
                numberOfRowsInSection: @escaping NumberOfRowsInSection = { _, tv, _ in Int(ceil(tv.frame.height/tv.rowHeight)) },
                reuseIdentifierForRowAtIndexPath: @escaping ReuseIdentifierForRowAtIndexPath) {
        self.numberOfSections = numberOfSections
        self.numberOfRowsInSection = numberOfRowsInSection
        self.reuseIdentifierForRowAtIndexPath = reuseIdentifierForRowAtIndexPath
        super.init(animationConfiguration: animationConfiguration,
                   decideViewTransition: decideViewTransition,
                   configureCell: configureCell,
                   titleForHeaderInSection: titleForHeaderInSection,
                   titleForFooterInSection: titleForFooterInSection,
                   canEditRowAtIndexPath: canEditRowAtIndexPath,
                   canMoveRowAtIndexPath: canMoveRowAtIndexPath)
    }
    #endif
    
    
    public func numSections(in collectionSkeletonView: UITableView) -> Int {
        return numberOfSections(self, collectionSkeletonView)
    }
    
    public func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(self, skeletonView, section)
    }
    
    public func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> String {
        return reuseIdentifierForRowAtIndexPath(self, skeletonView, indexPath)
    }
}
