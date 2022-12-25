//
//  SVImageView.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/25/22.
//

import UIKit

class SVImageView: UIImageView {

   let placeHolderImage = UIImage(systemName: "person")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 5
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = true
    }
}
