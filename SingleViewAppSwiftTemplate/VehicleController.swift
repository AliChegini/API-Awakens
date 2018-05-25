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
    var names: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Vehicles"
        
        let vehicles = IdentificationDetails(idType: .vehicles)
        
        client.getObjects(with: vehicles) { vehicles, error in
            let decoder = JSONDecoder()
            guard let vehicles = vehicles else {
                print("vehicles is empty")
                return
            }
            
            let allResults = try! decoder.decode(AllResults.self, from: vehicles)
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
