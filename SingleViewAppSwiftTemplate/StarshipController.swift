//
//  StarshipController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 18/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class StarshipController: UIViewController {

    let client = StarWarsAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Starships"

        let starships = IdentificationDetails(idType: .starships)
        print("before completion handler")
        client.getObjects(with: starships) { starships, error in
            print("starships \(starships)")
            print("Error \(error)")
            print("inside completion handler")
            
            let decoder = JSONDecoder()
            guard let starships = starships else {
                print("starship is empty")
                return
            }
            
            let st = try! decoder.decode(Starship.self, from: starships)
            
            print(st.name)
        }
        
        print("after completion handler")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
