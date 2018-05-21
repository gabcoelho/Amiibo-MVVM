//
//  Character.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 16/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

struct Character: Codable {
    var name: String
    var amiiboSeries: String
    var gameSeries: String
    var imagePath: String
    
    enum JSONKeys: String, CodingKey {
        case name = "name"
        case amiiboSeries = "amiiboSeries"
        case gameSeries = "gameSeries"
        case imagePath = "image"
    }
}

extension Character {
    
    func enconde(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: JSONKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(amiiboSeries, forKey: .amiiboSeries)
        try container.encode(gameSeries, forKey: .gameSeries)
        try container.encode(imagePath, forKey: .imagePath)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKeys.self)
        name = try container.decode(String.self, forKey: .name)
        amiiboSeries = try container.decode(String.self, forKey: .amiiboSeries)
        gameSeries = try container.decode(String.self, forKey: .gameSeries)
        imagePath = try container.decode(String.self, forKey: .imagePath)
    }
}
