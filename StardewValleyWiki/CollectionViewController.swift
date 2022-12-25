//
//  CollectionViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/24/22.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    
    let charaters: [CharaterData] = [
        CharaterData(charaterImageName: K.CharaterNames.abigail, charaterNameLabel: K.CharaterNames.abigail),
        CharaterData(charaterImageName: K.CharaterNames.alex, charaterNameLabel: K.CharaterNames.alex),
        CharaterData(charaterImageName: K.CharaterNames.caroline, charaterNameLabel: K.CharaterNames.caroline),
        CharaterData(charaterImageName: K.CharaterNames.clint, charaterNameLabel: K.CharaterNames.clint),
        CharaterData(charaterImageName: K.CharaterNames.demetrius, charaterNameLabel: K.CharaterNames.demetrius),
        CharaterData(charaterImageName: K.CharaterNames.dwarf, charaterNameLabel: K.CharaterNames.dwarf),
        CharaterData(charaterImageName: K.CharaterNames.elliott, charaterNameLabel: K.CharaterNames.elliott),
        CharaterData(charaterImageName: K.CharaterNames.emily, charaterNameLabel: K.CharaterNames.emily),
        CharaterData(charaterImageName: K.CharaterNames.evelyn, charaterNameLabel: K.CharaterNames.evelyn),
        CharaterData(charaterImageName: K.CharaterNames.george, charaterNameLabel: K.CharaterNames.george),
        CharaterData(charaterImageName: K.CharaterNames.gus, charaterNameLabel: K.CharaterNames.gus),
        CharaterData(charaterImageName: K.CharaterNames.haley, charaterNameLabel: K.CharaterNames.haley),
        CharaterData(charaterImageName: K.CharaterNames.harvey, charaterNameLabel: K.CharaterNames.harvey),
        CharaterData(charaterImageName: K.CharaterNames.jas, charaterNameLabel: K.CharaterNames.jas),
        CharaterData(charaterImageName: K.CharaterNames.jodi, charaterNameLabel: K.CharaterNames.jodi),
        CharaterData(charaterImageName: K.CharaterNames.kent, charaterNameLabel: K.CharaterNames.kent),
        CharaterData(charaterImageName: K.CharaterNames.krobus, charaterNameLabel: K.CharaterNames.krobus),
        CharaterData(charaterImageName: K.CharaterNames.leah, charaterNameLabel: K.CharaterNames.leah),
        CharaterData(charaterImageName: K.CharaterNames.leo, charaterNameLabel: K.CharaterNames.leo),
        CharaterData(charaterImageName: K.CharaterNames.lewis, charaterNameLabel: K.CharaterNames.lewis),
        CharaterData(charaterImageName: K.CharaterNames.linus, charaterNameLabel: K.CharaterNames.linus),
        CharaterData(charaterImageName: K.CharaterNames.marnie, charaterNameLabel: K.CharaterNames.marnie),
        CharaterData(charaterImageName: K.CharaterNames.maru, charaterNameLabel: K.CharaterNames.maru),
        CharaterData(charaterImageName: K.CharaterNames.pam, charaterNameLabel: K.CharaterNames.pam),
        CharaterData(charaterImageName: K.CharaterNames.penny, charaterNameLabel: K.CharaterNames.penny),
        CharaterData(charaterImageName: K.CharaterNames.pierre, charaterNameLabel: K.CharaterNames.pierre),
        CharaterData(charaterImageName: K.CharaterNames.robin, charaterNameLabel: K.CharaterNames.robin),
        CharaterData(charaterImageName: K.CharaterNames.sam, charaterNameLabel: K.CharaterNames.sam),
        CharaterData(charaterImageName: K.CharaterNames.sandy, charaterNameLabel: K.CharaterNames.sandy),
        CharaterData(charaterImageName: K.CharaterNames.sebastian, charaterNameLabel: K.CharaterNames.sebastian),
        CharaterData(charaterImageName: K.CharaterNames.shane, charaterNameLabel: K.CharaterNames.shane),
        CharaterData(charaterImageName: K.CharaterNames.vincent, charaterNameLabel: K.CharaterNames.vincent),
        CharaterData(charaterImageName: K.CharaterNames.willy, charaterNameLabel: K.CharaterNames.willy),
        CharaterData(charaterImageName: K.CharaterNames.wizard, charaterNameLabel: K.CharaterNames.wizard)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
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
        view.backgroundColor = .systemBackground
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
