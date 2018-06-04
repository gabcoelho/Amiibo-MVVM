//
//  CharacterList.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 18/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

struct CharacterList: Codable {
    
    var characters: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case characters = "amiibo"
    }
    
    
}
