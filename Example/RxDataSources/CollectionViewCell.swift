//
//  CollectionViewCell.swift
//  RxSkeleton
//
//  Created by Archer on 2018/12/1.
//  Copyright © 2018 Archer. All rights reserved.
//

import UIKit
import SkeletonViewRx

class CollectionViewCell: UICollectionViewCell {
    
    lazy var imgView: UIImageView = {
        let v = UIImageView()
        v.isSkeletonable = true
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.image = UIImage(named: "emoticon.png")
        contentView.addSubview(v)
        return v
    }()
    
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.isSkeletonable = true
        v.numberOfLines = 0
        contentView.addSubview(v)
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.frame = CGRect(x: 25, y: 20, width: 80, height: 80)
        
        let x = imgView.frame.maxX + 20
        titleLabel.frame = CGRect(x: x, y: 20, width: frame.width - x - 25, height: 80)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isSkeletonable = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
