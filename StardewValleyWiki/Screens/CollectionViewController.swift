//
//  CollectionViewController.swift
//  StardewValleyWiki
//
//  Created by Kinney Kare on 12/24/22.
//

import UIKit
var cData: [DetailData] = []
class CollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    
    let characters: [CharacterImageData] = [
        CharacterImageData(characterImageName: K.CharacterNames.abigail, characterNameLabel: K.CharacterNames.abigail),
        CharacterImageData(characterImageName: K.CharacterNames.alex, characterNameLabel: K.CharacterNames.alex),
        CharacterImageData(characterImageName: K.CharacterNames.caroline, characterNameLabel: K.CharacterNames.caroline),
        CharacterImageData(characterImageName: K.CharacterNames.clint, characterNameLabel: K.CharacterNames.clint),
        CharacterImageData(characterImageName: K.CharacterNames.demetrius, characterNameLabel: K.CharacterNames.demetrius),
        CharacterImageData(characterImageName: K.CharacterNames.dwarf, characterNameLabel: K.CharacterNames.dwarf),
        CharacterImageData(characterImageName: K.CharacterNames.elliott, characterNameLabel: K.CharacterNames.elliott),
        CharacterImageData(characterImageName: K.CharacterNames.emily, characterNameLabel: K.CharacterNames.emily),
        CharacterImageData(characterImageName: K.CharacterNames.evelyn, characterNameLabel: K.CharacterNames.evelyn),
        CharacterImageData(characterImageName: K.CharacterNames.george, characterNameLabel: K.CharacterNames.george),
        CharacterImageData(characterImageName: K.CharacterNames.gus, characterNameLabel: K.CharacterNames.gus),
        CharacterImageData(characterImageName: K.CharacterNames.haley, characterNameLabel: K.CharacterNames.haley),
        CharacterImageData(characterImageName: K.CharacterNames.harvey, characterNameLabel: K.CharacterNames.harvey),
        CharacterImageData(characterImageName: K.CharacterNames.jas, characterNameLabel: K.CharacterNames.jas),
        CharacterImageData(characterImageName: K.CharacterNames.jodi, characterNameLabel: K.CharacterNames.jodi),
        CharacterImageData(characterImageName: K.CharacterNames.kent, characterNameLabel: K.CharacterNames.kent),
        CharacterImageData(characterImageName: K.CharacterNames.krobus, characterNameLabel: K.CharacterNames.krobus),
        CharacterImageData(characterImageName: K.CharacterNames.leah, characterNameLabel: K.CharacterNames.leah),
        CharacterImageData(characterImageName: K.CharacterNames.leo, characterNameLabel: K.CharacterNames.leo),
        CharacterImageData(characterImageName: K.CharacterNames.lewis, characterNameLabel: K.CharacterNames.lewis),
        CharacterImageData(characterImageName: K.CharacterNames.linus, characterNameLabel: K.CharacterNames.linus),
        CharacterImageData(characterImageName: K.CharacterNames.marnie, characterNameLabel: K.CharacterNames.marnie),
        CharacterImageData(characterImageName: K.CharacterNames.maru, characterNameLabel: K.CharacterNames.maru),
        CharacterImageData(characterImageName: K.CharacterNames.pam, characterNameLabel: K.CharacterNames.pam),
        CharacterImageData(characterImageName: K.CharacterNames.penny, characterNameLabel: K.CharacterNames.penny),
        CharacterImageData(characterImageName: K.CharacterNames.pierre, characterNameLabel: K.CharacterNames.pierre),
        CharacterImageData(characterImageName: K.CharacterNames.robin, characterNameLabel: K.CharacterNames.robin),
        CharacterImageData(characterImageName: K.CharacterNames.sam, characterNameLabel: K.CharacterNames.sam),
        CharacterImageData(characterImageName: K.CharacterNames.sandy, characterNameLabel: K.CharacterNames.sandy),
        CharacterImageData(characterImageName: K.CharacterNames.sebastian, characterNameLabel: K.CharacterNames.sebastian),
        CharacterImageData(characterImageName: K.CharacterNames.shane, characterNameLabel: K.CharacterNames.shane),
        CharacterImageData(characterImageName: K.CharacterNames.vincent, characterNameLabel: K.CharacterNames.vincent),
        CharacterImageData(characterImageName: K.CharacterNames.willy, characterNameLabel: K.CharacterNames.willy),
        CharacterImageData(characterImageName: K.CharacterNames.wizard, characterNameLabel: K.CharacterNames.wizard)
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
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ReusableIdentifier.collectionCell, for: indexPath) as! CollectionViewCell
        cell.set(character: self.characters, indexPath: indexPath)
        return cell
    }
    
    //TODO: This needs to take image and name to the next view when cell is tapped.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = FileLoader.readLocalJSONFile("Characters") {
            let character = FileLoader.loadJson(data)
            
            for season in character.seasons {
                switch mainSeason {
                case "spring":
                    cData = season.spring
                case "summer":
                    cData = season.summer
                case "fall":
                    cData = season.fall
                case "winter":
                    cData = season.winter
                default:
                    cData = season.spring
                }
            }
            let vc = CharacterDetailsViewController(nibName: "CharacterDetailsViewController", bundle: nil)
            for characters in cData {
                for character in characters.characters {
                    vc.birthday = character.birthday.rawValue.capitalized
                    vc.title = character.name.rawValue.capitalized
                }
            }
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
