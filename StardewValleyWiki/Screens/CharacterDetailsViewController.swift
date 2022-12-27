//
//  CharacterDetailsViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/26/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var detailView: UIView!
    
    let birthdayLabel = UILabel()
    var character: Character = Character(name: "", schedule: [], birthday: "", gifts: [], heart_events: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBirthdayLabel()
    }
    
    
    
    @IBAction func birthdayButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func scheduleButtonTapped(_ sender: Any) {
    }
    
    @IBAction func giftsButtonTapped(_ sender: Any) {
    }
    
    private func setupBirthdayLabel() {
        birthdayLabel.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        view.addSubview(birthdayLabel)
        birthdayLabel.center = view.center
        birthdayLabel.text = character.birthday.capitalized
    }
    
}
