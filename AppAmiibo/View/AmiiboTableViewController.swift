//
//  AmiiboTableViewController.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 19/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit
import Kingfisher

class AmiiboTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    var character: Character!
    var characters = [Character]()
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGameSeriesLabel: UILabel!
    @IBOutlet weak var characterAmiiboSeriesLabel: UILabel!
    
    @IBOutlet weak var charactersListTableView: UITableView!
    
    
    override func viewDidLoad() {
        listOfCharacters()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 
    
    func listOfCharacters(){
        AmiiboService().getAmiiboList(completionHandler: { (_ response: [Character]?, _ errorService: ServiceError?) in
            if let response = response {
                self.characters = response
                DispatchQueue.main.async {
                    self.charactersListTableView.reloadData()
                }
            } else {
                debugPrint("no characters")
            }
        })
    }

    func amiiboSelectedDetails(character: Character) {
        characterNameLabel.text = character.name
        characterAmiiboSeriesLabel.text = character.amiiboSeries
        characterGameSeriesLabel.text = character.gameSeries
        let url = URL(string: character.imagePath)
        characterImage.kf.setImage(with: url)
    }
    
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = charactersListTableView.dequeueReusableCell(withIdentifier: "CharacterListTableViewCell", for: indexPath) as? CharacterListTableViewCell{
            let c = self.characters[indexPath.row]
            cell.configureCell(character: c)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let c = characters[indexPath.row]
        amiiboSelectedDetails(character: c)
    }

}
