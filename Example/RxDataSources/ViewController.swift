// Copyright © 2018年 SkeletonView. All rights reserved.

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SkeletonViewRx

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.isSkeletonable = true
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = true
            
            collectionView.delegate = self
            // NOTE: dataSource must be set before showing skeleton
            // you can set it directly or use bind(to:) method
            collectionView.dataSource = dataSource
            
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        }
    }
    
    
    let disposeBag = DisposeBag()
    private lazy var dataSource = collectionViewSkeletonedReloadDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isSkeletonable = true
        showSkeleton()
    }
    
    private func showSkeleton() {
        // show skeleton and then load data
        collectionView.prepareSkeleton(completion: { done in
            self.view.showAnimatedGradientSkeleton()
            self.loadData()
        })
    }
    
    private func loadData() {
        let sections = [SectionModel(model: "hello world", items: [1, 2, 3, 4, 5, 6, 7, 8])]
        // Simulates network request,
        // we just wait a second here
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            Observable.just(sections)
                .bind(to: self.collectionView.rx.items(dataSource: self.dataSource))
                .disposed(by: self.disposeBag)
            // hides skeleton when data received
            self.view.hideSkeleton()
        }
    }
    
    @IBAction func reloadData(_ sender: Any) {
        if self.view.isSkeletonActive {
            return
        }
        showSkeleton()
    }
    
    private func collectionViewSkeletonedReloadDataSource() -> RxCollectionViewSkeletonedReloadDataSource<SectionModel<String, Int>>  {
        return RxCollectionViewSkeletonedReloadDataSource(configureCell: { (ds, cv, ip, item) in
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: ip) as! CollectionViewCell
            cell.titleLabel.text = "Current number for cell is \(item), have fun."
            return cell
        }, reuseIdentifierForItemAtIndexPath: { _, _, _ in
            return "CollectionViewCell"
        })
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}

