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
        CharacterImageData(characterImageName: K.CharacterNames.abigail, characterNameLabel: K.CharacterNames.abigail, characterDetailsLabel: K.CharacterDetails.abigail),
        CharacterImageData(characterImageName: K.CharacterNames.alex, characterNameLabel: K.CharacterNames.alex, characterDetailsLabel: K.CharacterDetails.alex),
        CharacterImageData(characterImageName: K.CharacterNames.caroline, characterNameLabel: K.CharacterNames.caroline, characterDetailsLabel: K.CharacterDetails.caroline),
        CharacterImageData(characterImageName: K.CharacterNames.clint, characterNameLabel: K.CharacterNames.clint, characterDetailsLabel: K.CharacterDetails.clint),
        CharacterImageData(characterImageName: K.CharacterNames.demetrius, characterNameLabel: K.CharacterNames.demetrius, characterDetailsLabel: K.CharacterDetails.demetrius),
        CharacterImageData(characterImageName: K.CharacterNames.dwarf, characterNameLabel: K.CharacterNames.dwarf, characterDetailsLabel: K.CharacterDetails.dwarf),
        CharacterImageData(characterImageName: K.CharacterNames.elliott, characterNameLabel: K.CharacterNames.elliott, characterDetailsLabel: K.CharacterDetails.elliott),
        CharacterImageData(characterImageName: K.CharacterNames.emily, characterNameLabel: K.CharacterNames.emily, characterDetailsLabel: K.CharacterDetails.emily),
        CharacterImageData(characterImageName: K.CharacterNames.evelyn, characterNameLabel: K.CharacterNames.evelyn, characterDetailsLabel: K.CharacterDetails.evelyn),
        CharacterImageData(characterImageName: K.CharacterNames.george, characterNameLabel: K.CharacterNames.george, characterDetailsLabel: K.CharacterDetails.george),
        CharacterImageData(characterImageName: K.CharacterNames.gus, characterNameLabel: K.CharacterNames.gus, characterDetailsLabel: K.CharacterDetails.gus),
        CharacterImageData(characterImageName: K.CharacterNames.haley, characterNameLabel: K.CharacterNames.haley, characterDetailsLabel: K.CharacterDetails.haley),
        CharacterImageData(characterImageName: K.CharacterNames.harvey, characterNameLabel: K.CharacterNames.harvey, characterDetailsLabel: K.CharacterDetails.harvey),
        CharacterImageData(characterImageName: K.CharacterNames.jas, characterNameLabel: K.CharacterNames.jas, characterDetailsLabel: K.CharacterDetails.jas),
        CharacterImageData(characterImageName: K.CharacterNames.jodi, characterNameLabel: K.CharacterNames.jodi, characterDetailsLabel: K.CharacterDetails.jodi),
        CharacterImageData(characterImageName: K.CharacterNames.kent, characterNameLabel: K.CharacterNames.kent, characterDetailsLabel: K.CharacterDetails.kent),
        CharacterImageData(characterImageName: K.CharacterNames.krobus, characterNameLabel: K.CharacterNames.krobus, characterDetailsLabel: K.CharacterDetails.krobus),
        CharacterImageData(characterImageName: K.CharacterNames.leah, characterNameLabel: K.CharacterNames.leah, characterDetailsLabel: K.CharacterDetails.leah),
        CharacterImageData(characterImageName: K.CharacterNames.leo, characterNameLabel: K.CharacterNames.leo, characterDetailsLabel: K.CharacterDetails.leo),
        CharacterImageData(characterImageName: K.CharacterNames.lewis, characterNameLabel: K.CharacterNames.lewis, characterDetailsLabel: K.CharacterDetails.lewis),
        CharacterImageData(characterImageName: K.CharacterNames.linus, characterNameLabel: K.CharacterNames.linus, characterDetailsLabel: K.CharacterDetails.linus),
        CharacterImageData(characterImageName: K.CharacterNames.marnie, characterNameLabel: K.CharacterNames.marnie, characterDetailsLabel: K.CharacterDetails.marnie),
        CharacterImageData(characterImageName: K.CharacterNames.maru, characterNameLabel: K.CharacterNames.maru, characterDetailsLabel: K.CharacterDetails.maru),
        CharacterImageData(characterImageName: K.CharacterNames.pam, characterNameLabel: K.CharacterNames.pam, characterDetailsLabel: K.CharacterDetails.pam),
        CharacterImageData(characterImageName: K.CharacterNames.penny, characterNameLabel: K.CharacterNames.penny, characterDetailsLabel: K.CharacterDetails.penny),
        CharacterImageData(characterImageName: K.CharacterNames.pierre, characterNameLabel: K.CharacterNames.pierre, characterDetailsLabel: K.CharacterDetails.pierre),
        CharacterImageData(characterImageName: K.CharacterNames.robin, characterNameLabel: K.CharacterNames.robin, characterDetailsLabel: K.CharacterDetails.robin),
        CharacterImageData(characterImageName: K.CharacterNames.sam, characterNameLabel: K.CharacterNames.sam, characterDetailsLabel: K.CharacterDetails.sam),
        CharacterImageData(characterImageName: K.CharacterNames.sandy, characterNameLabel: K.CharacterNames.sandy, characterDetailsLabel: K.CharacterDetails.sandy),
        CharacterImageData(characterImageName: K.CharacterNames.sebastian, characterNameLabel: K.CharacterNames.sebastian, characterDetailsLabel: K.CharacterDetails.sebastian),
        CharacterImageData(characterImageName: K.CharacterNames.shane, characterNameLabel: K.CharacterNames.shane, characterDetailsLabel: K.CharacterDetails.shane),
        CharacterImageData(characterImageName: K.CharacterNames.vincent, characterNameLabel: K.CharacterNames.vincent, characterDetailsLabel: K.CharacterDetails.vincent),
        CharacterImageData(characterImageName: K.CharacterNames.willy, characterNameLabel: K.CharacterNames.willy, characterDetailsLabel: K.CharacterDetails.willy),
        CharacterImageData(characterImageName: K.CharacterNames.wizard, characterNameLabel: K.CharacterNames.wizard, characterDetailsLabel: K.CharacterDetails.wizard)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.isHidden = false
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
            collectionView.isHidden = true
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
            let vc = CharacterDetailsViewController()
            for characters in cData {
                for character in characters.characters {
                    if character.name.capitalized == self.characters[indexPath.row].characterNameLabel.capitalized {
                        vc.character = character
                        vc.title = character.name.capitalized
                        break
                    }
                }
            }
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}
