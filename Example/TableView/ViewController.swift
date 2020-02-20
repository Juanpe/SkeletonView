//
//  ViewController.swift
//  SkeletonViewExample
//
//  Created by Juanpe Catalán on 02/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView! {
        didSet {
            tableview.rowHeight = UITableView.automaticDimension
            tableview.sectionHeaderHeight = UITableView.automaticDimension
            tableview.sectionFooterHeight = UITableView.automaticDimension
            tableview.estimatedRowHeight = 120.0
            tableview.estimatedSectionFooterHeight = 20.0
            tableview.estimatedSectionHeaderHeight = 20.0
            tableview.register(HeaderFooterSection.self, forHeaderFooterViewReuseIdentifier: "HeaderIdentifier")
            tableview.register(HeaderFooterSection.self, forHeaderFooterViewReuseIdentifier: "FooterIdentifier")
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
        tableview.isSkeletonable = true
        transitionDurationStepper.value = 0.25
        view.showAnimatedSkeleton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        transitionDurationLabel.text = "Transition duration: \(transitionDurationStepper.value) sec"
    }
    
    func showSkeleton() {
        if type == .gradient {
            let gradient = SkeletonGradient(baseColor: colorSelectedView.backgroundColor!)
            if switchAnimated.isOn {
                view.showAnimatedGradientSkeleton(usingGradient: gradient, transition: .crossDissolve(transitionDurationStepper.value))
            }
            else {
                view.showGradientSkeleton(usingGradient: gradient, transition: .crossDissolve(transitionDurationStepper.value))
            }
        }
        else {
            if switchAnimated.isOn {
                view.showAnimatedSkeleton(transition: .crossDissolve(transitionDurationStepper.value))
            }
            else {
                view.showSkeleton(transition: .crossDissolve(transitionDurationStepper.value))
            }
        }
    }
    
    func hideSkeleton() {
        view.hideSkeleton(transition: .crossDissolve(transitionDurationStepper.value))
    }
    
    func refreshSkeleton() {
        if type == .gradient { showOrUpdateGradientSkeleton() }
        else { showOrUpdatepdateSolidSkeleton() }
    }
    
    func showOrUpdatepdateSolidSkeleton() {
        if switchAnimated.isOn {
            view.updateAnimatedSkeleton(usingColor: colorSelectedView.backgroundColor!)
        } else {
            view.updateSkeleton(usingColor: colorSelectedView.backgroundColor!)
        }
    }
    
    func showOrUpdateGradientSkeleton() {
        let gradient = SkeletonGradient(baseColor: colorSelectedView.backgroundColor!)
        if switchAnimated.isOn {
            view.updateAnimatedGradientSkeleton(usingGradient: gradient)
        } else {
            view.updateGradientSkeleton(usingGradient: gradient)
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

extension ViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CellIdentifier"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! Cell
        cell.label1.text = "cell => \(indexPath.row)"
        return cell
    }
}

extension ViewController: SkeletonTableViewDelegate {
    func collectionSkeletonView(_ skeletonView: UITableView, identifierForHeaderInSection section: Int) -> ReusableHeaderFooterIdentifier? {
        return "HeaderIdentifier"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: "HeaderIdentifier") as! HeaderFooterSection
        header.titleLabel.text = "header => \(section)"
        return header
    }

    func collectionSkeletonView(_ skeletonView: UITableView, identifierForFooterInSection section: Int) -> ReusableHeaderFooterIdentifier? {
        return "FooterIdentifier"
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView
            .dequeueReusableHeaderFooterView(withIdentifier: "FooterIdentifier") as! HeaderFooterSection
        footer.titleLabel.text = "footer => \(section)"
        return footer
    }
}
