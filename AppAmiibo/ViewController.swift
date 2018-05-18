//
//  ViewController.swift
//  AppAmiibo
//
//  Created by Gabriela Coelho on 16/05/18.
//  Copyright © 2018 Gabriela Coelho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var character: Character!
    var characters: [Character]?
    var errorService: ServiceError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AmiiboService().getAmiiboList(completionHandler: {
            (_ response: [Character]?, _ errorService: ServiceError?) in
            if let response = response {
                debugPrint("Response")
                self.characters = response
                print(self.characters ?? "character")
            } else {
                debugPrint("no characters")
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

