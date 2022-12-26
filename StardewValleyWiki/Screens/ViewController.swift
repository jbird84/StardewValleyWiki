//
//  ViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var springButton: UIButton!
    @IBOutlet weak var summerButton: UIButton!
    @IBOutlet weak var fallButton: UIButton!
    @IBOutlet weak var winterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupButtons() {

        setupGradient(button: springButton, color1: UIColor.white.cgColor, color2: UIColor.systemTeal.cgColor)
        
        setupGradient(button: summerButton, color1: UIColor.white.cgColor, color2: UIColor.red.cgColor)
        
        setupGradient(button: fallButton, color1: UIColor.white.cgColor, color2: UIColor.brown.cgColor)
        
        setupGradient(button: winterButton, color1: UIColor.white.cgColor, color2: UIColor.blue.cgColor)
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
      
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupGradient(button: UIButton, color1: CGColor, color2: CGColor) {
        button.layer.cornerRadius = 10
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = button.bounds
        gradientLayer.cornerRadius = 10
        button.layer.insertSublayer(gradientLayer, at: 0)
    }
}



