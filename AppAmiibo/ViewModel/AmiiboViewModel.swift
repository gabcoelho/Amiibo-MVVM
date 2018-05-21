//
//  AmiiboViewModel.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 19/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

protocol AmibiboViewModel {
    var character: Character { get }
    var characterName: String { get }
    var charaterAmiiboSeries: String { get }
    var characterGameSeries: String { get }
    var characterImage: String { get }
    
}
