//
//  PrepareForSkeleton.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 04/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

private enum PropertyRecoverKeys: String {
    case labelTextKey, imageKey, backgroundColorKey
    
    static var labelText = PropertyRecoverKeys.labelTextKey.rawValue
    static var image = PropertyRecoverKeys.imageKey.rawValue
    static var backgroundColor = PropertyRecoverKeys.backgroundColorKey.rawValue
}

protocol PrepareForSkeleton {
    func prepareViewForSkeleton()
    func recoverViewState()
}

extension UILabel: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        recoverLabelText = text
        recoverBackgroundColor = backgroundColor
        
        text = nil
        backgroundColor = nil
        
        resignFirstResponder()
    }
    
    func recoverViewState() {
        text = recoverLabelText
        backgroundColor = recoverBackgroundColor
    }
    
    var recoverLabelText: String? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.labelText) as? String }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.labelText, newValue, AssociationPolicy.retain.objc) }
    }
    
    var recoverBackgroundColor: UIColor? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.backgroundColor) as? UIColor }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.backgroundColor, newValue, AssociationPolicy.retain.objc) }
    }
}

extension UITextView: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        recoverLabelText = text
        recoverBackgroundColor = backgroundColor
        
        text = nil
        backgroundColor = nil
        
        resignFirstResponder()
    }
    
    func recoverViewState() {
        text = recoverLabelText
        backgroundColor = recoverBackgroundColor
    }
    
    var recoverLabelText: String? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.labelText) as? String }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.labelText, newValue, AssociationPolicy.retain.objc) }
    }
    
    var recoverBackgroundColor: UIColor? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.backgroundColor) as? UIColor }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.backgroundColor, newValue, AssociationPolicy.retain.objc) }
    }
}

extension UITextField: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        recoverLabelText = text
        recoverBackgroundColor = backgroundColor
        
        text = nil
        backgroundColor = nil
        
        resignFirstResponder()
    }
    
    func recoverViewState() {
        text = recoverLabelText
        backgroundColor = recoverBackgroundColor
    }
    
    var recoverLabelText: String? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.labelText) as? String }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.labelText, newValue, AssociationPolicy.retain.objc) }
    }
    
    var recoverBackgroundColor: UIColor? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.backgroundColor) as? UIColor }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.backgroundColor, newValue, AssociationPolicy.retain.objc) }
    }
}

extension UIImageView: PrepareForSkeleton {
    func prepareViewForSkeleton() {
        recoverImage = image
        recoverBackgroundColor = backgroundColor
        
        image = nil
        backgroundColor = nil
    }
    
    func recoverViewState() {
        image = recoverImage
        backgroundColor = recoverBackgroundColor
    }
    
    var recoverImage: UIImage? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.image) as? UIImage }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.image, newValue, AssociationPolicy.retain.objc) }
    }
    
    var recoverBackgroundColor: UIColor? {
        get { return objc_getAssociatedObject(self, &PropertyRecoverKeys.backgroundColor) as? UIColor }
        set { objc_setAssociatedObject(self, &PropertyRecoverKeys.backgroundColor, newValue, AssociationPolicy.retain.objc) }
    }
    
}
