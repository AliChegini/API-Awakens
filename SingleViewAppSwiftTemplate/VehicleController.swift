//
//  VehicleController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 18/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class VehicleController: UIViewController {
    
    let client = StarWarsAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Vehicles"
        
        let vehicles = IdentificationDetails(idType: .vehicles)
        
        client.getObjects(with: vehicles) { vehicles, error in
            print(vehicles!)
            print(error!)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
