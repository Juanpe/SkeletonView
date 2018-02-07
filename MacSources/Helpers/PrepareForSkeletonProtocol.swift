//
//  PrepareForSkeleton.swift
//  SkeletonViewMac
//
//  Created by Pete Biencourt on 12/06/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import AppKit

protocol PrepareForSkeleton {
    func prepareViewForSkeleton() 
}

extension NSTextField: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        stringValue = ""
        resignFirstResponder()
    }
}

extension NSTextView: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        string = ""
        resignFirstResponder()
    }
}

extension NSImageView: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        image = nil
    }
}
