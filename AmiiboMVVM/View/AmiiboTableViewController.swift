//
//  AmiiboTableViewController.swift
//  AmiiboMVVM
//
//  Created by Gabriela Coelho on 21/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit

// MARK: Protocols

protocol AmiiboTableViewControllerDataSource {
    func amiiboTableViewControllerDataSource(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func amiiboTableViewControllerDataSource(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, numberOfRowsInSection section: Int) -> Int    
}

protocol AmiiboTableViewControllerDelegate {
    func amiiboTableViewControllerDelegate(_ amiiboTableViewController: AmiiboTableViewController, tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

class AmiiboTableViewController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: AmiiboTableViewControllerDelegate?
    var dataSource: AmiiboTableViewControllerDataSource!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var charactersListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDataSource
extension AmiiboTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.amiiboTableViewControllerDataSource(self, tableView: tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource.amiiboTableViewControllerDataSource(self,tableView: tableView, cellForRowAt: indexPath)
    }
    
}

// MARK: - UITableViewDelegate

extension AmiiboTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return (delegate?.amiiboTableViewControllerDelegate(self, tableView: tableView, didSelectRowAt: indexPath))!
    }
    
}

// MARK: - UITableView Height

extension AmiiboTableViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
}




