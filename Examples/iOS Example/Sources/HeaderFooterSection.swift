// Copyright © 2020 SkeletonView. All rights reserved.

import UIKit

class HeaderFooterSection: UITableViewHeaderFooterView {
    
    lazy var titleLabel: UILabel = {
        let label =  UILabel()

        label.text = "      "
        label.isSkeletonable = true
        label.linesCornerRadius = 10

        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        isSkeletonable = true
        
        contentView.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        backgroundView = UIView()
        if #available(iOS 13.0, *) {
            backgroundView?.backgroundColor = .systemBackground
        } else {
            backgroundView?.backgroundColor = .white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
