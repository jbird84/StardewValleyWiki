//
//  CalendarViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/27/22.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var springButton: UIButton!
    @IBOutlet weak var summerButton: UIButton!
    @IBOutlet weak var fallButton: UIButton!
    @IBOutlet weak var winterButton: UIButton!
    @IBOutlet weak var calendarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtons()
        calendarImageView.image = UIImage(named: K.CalendarName.spring)
    }
    
    private func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupButtons() {
        let buttons = [springButton, summerButton, fallButton, winterButton]
        for button in buttons {
            button?.layer.cornerRadius = 10
        }
        UIHelper.setupGradient(button: springButton, color1: UIColor.white.cgColor, color2: UIColor.systemTeal.cgColor)
        UIHelper.setupGradient(button: summerButton, color1: UIColor.white.cgColor, color2: UIColor.red.cgColor)
        UIHelper.setupGradient(button: fallButton, color1: UIColor.white.cgColor, color2: UIColor.brown.cgColor)
        UIHelper.setupGradient(button: winterButton, color1: UIColor.white.cgColor, color2: UIColor.blue.cgColor)
    }
    
    @IBAction func springButtonPressed(_ sender: Any) {
        calendarImageView.image = UIImage(named: K.CalendarName.spring)
    }
    
    @IBAction func summerButtonPressed(_ sender: Any) {
        calendarImageView.image = UIImage(named: K.CalendarName.summer)
    }
    
    @IBAction func fallButtonPressed(_ sender: Any) {
        calendarImageView.image = UIImage(named: K.CalendarName.fall)
    }
    
    @IBAction func winterButtonPressed(_ sender: Any) {
        calendarImageView.image = UIImage(named: K.CalendarName.winter)
    }
    
}
