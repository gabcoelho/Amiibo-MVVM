//
//  AmiiboViewModel.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 24/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import Foundation

class AmiiboViewModel {

    // MARK: - Properties
    
    var characterSelected: Character?
    var characters = [Character]()
    var cellViewModel: [CharacterCellViewModel] = [CharacterCellViewModel]()

    // MARK: - Closures
    
    var updateLoadingStatus: (() -> ())?
    
    var isLoading: Bool = false{
        didSet {
            self.updateLoadingStatus?()
        }
    }

    
    // MARK: - Getting Data

    private func loadCharacters() {
        self.isLoading = true
        fetchListOfCharacters(success: {(response) in
            if let response = response {
                self.characters = response
                self.isLoading = false
                self.processFetchedCharacter(character: self.characters)
            } else {
                debugPrint("dafuq")
            }
        }, completion: {
            debugPrint("completion?")
        })
    }
    
    private func fetchListOfCharacters(success: @escaping (_ response: [Character]?) -> Void,
                          completion: (() -> Void)? = nil){
        AmiiboService().getAmiiboList(completionHandler: { (_ response: [Character]?, _ errorService: ServiceError?) in
            if let response = response {
                self.characters = response
                success(response)
            } else {
            }
            completion?()
        }
    )}
    
    // MARK: - Init
    
    func initFetch() {
        loadCharacters()
    }
    
    
    // MARK: - DataSource
    
    func getSelectedAmiibo(at indexPath: IndexPath) -> CharacterCellViewModel {
        return cellViewModel[indexPath.row]
    }
    
    func numberOfCells() -> Int {
        return cellViewModel.count
    }
    
    private func processFetchedCharacter(character: [Character] ) {
        self.characters = character
        var arrayOfCharactersCells = [CharacterCellViewModel]()
        for character in characters {
            arrayOfCharactersCells.append(createCellViewModel(character: character))
        }
        self.cellViewModel = arrayOfCharactersCells
    }

}


