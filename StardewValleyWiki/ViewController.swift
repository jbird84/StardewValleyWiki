//
//  ViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/23/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func springTapped(_ sender: Any) {
        gotoCollectionVC()
    }
    

    @IBAction func summerTapped(_ sender: Any) {
    }
    
    @IBAction func fallTapped(_ sender: Any) {
    }
    
    @IBAction func winterTapped(_ sender: Any) {
    }
    
    private func gotoCollectionVC() {
        let vc = storyboard?.instantiateInitialViewController() as! CollectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



