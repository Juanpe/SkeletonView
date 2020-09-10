//  Copyright © 2017 SkeletonView. All rights reserved.

import UIKit

typealias VoidBlock = () -> Void
typealias RecursiveBlock<T> = (T) -> Void

protocol IterableElement {}
extension UIView: IterableElement {}
extension CALayer: IterableElement {}

// MARK: Recursive
protocol Recursive {
    associatedtype Element: IterableElement
    func recursiveSearch(leafBlock: VoidBlock, recursiveBlock: RecursiveBlock<Element>)
}

extension Array: Recursive where Element: IterableElement {
    func recursiveSearch(leafBlock: VoidBlock, recursiveBlock: RecursiveBlock<Element>) {
        guard !isEmpty else {
            leafBlock()
            return
        }
        forEach { recursiveBlock($0) }
    }
}
