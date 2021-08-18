//
//  Cell.swift
//  SkeletonViewExample
//
//  Created by Juanpe Catalán on 03/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpInputAccessoryView()
    }

    func setUpInputAccessoryView() {
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "InputAccessoryView", style: .plain, target: self, action: #selector(resetTapped))
        bar.items = [reset]
        bar.sizeToFit()
        textField.inputAccessoryView = bar
    }

    @objc func resetTapped() {

    }
}
