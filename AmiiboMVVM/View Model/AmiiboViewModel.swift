//
//  AmiiboViewModel.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 24/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

class AmiiboViewModel {

    var characters = [Character]()
    
    // MARK: - Getting Data
    
    func loadCharacters(viewModel: AmiiboViewModel, success: @escaping (_ response: AmiiboViewModel?) -> Void) {
        listOfCharacters(success: {(response) in
            if let response = response {
                viewModel.characters = response
                success(viewModel)
            } else {
                debugPrint("dafuq")
            }
        }, completion: {
            debugPrint("completion?")
        })
    }
    
    
    func listOfCharacters(success: @escaping (_ response: [Character]?) -> Void,
                          completion: (() -> Void)? = nil){
        AmiiboService().getAmiiboList(completionHandler: { (_ response: [Character]?, _ errorService: ServiceError?) in
            if let response = response {
                self.characters = response
                success(response)
            } else {
                debugPrint("no characters")
            }
            completion?()
        }
    )}
    
}
