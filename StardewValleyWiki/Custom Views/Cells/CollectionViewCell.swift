//
//  CollectionViewCell.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/25/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let charaterImageView = SVImageView(frame: .zero)
    let charaterNameLabel = SVTitleLabel(textAlignment: .center, fontSize: 16)
    
    private let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCharaterImageView()
        configureCharaterNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCharaterImageView() {
        addSubview(charaterImageView)
        
        NSLayoutConstraint.activate([
            charaterImageView.topAnchor.constraint(equalTo: topAnchor),
            charaterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            charaterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            charaterImageView.heightAnchor.constraint(equalTo: charaterImageView.widthAnchor)
        ])
    }
    
    private func configureCharaterNameLabel() {
        addSubview(charaterNameLabel)
        
        NSLayoutConstraint.activate([
            charaterNameLabel.topAnchor.constraint(equalTo: charaterImageView.bottomAnchor, constant: padding),
            charaterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            charaterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            charaterNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(charater: [CharaterData], indexPath: IndexPath) {
        let image = UIImage(named: charater[indexPath.row].charaterImageName)
        let name = charater[indexPath.row].charaterNameLabel
        
        charaterImageView.image = image
        charaterNameLabel.text = name
    }
    
}
