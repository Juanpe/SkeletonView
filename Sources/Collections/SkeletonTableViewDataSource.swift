//
//  SkeletonUITableViewDataSource.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

public protocol SkeletonTableViewDataSource: UITableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdenfierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

public extension SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skeletonView.estimatedNumberOfRows
    }
    
    func numSections(in collectionSkeletonView: UITableView) -> Int { return 1 }

    func collectionSkeletonView(_ skeletonView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = collectionSkeletonView(skeletonView, cellIdenfierForRowAt: indexPath)
        return skeletonView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}
