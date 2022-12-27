//
//  UIHelper.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/24/22.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
    static func getCharacterData() {
 //       if let data = FileLo
    }
    
    static func setupGradient(button: UIButton, color1: CGColor, color2: CGColor) {
        button.layer.cornerRadius = 10
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = button.bounds
        gradientLayer.cornerRadius = 10
        button.layer.insertSublayer(gradientLayer, at: 0)
    }
}
