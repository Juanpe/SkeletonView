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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func drawCell(row: Int) {
        let urlString = "https://randomuser.me/api/portraits/men/\(row+10).jpg"
        avatar.downloadedFrom(link: urlString)
    }
}

extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        showAnimatedSkeleton()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                self.hideSkeleton()
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
