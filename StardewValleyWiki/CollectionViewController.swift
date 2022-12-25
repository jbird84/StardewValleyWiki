//
//  CollectionViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/24/22.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        
    }

}
