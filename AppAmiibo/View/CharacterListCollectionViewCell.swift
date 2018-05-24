//
//  CharacterListCollectionViewCell.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 21/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit

class CharacterListCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var characterNameCollectionViewCell: UILabel!
    @IBOutlet weak var characterImageCollectionViewCell: UIImageView!
    
    func configureCell(character: Character) {
        let url = URL(string: character.imagePath)
        characterImageCollectionViewCell.kf.setImage(with: url)
        characterNameCollectionViewCell.text = character.name
    }
    
}
