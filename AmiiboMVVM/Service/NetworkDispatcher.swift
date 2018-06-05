//
//  NetworkNetworkDispatcher.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 16/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation


enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
}

class NetworkDispatcher {
    
    static let shared = NetworkDispatcher()

    // MARK: - HTTPRequest
    
    func createHTTPRequest(httpMethod: HTTPMethod, url: URL, parameters: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if let parameters = parameters {
            request.httpBody = parameters
            _ = JSON.deserialize(data: parameters)
        }
        return request
    }
    
    // MARK: - Dispatch Request
    
    internal func dispatch(_ urlRequest: URLRequest, completionHandler: @escaping (_ data: Data?, _ errorService: ServiceError) -> Void) -> Void {
        let request = urlRequest
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            guard(error == nil) else {
                completionHandler(nil, ServiceError.requestError)
                return
            }
            guard let data = data else {
                completionHandler(nil, ServiceError.unableToDecode)
                return
            }
            completionHandler(data, ServiceError.sucess)
        }
        task.resume()
    }

    func dispatchResponse<T: Codable>(_ urlRequest: URLRequest, completionHandler: @escaping (_ result: T?, _ errorService: ServiceError?) -> Void) {
        let request = urlRequest

        dispatch(request) {
            (data, error) in

            if let data = data {
                do {
                    let rawResponse = String(data: data, encoding: .utf8)
                    print(rawResponse ?? "no rawResponse")
                    let resultObject = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(resultObject, nil)
                } catch {
                    completionHandler(nil, ServiceError.unableToDecode)
                }
            }
        }
    }
}




    



