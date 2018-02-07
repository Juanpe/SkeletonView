//
//  HelperProtocols.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

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

extension NSView: Recursive {
    typealias Element = NSView
}
extension CALayer: Recursive {
    typealias Element = CALayer
}


