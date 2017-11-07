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
    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isSkeletonable = true
        
//        view.showAnimatedGradientSkeleton()
//        view.showAnimatedSkeleton(usingColor: UIColor.sunFlower)
        
//        view.showAnimatedGradientSkeleton(usingGradient: SkeletonGradient(baseColor: UIColor.red, secundaryColor: UIColor.green))
//        view.showAnimatedGradientSkeleton(usingGradient: SkeletonGradient(baseColor: UIColor.belizeHole))
//        sendrequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        view.showAnimatedGradientSkeleton()
        view.showSkeleton()
    }
    
    func sendrequest() {
        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
                        print(url)
                        print(explanation)
                        DispatchQueue.main.async {
//                            self.view.hideSkeleton(reloadDataAfter: false)
//                            self.tableview.reloadData()
                        }
                    }
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    @IBAction func hideSkeletons(_ sender: Any) {
        view.hideSkeleton()
    }
    
    @IBAction func show(_ sender: Any) {
//        view.showAnimatedSkeleton(usingColor: UIColor.clouds)
        view.showGradientSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.view.startSkeletonAnimation()
        }
//        view.showGradientSkeleton(withDirection: .rightLeft)
//        view.showAnimatedGradientSkeleton()
    }
}

extension ViewController: SkeletonUITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdenfierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CellIdentifier"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! Cell
        cell.label1.text = "cell => \(indexPath.row)"
        cell.drawCell(row: indexPath.row)
        return cell
    }
}

