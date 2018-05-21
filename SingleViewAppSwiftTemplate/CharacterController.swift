//
//  CharacterController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 18/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class CharacterController: UIViewController {

    let client = StarWarsAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Characters"
        
        
        let characters = IdentificationDetails(idType: .people)
        
        client.getObjects(with: characters) { characters, error in
            print(characters)
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
