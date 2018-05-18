//
//  AmiiboService.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 17/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation


class AmiiboService {
    
 //   static let shared = AmiiboService()

    func getAmiiboList(completionHandler: @escaping (_ response: [Character]?, _ errorService: ServiceError?) -> Void) {
        
        let url = URL(string: NetworkDispatcher.Constants.URL_BASE)
        let urlRequest: URLRequest
        let parameters = Data()
       
        urlRequest = NetworkDispatcher.shared.createHTTPRequest(httpMethod: .get, url: url!,parameters: parameters)
        
        NetworkDispatcher.shared.dispatchResponse(urlRequest) {
            (_ result: [Character]?, _ errorService: ServiceError?) in
            if let result = result {
                print(result)
                completionHandler(result, nil)
            } else {
                completionHandler(nil, errorService)
            }
        }
       
    }
}
