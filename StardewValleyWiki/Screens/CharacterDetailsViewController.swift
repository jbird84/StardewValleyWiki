//
//  CharacterDetailsViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/26/22.
//

import UIKit
import SDWebImage

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var giftsButton: UIButton!
    @IBOutlet weak var heartsButton: UIButton!
    
    
    let characterDetailsImageView = UIImageView()
    var character: Character = Character(name: "", schedule: [], birthday: "", gifts: [], heart_events: [])
    var characterDetailsImage = ""
    
    //Schedule
    var scheduleImages = [UIImage]()
    let swipeScheduleView = UIImageView()
    var currentImage = 0
    
    //Gifts
    let giftsStackView = UIStackView()
    let loveStackView = UIStackView()
    let loveLabel = UILabel()
    let loveLabelDetails = UILabel()
    let likeStackView = UIStackView()
    let likeLabel = UILabel()
    let likeLabelDetails = UILabel()
    let neutralStackView = UIStackView()
    let neutralLabel = UILabel()
    let neutralLabelDetails = UILabel()
    let hateStackView = UIStackView()
    let hateLabel = UILabel()
    let hateLabelDetails = UILabel()
    
    
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
        detailView.backgroundColor = .clear
        view.backgroundColor = UIColor(named: "detailViewBK")
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getImagesFromURL()
    }
    
    @IBAction func birthdayButtonTapped(_ sender: Any) {
        checkForSelected(heartSelected: false, detailsSelected: true, scheduleSelected: false, giftsSelected: false)
        view.backgroundColor = UIColor(named: "detailViewBK")
        setupcharacterDetailsImageView()
        characterDetailsImageView.isHidden = false
        swipeScheduleView.isHidden = true
        heartStackView.isHidden = true
        giftsStackView.isHidden = true
    }
    
    
    @IBAction func scheduleButtonTapped(_ sender: Any) {
        checkForSelected(heartSelected: false, detailsSelected: false, scheduleSelected: true, giftsSelected: false)
        swipeScheduleView.isHidden = false
        characterDetailsImageView.isHidden = true
        heartStackView.isHidden = true
        giftsStackView.isHidden = true
        setupSchedule()
    }
    
    @IBAction func giftsButtonTapped(_ sender: Any) {
        checkForSelected(heartSelected: false, detailsSelected: false, scheduleSelected: false, giftsSelected: true)
        characterDetailsImageView.isHidden = true
        swipeScheduleView.isHidden = true
        heartStackView.isHidden = true
        giftsStackView.isHidden = false
        view.backgroundColor = UIColor(named: "giftViewBK")
        setupGifts()
    }
    
    
    @IBAction func heartsButtonTapped(_ sender: Any) {
        checkForSelected(heartSelected: true, detailsSelected: false, scheduleSelected: false, giftsSelected: false)
        characterDetailsImageView.isHidden = true
        swipeScheduleView.isHidden = true
        heartStackView.isHidden = false
        giftsStackView.isHidden = true
        view.backgroundColor = UIColor(named: "heartViewBK")
        getHeartEvents()
        setupHeartEventStackView()
    }
    
    private func setupButtons() {
        let buttons = [detailsButton, scheduleButton, giftsButton, heartsButton]
        for button in buttons {
            button?.layer.cornerRadius = 10
        }
        detailsButton.backgroundColor = UIColor(named: "selectedButton")
    }
    
    private func setupcharacterDetailsImageView() {
        characterDetailsImageView.frame = CGRect(x: 100, y: 100, width: 290, height: 490)
        view.addSubview(characterDetailsImageView)
        guard let image = UIImage(named: characterDetailsImage) else { return }
        characterDetailsImageView.center = detailView.center
        characterDetailsImageView.image = image
        characterDetailsImageView.contentMode = .scaleAspectFill
    }
    
    private func setupSchedule() {
        view.backgroundColor = UIColor(named: "scheduleViewBK")
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.detailView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.detailView.addGestureRecognizer(swipeLeft)
        
        swipeScheduleView.frame = detailView.bounds
        detailView.addSubview(swipeScheduleView)
        swipeScheduleView.image = scheduleImages[0]
        swipeScheduleView.contentMode = .scaleAspectFit
    }
    
    private func checkForSelected(heartSelected: Bool, detailsSelected: Bool, scheduleSelected: Bool, giftsSelected: Bool) {
        heartsButton.isSelected = heartSelected
        detailsButton.isSelected = detailsSelected
        scheduleButton.isSelected = scheduleSelected
        giftsButton.isSelected = giftsSelected
        
        if detailsButton.isSelected {
            detailsButton.backgroundColor = UIColor(named: "selectedButton")
            scheduleButton.backgroundColor = UIColor(named: "scheduleViewBK")
            giftsButton.backgroundColor = UIColor(named: "giftViewBK")
            heartsButton.backgroundColor = UIColor(named: "heartViewBK")
        }
        if giftsButton.isSelected {
            detailsButton.backgroundColor = UIColor(named: "detailViewBK")
            scheduleButton.backgroundColor = UIColor(named: "scheduleViewBK")
            giftsButton.backgroundColor = UIColor(named: "selectedButton")
            heartsButton.backgroundColor = UIColor(named: "heartViewBK")
        }
        if heartsButton.isSelected {
            detailsButton.backgroundColor = UIColor(named: "detailViewBK")
            scheduleButton.backgroundColor = UIColor(named: "scheduleViewBK")
            giftsButton.backgroundColor = UIColor(named: "giftViewBK")
            heartsButton.backgroundColor = UIColor(named: "selectedButton")
        }
        if scheduleButton.isSelected {
            detailsButton.backgroundColor = UIColor(named: "detailViewBK")
            scheduleButton.backgroundColor = UIColor(named: "selectedButton")
            giftsButton.backgroundColor = UIColor(named: "giftViewBK")
            heartsButton.backgroundColor = UIColor(named: "heartViewBK")
        }
    }
    
    private func setupGifts() {
        let giftLabels = [loveLabel, likeLabel, neutralLabel, hateLabel]
        let giftDetailLabels = [loveLabelDetails, likeLabelDetails, neutralLabelDetails, hateLabelDetails]
        let stackviews = [loveStackView, likeStackView, neutralStackView, hateStackView]
        
        for details in giftDetailLabels {
            details.numberOfLines = 0
        }
        
        for gift in giftLabels {
            gift.numberOfLines = 1
            gift.font = .systemFont(ofSize: 30, weight: .bold)
            gift.textColor = UIColor(named: "giftLabelColor")
        }
        for gifts in character.gifts {
            loveLabelDetails.text = gifts.love
            likeLabelDetails.text = gifts.like
            neutralLabelDetails.text = gifts.neutral
            hateLabelDetails.text = gifts.hate
        }
        
        loveLabel.text = "Gifts I Love"
        likeLabel.text = "Gifts I Like"
        neutralLabel.text = "Gifts I Am Neutral About"
        hateLabel.text = "Gifts I Hate"
        
        loveStackView.addArrangedSubview(loveLabel)
        loveStackView.addArrangedSubview(loveLabelDetails)
        likeStackView.addArrangedSubview(likeLabel)
        likeStackView.addArrangedSubview(likeLabelDetails)
        neutralStackView.addArrangedSubview(neutralLabel)
        neutralStackView.addArrangedSubview(neutralLabelDetails)
        hateStackView.addArrangedSubview(hateLabel)
        hateStackView.addArrangedSubview(hateLabelDetails)
        giftsStackView.frame = detailView.bounds
        detailView.addSubview(giftsStackView)
        
        for stackview in stackviews {
            stackview.spacing = 5
            stackview.axis = .vertical
            stackview.alignment = .leading
            stackview.distribution = .fillProportionally
        }
        
        giftsStackView.addArrangedSubview(loveStackView)
        giftsStackView.addArrangedSubview(likeStackView)
        giftsStackView.addArrangedSubview(neutralStackView)
        giftsStackView.addArrangedSubview(hateStackView)
        giftsStackView.spacing = 10
        giftsStackView.axis = .vertical
        giftsStackView.alignment = .leading
        giftsStackView.distribution = .fillProportionally
        giftsStackView.anchor(top: detailView.topAnchor, leading: detailView.leadingAnchor, trailing: detailView.trailingAnchor, paddingTop: 20, paddingLeading: 16, paddingTrailing: 16)
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
        for heart in character.heart_events {
            
            applyBoldFormatting(to: heart2, text: "2 hearts: \n\(heart.twoHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart3, text: "3 hearts: \n\(heart.threeHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart3a, text: "3 heartA: \n\(heart.threeHearts2)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart4, text: "4 hearts: \n\(heart.fourHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart5, text: "5 hearts: \n\(heart.fiveHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart6, text: "6 hearts: \n\(heart.sixHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart6a, text: "6 heartA: \n\(heart.sixHearts2)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart7, text: "7 hearts: \n\(heart.sevenHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart7a, text: "7 heartA: \n\(heart.sevenHearts2)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart7b, text: "7 heartB: \n\(heart.sevenHearts3)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart8, text: "8 hearts: \n\(heart.eightHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart9, text: "9 hearts: \n\(heart.nineHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart10, text: "10 hearts: \n\(heart.tenHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart11, text: "11 hearts: \n\(heart.elevenHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart12, text: "12 hearts: \n\(heart.twelveHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart13, text: "13 hearts: \n\(heart.thirteenHearts)", boldRange: NSRange(location: 0, length: 10))
            applyBoldFormatting(to: heart14, text: "14 hearts: \n\(heart.fourteenHearts)", boldRange: NSRange(location: 0, length: 10))
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
    
    func getImagesFromURL() {
        let manager = SDWebImageManager.shared
        for url in character.schedule {
            manager.loadImage(with: URL(string: url), options: .continueInBackground, progress: nil) { [weak self] image, _, error, _, _, _ in
                guard let this = self else { return }
                if let image = image {
                    this.scheduleImages.append(image)
                } else {
                    print(error ?? "Something Bad Happened Getting the Image")
                }
            }
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if currentImage == scheduleImages.count - 1 {
                    currentImage = 0
                    
                }else{
                    currentImage += 1
                }
                swipeScheduleView.image = scheduleImages[currentImage]
                
            case UISwipeGestureRecognizer.Direction.right:
                if currentImage == 0 {
                    currentImage = scheduleImages.count - 1
                }else{
                    currentImage -= 1
                }
                swipeScheduleView.image = scheduleImages[currentImage]
            default:
                break
            }
        }
    }
    
    func applyBoldFormatting(to label: UILabel, text: String, boldRange: NSRange) {
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 22), range: boldRange)
        label.attributedText = attributedText
    }
}
