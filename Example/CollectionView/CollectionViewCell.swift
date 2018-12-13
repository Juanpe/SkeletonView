//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit
import SkeletonView

class CollectionViewCell: UICollectionViewCell {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isSkeletonable = true
        createLabel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLabel() {
        label = UILabel()
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: frame.height / 2),
            label.widthAnchor.constraint(equalToConstant: frame.width / 2)
            ])
    }
    
}
