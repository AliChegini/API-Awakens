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
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Characters"
        
        let characters = IdentificationDetails(idType: .people)
        
        client.getObjects(with: characters) { characters, error in
            let decoder = JSONDecoder()
            guard let characters = characters else {
                print("characters is empty")
                return
            }
            
            let allResults = try! decoder.decode(AllResults.self, from: characters)
            for result in allResults.results {
                self.names.append(result.name!)
            }
            
            DispatchQueue.main.async {
                //self.pickerView.delegate = self
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
