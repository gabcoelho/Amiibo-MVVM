//
//  AmiiboService.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 17/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation
import Kingfisher


class AmiiboService {
        
    var character: Character!
    var charactersList = CharacterList()
    var characters = [Character]()
    var errorService: ServiceError?

    func getAmiiboList(completionHandler: @escaping (_ response: [Character]?, _ errorService: ServiceError?) -> Void) {
        
        let url = URL(string: NetworkDispatcher.Constants.URL_BASE)
        let urlRequest: URLRequest
        let parameters = Data()
       
        urlRequest = NetworkDispatcher.shared.createHTTPRequest(httpMethod: .get, url: url!,parameters: parameters)
        
        NetworkDispatcher.shared.dispatchResponse(urlRequest, completionHandler: { (_ result: CharacterList?, _ errorService: ServiceError?) in
            if let result = result {
                self.charactersList = result
                completionHandler(result.characters, nil)
            } else {
                completionHandler(nil, errorService)
            }
        })
    }
    
}








