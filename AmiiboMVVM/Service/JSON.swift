//
//  JSON.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 17/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

class JSON {
    class func serialize(dictionary: [String: Any]) -> Data? {
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return jsonData
        } catch {
            return nil
        }
    }
    
    class func deserialize(data: Data) -> [String: Any]? {
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return jsonDict as? [String: Any]
        } catch {
            return nil
        }
    }
}
