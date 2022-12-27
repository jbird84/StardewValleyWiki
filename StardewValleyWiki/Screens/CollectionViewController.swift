//
//  CollectionViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/24/22.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    
    
    let charaters: [CharaterImageData] = [
        CharaterImageData(charaterImageName: K.CharaterNames.abigail, charaterNameLabel: K.CharaterNames.abigail),
        CharaterImageData(charaterImageName: K.CharaterNames.alex, charaterNameLabel: K.CharaterNames.alex),
        CharaterImageData(charaterImageName: K.CharaterNames.caroline, charaterNameLabel: K.CharaterNames.caroline),
        CharaterImageData(charaterImageName: K.CharaterNames.clint, charaterNameLabel: K.CharaterNames.clint),
        CharaterImageData(charaterImageName: K.CharaterNames.demetrius, charaterNameLabel: K.CharaterNames.demetrius),
        CharaterImageData(charaterImageName: K.CharaterNames.dwarf, charaterNameLabel: K.CharaterNames.dwarf),
        CharaterImageData(charaterImageName: K.CharaterNames.elliott, charaterNameLabel: K.CharaterNames.elliott),
        CharaterImageData(charaterImageName: K.CharaterNames.emily, charaterNameLabel: K.CharaterNames.emily),
        CharaterImageData(charaterImageName: K.CharaterNames.evelyn, charaterNameLabel: K.CharaterNames.evelyn),
        CharaterImageData(charaterImageName: K.CharaterNames.george, charaterNameLabel: K.CharaterNames.george),
        CharaterImageData(charaterImageName: K.CharaterNames.gus, charaterNameLabel: K.CharaterNames.gus),
        CharaterImageData(charaterImageName: K.CharaterNames.haley, charaterNameLabel: K.CharaterNames.haley),
        CharaterImageData(charaterImageName: K.CharaterNames.harvey, charaterNameLabel: K.CharaterNames.harvey),
        CharaterImageData(charaterImageName: K.CharaterNames.jas, charaterNameLabel: K.CharaterNames.jas),
        CharaterImageData(charaterImageName: K.CharaterNames.jodi, charaterNameLabel: K.CharaterNames.jodi),
        CharaterImageData(charaterImageName: K.CharaterNames.kent, charaterNameLabel: K.CharaterNames.kent),
        CharaterImageData(charaterImageName: K.CharaterNames.krobus, charaterNameLabel: K.CharaterNames.krobus),
        CharaterImageData(charaterImageName: K.CharaterNames.leah, charaterNameLabel: K.CharaterNames.leah),
        CharaterImageData(charaterImageName: K.CharaterNames.leo, charaterNameLabel: K.CharaterNames.leo),
        CharaterImageData(charaterImageName: K.CharaterNames.lewis, charaterNameLabel: K.CharaterNames.lewis),
        CharaterImageData(charaterImageName: K.CharaterNames.linus, charaterNameLabel: K.CharaterNames.linus),
        CharaterImageData(charaterImageName: K.CharaterNames.marnie, charaterNameLabel: K.CharaterNames.marnie),
        CharaterImageData(charaterImageName: K.CharaterNames.maru, charaterNameLabel: K.CharaterNames.maru),
        CharaterImageData(charaterImageName: K.CharaterNames.pam, charaterNameLabel: K.CharaterNames.pam),
        CharaterImageData(charaterImageName: K.CharaterNames.penny, charaterNameLabel: K.CharaterNames.penny),
        CharaterImageData(charaterImageName: K.CharaterNames.pierre, charaterNameLabel: K.CharaterNames.pierre),
        CharaterImageData(charaterImageName: K.CharaterNames.robin, charaterNameLabel: K.CharaterNames.robin),
        CharaterImageData(charaterImageName: K.CharaterNames.sam, charaterNameLabel: K.CharaterNames.sam),
        CharaterImageData(charaterImageName: K.CharaterNames.sandy, charaterNameLabel: K.CharaterNames.sandy),
        CharaterImageData(charaterImageName: K.CharaterNames.sebastian, charaterNameLabel: K.CharaterNames.sebastian),
        CharaterImageData(charaterImageName: K.CharaterNames.shane, charaterNameLabel: K.CharaterNames.shane),
        CharaterImageData(charaterImageName: K.CharaterNames.vincent, charaterNameLabel: K.CharaterNames.vincent),
        CharaterImageData(charaterImageName: K.CharaterNames.willy, charaterNameLabel: K.CharaterNames.willy),
        CharaterImageData(charaterImageName: K.CharaterNames.wizard, charaterNameLabel: K.CharaterNames.wizard)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
    }
    

    private func configureCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: K.ReusableIdentifier.collectionCell)
    }
    
    private func configureViewController() {
        view.backgroundColor = .secondarySystemBackground
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charaters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ReusableIdentifier.collectionCell, for: indexPath) as! CollectionViewCell
        cell.set(charater: self.charaters, indexPath: indexPath)
        return cell
    }
    
    //TODO: This needs to take image and name to the next view when cell is tapped.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
