//
//  ViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/23/22.
//

import UIKit

var mainSeason = ""

class ViewController: UIViewController {

    @IBOutlet weak var springButton: UIButton!
    @IBOutlet weak var summerButton: UIButton!
    @IBOutlet weak var fallButton: UIButton!
    @IBOutlet weak var winterButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    
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
        UIHelper.setupGradient(button: springButton, color1: UIColor.white.cgColor, color2: UIColor.systemTeal.cgColor)
        UIHelper.setupGradient(button: summerButton, color1: UIColor.white.cgColor, color2: UIColor.red.cgColor)
        UIHelper.setupGradient(button: fallButton, color1: UIColor.white.cgColor, color2: UIColor.brown.cgColor)
        UIHelper.setupGradient(button: winterButton, color1: UIColor.white.cgColor, color2: UIColor.blue.cgColor)
        UIHelper.setupGradient(button: calendarButton, color1: UIColor.white.cgColor, color2: UIColor.systemPurple.cgColor)
    }
    
    
    @IBAction func springTapped(_ sender: Any) {
        gotoCollectionVC(season: "spring")
    }

    @IBAction func summerTapped(_ sender: Any) {
        gotoCollectionVC(season: "summer")
    }
    
    @IBAction func fallTapped(_ sender: Any) {
        gotoCollectionVC(season: "fall")
    }
    
    @IBAction func winterTapped(_ sender: Any) {
        gotoCollectionVC(season: "winter")
    }
    
    private func gotoCollectionVC(season: String) {
      
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        mainSeason = season
        vc.title = mainSeason.capitalized
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



