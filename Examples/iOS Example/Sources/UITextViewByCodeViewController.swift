//  Copyright © 2022 SkeletonView. All rights reserved.

import UIKit
import SkeletonView

class UITextViewByCodeViewController: UIViewController {
    lazy var textView: UITextView = {
        let tv = UITextView()
        
        tv.text = "              "
        tv.linesCornerRadius = 10
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
        textView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        textView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        textView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func showSkeletonForElements() {
        textView.showSkeleton()
    }
}
