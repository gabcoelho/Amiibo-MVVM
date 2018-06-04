//
//  CharacterCellViewModel.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 30/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation


struct CharacterCellViewModel {
    let name: String
    let image: URL
    let amiiboSeries: String
    let gameSeries: String
}


func createCellViewModel(character: Character) -> CharacterCellViewModel {
    return CharacterCellViewModel(name: character.name,
                                  image: URL(string: character.imagePath)!,
                                  amiiboSeries: character.amiiboSeries,
                                  gameSeries: character.gameSeries)
}


