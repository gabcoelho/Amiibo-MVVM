//
//  AmiiboTableViewController.swift
//  AmiiboMVVM
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
    
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterGameSeriesLabel: UILabel!
    @IBOutlet private weak var characterAmiiboSeriesLabel: UILabel!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var tableContainerView: UIView!
    @IBOutlet private weak var collectionContainerView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
    
    func setup(){
        segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        viewModel.initFetch()
        while viewModel.isLoading == true {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
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
    
    func selectedAmiibo(cell: CharacterCellViewModel) {
        characterNameLabel.text = cell.name
        characterAmiiboSeriesLabel.text = cell.amiiboSeries
        characterGameSeriesLabel.text = cell.gameSeries
        characterImage.kf.setImage(with: cell.image)
    }
}


// MARK: - AmiiboTableViewControllerDataSource

extension AmiiboViewController: AmiiboTableViewControllerDataSource {
    
    func amiiboTableViewControllerDataSource(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListTableViewCell", for: indexPath) as? CharacterListTableViewCell{
            let character = viewModel.cellViewModel[indexPath.row]
            cell.configureCell(character: character)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func amiiboTableViewControllerDataSource(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells()
    }
}

// MARK: - AmiiboTableViewControllerDelegate

extension AmiiboViewController: AmiiboTableViewControllerDelegate {

    func amiiboTableViewControllerDelegate(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = viewModel.getSelectedAmiibo(at: indexPath)
        self.selectedAmiibo(cell: cell)
    }

}


// MARK: - AmiiboCollectionViewControllerDataSource

extension AmiiboViewController: AmiiboCollectionViewControllerDataSource {
    func amiiboCollectionViewControllerDataSource(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells()
    }
    
    func amiiboCollectionViewControllerDataSource(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterListCollectionViewCell", for: indexPath) as? CharacterListCollectionViewCell{
            let character = viewModel.cellViewModel[indexPath.row]
            cell.configureCell(character: character)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

// MARK: - AmiiboCollectionViewControllerDelegate

extension AmiiboViewController: AmiiboCollectionViewControllerDelegate {
    
    func amiiboCollectionViewControllerDelegate(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let cell = viewModel.getSelectedAmiibo(at: indexPath)
        self.selectedAmiibo(cell: cell)
    }

}








