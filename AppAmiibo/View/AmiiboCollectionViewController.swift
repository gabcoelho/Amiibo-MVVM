//
//  AmiiboCollectionViewController.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 21/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit


// MARK: - Protocols

protocol AmiiboCollectionViewControllerDataSource {
    func amiiboCollectionViewControllerDataSource(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func amiiboCollectionViewControllerDataSource(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

protocol AmiiboCollectionViewControllerDelegate {
    func amiiboCollectionViewControllerDelegate(_ amiiboCollectionViewController: AmiiboCollectionViewController, collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}


class AmiiboCollectionViewController: UIViewController {

    // MARK: - Properties

    var delegate: AmiiboCollectionViewControllerDelegate?
    var dataSource: AmiiboCollectionViewControllerDataSource!

    // MARK: - IBOutlets

    @IBOutlet private weak var characterListCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionViewFlowLayout.minimumInteritemSpacing = 5
    }

}


// MARK: - CollectionViewDataSource

extension AmiiboCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.amiiboCollectionViewControllerDataSource(self, collectionView: collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dataSource.amiiboCollectionViewControllerDataSource(self, collectionView: collectionView, cellForItemAt: indexPath)
    }
    
}

// MARK: - CollectionViewDelegate

extension AmiiboCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return (delegate?.amiiboCollectionViewControllerDelegate(self, collectionView: collectionView, didSelectItemAt: indexPath))!
    }
}


// MARK: - CollectionViewFlowLayout

extension AmiiboCollectionViewController: UICollectionViewDelegateFlowLayout {

    //Size of one cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let frame: CGRect = self.view.frame
        let margin = (frame.width - 140 * 2)/3
        return UIEdgeInsetsMake(5, margin, 5, margin)
    }
    
}







