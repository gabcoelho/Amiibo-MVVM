//
//  Constants.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 16/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

extension NetworkDispatcher {
    
    struct Constants {
        
        var URL_ALL_CHARACTERS = "http://www.amiiboapi.com/api/amiibo/?"
        
        static let ApiScheme = "http:"
        static let ApiHost = "//www.amiiboapi.com/api/"
        static let AllCharacters = "amiibo/?"
        static let Amiibo = "amiibo"
        
        static let URL_BASE = Constants.ApiScheme + Constants.ApiHost + Constants.AllCharacters
    }
    
}
