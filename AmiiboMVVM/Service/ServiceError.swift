//
//  ServiceError.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 17/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

enum ServiceError: String {
    
    case sucess = "Sucess"
    case requestError = "Error in URLResquest"
    case unableToDecode = "Unable to Decode"
    case unableToEncode = "Unable to Encode"
    case statusCodeError = "Status code between 200 and 299"
    
}
