//
//  CharacterListTableViewCell.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 19/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var characterNameTableViewCell: UILabel!
    @IBOutlet weak var characterImageTableViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(character: Character) {
        let url = URL(string: character.imagePath)
        characterImageTableViewCell.kf.setImage(with: url)
        characterNameTableViewCell.text = character.name
    }
}
