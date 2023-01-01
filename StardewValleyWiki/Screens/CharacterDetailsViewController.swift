//
//  CharacterDetailsViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/26/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    
    let characterDetailsImageView = UIImageView()
    var character: Character = Character(name: "", schedule: [], birthday: "", gifts: [], heart_events: [])
    var filteredHearts: [HeartEvent] = []
    var characterDetailsImage = ""
    
    //Heart_Events
    let heartStackView = UIStackView()
    let heart2 = UILabel()
    let heart3 = UILabel()
    let heart3a = UILabel()
    let heart4 = UILabel()
    let heart5 = UILabel()
    let heart6 = UILabel()
    let heart6a = UILabel()
    let heart7 = UILabel()
    let heart7a = UILabel()
    let heart7b = UILabel()
    let heart8 = UILabel()
    let heart9 = UILabel()
    let heart10 = UILabel()
    let heart11 = UILabel()
    let heart12 = UILabel()
    let heart13 = UILabel()
    let heart14 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupcharacterDetailsImageView()
        
    }
    
    
    
    @IBAction func birthdayButtonTapped(_ sender: Any) {
        setupcharacterDetailsImageView()
        characterDetailsImageView.isHidden = false
        heartStackView.isHidden = true
    }
    
    
    @IBAction func scheduleButtonTapped(_ sender: Any) {
    }
    
    @IBAction func giftsButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func heartsButtonTapped(_ sender: Any) {
        characterDetailsImageView.isHidden = true
        heartStackView.isHidden = false
        getHeartEvents()
        setupHeartEventStackView()
    }
    
    private func setupcharacterDetailsImageView() {
        characterDetailsImageView.frame = CGRect(x: 100, y: 100, width: 290, height: 490)
        view.addSubview(characterDetailsImageView)
        guard let image = UIImage(named: characterDetailsImage) else { return }
        characterDetailsImageView.center = detailView.center
        characterDetailsImageView.image = image
        characterDetailsImageView.contentMode = .scaleAspectFill
    }
    
    private func setupHeartEventStackView() {
        heartStackView.frame = detailView.bounds
        detailView.addSubview(heartStackView)
        heartStackView.addArrangedSubview(heart2)
        heartStackView.addArrangedSubview(heart3)
        heartStackView.addArrangedSubview(heart3a)
        heartStackView.addArrangedSubview(heart4)
        heartStackView.addArrangedSubview(heart5)
        heartStackView.addArrangedSubview(heart6)
        heartStackView.addArrangedSubview(heart6a)
        heartStackView.addArrangedSubview(heart7)
        heartStackView.addArrangedSubview(heart7a)
        heartStackView.addArrangedSubview(heart7b)
        heartStackView.addArrangedSubview(heart8)
        heartStackView.addArrangedSubview(heart9)
        heartStackView.addArrangedSubview(heart10)
        heartStackView.addArrangedSubview(heart11)
        heartStackView.addArrangedSubview(heart12)
        heartStackView.addArrangedSubview(heart13)
        heartStackView.addArrangedSubview(heart14)
        
        heartStackView.spacing = 10
        heartStackView.axis = .vertical
        heartStackView.alignment = .leading
        heartStackView.distribution = .fillProportionally
        
        heartStackView.anchor(top: detailView.topAnchor, leading: detailView.leadingAnchor, trailing: detailView.trailingAnchor, paddingTop: 20, paddingLeading: 16, paddingTrailing: 16)
    }
    
    private func getHeartEvents() {
        filteredHearts = []
        for heart in character.heart_events {
            heart2.text = "2 hearts: \(heart.twoHearts)"
            heart3.text = "3 hearts: \(heart.threeHearts)"
            heart3a.text = "3 hearts 2: \(heart.threeHearts2)"
            heart4.text = "4 hearts: \(heart.fourHearts)"
            heart5.text = "5 hearts: \(heart.fiveHearts)"
            heart6.text = "6 hearts: \(heart.sixHearts)"
            heart6a.text = "6 hearts 2 \(heart.sixHearts2)"
            heart7.text = "7 hearts: \(heart.sevenHearts)"
            heart7a.text = "7 hearts 2: \(heart.sevenHearts2)"
            heart7b.text = "7 hearts 3: \(heart.sevenHearts3)"
            heart8.text = "8 hearts: \(heart.eightHearts)"
            heart9.text = "9 hearts:\(heart.nineHearts)"
            heart10.text = "10 hearts: \(heart.tenHearts)"
            heart11.text = "11 hearts: \(heart.elevenHearts)"
            heart12.text = "12 hearts: \(heart.twelveHearts)"
            heart13.text = "13 hearts: \(heart.thirteenHearts)"
            heart14.text = "14 hearts:\(heart.fourteenHearts)"
        }
        removeEmptyHeartEvents()
    }
    private func removeEmptyHeartEvents() {
        let heartEvents = [heart2, heart3, heart3a, heart4, heart5, heart6, heart6a, heart7, heart7a, heart7b, heart8, heart9, heart10, heart11, heart12, heart13, heart14
            ]
        for heart in heartEvents {
            heart.textColor = UIColor(named: "heartEventColor")
            guard let text = heart.text else { return }
            if text.contains("NA") {
                heart.isHidden = true
            } else {
                heart.numberOfLines = 0
                heart.isHidden = false
            }
        }
    }
}
