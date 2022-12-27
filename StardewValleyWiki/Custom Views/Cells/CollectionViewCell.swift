//
//  CollectionViewCell.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/25/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let characterImageView = SVImageView(frame: .zero)
    let characterNameLabel = SVTitleLabel(textAlignment: .center, fontSize: 16)
    
    private let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCharacterImageView()
        configureCharacterNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCharacterImageView() {
        addSubview(characterImageView)
        characterImageView.backgroundColor = .clear
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor)
        ])
    }
    
    private func configureCharacterNameLabel() {
        addSubview(characterNameLabel)
        characterNameLabel.backgroundColor = .clear
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.anchor(top: characterImageView.bottomAnchor, leading: characterImageView.leadingAnchor, trailing: characterImageView.trailingAnchor, height: 20)
    }
    
    func set(character: [CharacterImageData], indexPath: IndexPath) {
        characterImageView.image = UIImage(named: character[indexPath.row].characterImageName) != nil ? UIImage(named: character[indexPath.row].characterImageName) : UIImage(systemName: "plus")
        let name = character[indexPath.row].characterNameLabel
        characterNameLabel.text = name
    }
}
