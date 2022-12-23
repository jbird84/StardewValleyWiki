//
//  ViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/23/22.
//

import UIKit

class ViewController: UIViewController {

    let diceView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDice()
    }
    
    private func setupDice() {
        // Create a dice view and add it to the view hierarchy
        
        diceView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        diceView.backgroundColor = .brown
        view.addSubview(diceView)

        // Add a tap gesture recognizer to the dice view
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(diceViewTapped))
        diceView.addGestureRecognizer(tapGestureRecognizer)

  
    }
    
    @objc func diceViewTapped() {
        // Animate the dice rolling around the screen
        UIView.animate(withDuration: 1.0, animations: {
            // Use a transformation to rotate and translate the dice
            self.diceView.transform = CGAffineTransform(rotationAngle: .pi).translatedBy(x: 200, y: 200)
        })
    }

}

