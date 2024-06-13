//  Copyright © 2022 SkeletonView. All rights reserved.

import UIKit
import SkeletonView

class UITextViewByCodeViewController: UIViewController {
    
    private let numberOflinesCornerRadius = 10
    private let topAnchorConstraintConst: CGFloat = 10
    private let leftAnchorConstraintConst: CGFloat = 10
    private let rightAnchorConstraintConst: CGFloat = -10
    private let heightAnchorConstraintConst: CGFloat = 100

    lazy var textView: UITextView = {
        let tv = UITextView()
        
        tv.text = "              "
        tv.linesCornerRadius = numberOflinesCornerRadius
        tv.isSkeletonable = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupElementsConstraints()
        showSkeletonForElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupUI() {
        view.addSubview(textView)
    }
    
    func setupElementsConstraints() {
        textView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: topAnchorConstraintConst).isActive = true
        textView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: leftAnchorConstraintConst).isActive = true
        textView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: rightAnchorConstraintConst).isActive = true
        textView.heightAnchor.constraint(equalToConstant: heightAnchorConstraintConst).isActive = true
    }
    
    func showSkeletonForElements() {
        textView.showSkeleton()
    }
}
