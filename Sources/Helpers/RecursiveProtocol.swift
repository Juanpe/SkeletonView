//
//  HelperProtocols.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

typealias VoidBlock = () -> Void
typealias RecursiveBlock<T> = (T) -> Void

//MARK: Recursive
protocol Recursive {
    associatedtype Element 
    func recursiveSearch(inArray array:[Element], leafBlock: VoidBlock, recursiveBlock: RecursiveBlock<Element>)
}

extension Recursive {
    func recursiveSearch(inArray array:[Element], leafBlock: VoidBlock, recursiveBlock: RecursiveBlock<Element>) {
        guard array.count > 0 else {
            leafBlock()
            return
        }
        array.forEach { recursiveBlock($0) }
    }
}

extension UIView: Recursive {
    typealias Element = UIView
}
extension CALayer: Recursive {
    typealias Element = CALayer
}


