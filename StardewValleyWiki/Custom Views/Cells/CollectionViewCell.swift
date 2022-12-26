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
        charaterImageView.backgroundColor = .clear
        charaterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            charaterImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            charaterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            charaterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         charaterImageView.heightAnchor.constraint(equalTo: charaterImageView.widthAnchor)
        ])
    }
    
    private func configureCharaterNameLabel() {
        addSubview(charaterNameLabel)
        charaterNameLabel.backgroundColor = .clear
        charaterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        charaterNameLabel.anchor(top: charaterImageView.bottomAnchor, leading: charaterImageView.leadingAnchor, trailing: charaterImageView.trailingAnchor, height: 20)
    }
    
    func set(charater: [CharaterData], indexPath: IndexPath) {
        charaterImageView.image = UIImage(named: charater[indexPath.row].charaterImageName) != nil ? UIImage(named: charater[indexPath.row].charaterImageName) : UIImage(systemName: "plus")
        let name = charater[indexPath.row].charaterNameLabel
        charaterNameLabel.text = name
    }
}
