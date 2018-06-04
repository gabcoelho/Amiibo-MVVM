//
//  CharacterListTableViewCell.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 19/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var characterNameTableViewCell: UILabel!
    @IBOutlet weak var characterImageTableViewCell: UIImageView!

    // MARK: - ConfigureCellData
    
    func configureCell(character: CharacterCellViewModel) {
        characterImageTableViewCell.kf.setImage(with: character.image)
        characterNameTableViewCell.text = character.name
    }
}
