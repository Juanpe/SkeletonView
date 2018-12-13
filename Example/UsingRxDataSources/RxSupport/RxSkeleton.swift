//
//  RxSkeleton.swift
//  RxSkeleton
//
//  Created by Archer on 2018/12/1.
//

import Foundation

internal func debugFatalError(_ e: Error) {
    #if DEBUG
    fatalError("\(e)")
    #else
    print("\(e)")
    #endif
}
