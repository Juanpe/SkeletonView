//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit
import SkeletonView

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.isSkeletonable = true
            collectionView.backgroundColor = .clear
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        }
    }
    
    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.layer.cornerRadius = avatarImage.frame.width/2
            avatarImage.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var colorSelectedView: UIView! {
        didSet {
            colorSelectedView.layer.cornerRadius = 5
            colorSelectedView.layer.masksToBounds = true
            colorSelectedView.backgroundColor = SkeletonAppearance.default.tintColor
        }
    }
    
    @IBOutlet weak var switchAnimated: UISwitch!
    @IBOutlet weak var skeletonTypeSelector: UISegmentedControl!
    @IBOutlet weak var showOrHideSkeletonButton: UIButton!
    @IBOutlet weak var transitionDurationLabel: UILabel!
    @IBOutlet weak var transitionDurationStepper: UIStepper!
    
    var type: SkeletonType {
        return skeletonTypeSelector.selectedSegmentIndex == 0 ? .solid : .gradient
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionDurationStepper.value = 0.25
        collectionView.prepareSkeleton(completion: { done in
            self.view.showAnimatedSkeleton()
        })
    }
    
    @IBAction func changeAnimated(_ sender: Any) {
        if switchAnimated.isOn {
            view.startSkeletonAnimation()
        } else {
            view.stopSkeletonAnimation()
        }
    }
    
    @IBAction func changeSkeletonType(_ sender: Any) {
        refreshSkeleton()
    }
    
    @IBAction func btnChangeColorTouchUpInside(_ sender: Any) {
        showAlertPicker()
    }
    
    @IBAction func showOrHideSkeleton(_ sender: Any) {
        showOrHideSkeletonButton.setTitle((view.isSkeletonActive ? "Show skeleton" : "Hide skeleton"), for: .normal)
        view.isSkeletonActive ? hideSkeleton() : showSkeleton()
    }
    
    @IBAction func transitionDurationStepperAction(_ sender: Any) {
        transitionDurationLabel.text = "transition duration: \(transitionDurationStepper.value) sec"
    }
    
    func showSkeleton() {
        refreshSkeleton()
    }
    
    func hideSkeleton() {
        view.hideSkeleton(transition: .crossDissolve(transitionDurationStepper.value))
    }
    
    func refreshSkeleton() {
        self.view.hideSkeleton()
        if type == .gradient { showGradientSkeleton() }
        else { showSolidSkeleton() }
    }
    
    func showSolidSkeleton() {
        if switchAnimated.isOn {
            view.showAnimatedSkeleton(usingColor: colorSelectedView.backgroundColor!, transition: .crossDissolve(transitionDurationStepper.value))
        } else {
            view.showSkeleton(usingColor: colorSelectedView.backgroundColor!, transition: .crossDissolve(transitionDurationStepper.value))
        }
    }
    
    func showGradientSkeleton() {
        let gradient = SkeletonGradient(baseColor: colorSelectedView.backgroundColor!)
        if switchAnimated.isOn {
            view.showAnimatedGradientSkeleton(usingGradient: gradient, transition: .crossDissolve(transitionDurationStepper.value))
        } else {
            view.showGradientSkeleton(usingGradient: gradient, transition: .crossDissolve(transitionDurationStepper.value))
        }
    }
    
    func showAlertPicker() {
        let alertView = UIAlertController(title: "Select color", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 50, width: 260, height: 115))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        alertView.view.addSubview(pickerView)
        
        let action = UIAlertAction(title: "OK", style: .default) { [unowned pickerView, unowned self] _ in
            let row = pickerView.selectedRow(inComponent: 0)
            self.colorSelectedView.backgroundColor = colors[row].0
            self.refreshSkeleton()
        }
        alertView.addAction(action)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertView.addAction(cancelAction)
        
        present(alertView, animated: false, completion: {
            pickerView.frame.size.width = alertView.view.frame.size.width
        })
    }
}
 
 // MARK: - UIPickerViewDelegate, UIPickerViewDataSource

 extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].1
    }
 }

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3 - 10, height: view.frame.width/3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

// MARK: - SkeletonCollectionViewDataSource

extension ViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CollectionViewCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
        
    }
}
