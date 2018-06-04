//
//  AmiiboTableViewController.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 19/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit
import Kingfisher




class AmiiboViewController: UIViewController{

    // MARK: - Properties
    var viewModel = AmiiboViewModel()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGameSeriesLabel: UILabel!
    @IBOutlet weak var characterAmiiboSeriesLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableContainerView: UIView!
    @IBOutlet weak var collectionContainerView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        setup()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func setup(){
        AmiiboViewModel().loadCharacters(viewModel: viewModel, success: {(response) in
            if let response = response {
                self.viewModel = response
            } else {
                debugPrint("Error loadCharacters")
            }
        })
        while viewModel.characters.count == 0 {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    
    func bindDataViewController(indexPath: IndexPath, viewModel: AmiiboViewModel) {
        characterNameLabel.text = viewModel.characters[indexPath.row].name
        characterAmiiboSeriesLabel.text = viewModel.characters[indexPath.row].amiiboSeries
        characterGameSeriesLabel.text = viewModel.characters[indexPath.row].gameSeries
        let url = URL(string: viewModel.characters[indexPath.row].imagePath)
        characterImage.kf.setImage(with: url)
    }
    
    
    // MARK: - Segmented Control Functions
    
    @IBAction func showContainer(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableContainerView.isHidden = false
            collectionContainerView.isHidden = true
            break
        case 1:
            tableContainerView.isHidden = true
            collectionContainerView.isHidden = false
            break
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AmiiboTableViewController" {
            if let table = segue.destination as? AmiiboTableViewController {
                table.dataSource = self
                table.delegate = self
            }
        }
        if segue.identifier == "AmiiboCollectionViewController" {
            if let collection = segue.destination as? AmiiboCollectionViewController {
                collection.dataSource = self
                collection.delegate = self
            }
        }
    }
}


// MARK: - AmiiboTableViewControllerDataSource

extension AmiiboViewController: AmiiboTableViewControllerDataSource {
    
    func amiiboTableViewControllerDataSource(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListTableViewCell", for: indexPath) as? CharacterListTableViewCell{
            let character = viewModel.characters[indexPath.row]
            cell.configureCell(character: character)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func amiiboTableViewControllerDataSource(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
}

// MARK: - AmiiboTableViewControllerDelegate

extension AmiiboViewController: AmiiboTableViewControllerDelegate {

    func amiiboTableViewControllerDelegate(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bindDataViewController(indexPath: indexPath, viewModel: viewModel)
    }
}


// MARK: - AmiiboCollectionViewControllerDataSource

extension AmiiboViewController: AmiiboCollectionViewControllerDataSource {
    func amiiboCollectionViewControllerDataSource(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func amiiboCollectionViewControllerDataSource(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterListCollectionViewCell", for: indexPath) as? CharacterListCollectionViewCell{
            let character = viewModel.characters[indexPath.row]
            cell.configureCell(character: character)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

// MARK: - AmiiboCollectionViewControllerDelegate

extension AmiiboViewController: AmiiboCollectionViewControllerDelegate {
    func amiiboCollectionViewControllerDelegate(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        bindDataViewController(indexPath: indexPath, viewModel: viewModel)
    }

}







