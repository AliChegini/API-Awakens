//
//  StarshipController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 18/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class StarshipController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let client = StarWarsAPIClient()
    var names: [String] = []
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Starships"
        let starships = IdentificationDetails(idType: .starships)
        
        client.getObjects(with: starships) { starships, error in
            let decoder = JSONDecoder()
            guard let starships = starships else {
                print("starship is empty")
                return
            }
            
            let allResults = try! decoder.decode(AllResults.self, from: starships)
            for result in allResults.results {
                self.names.append(result.name!)
            }
            
            DispatchQueue.main.async {
                self.pickerView.delegate = self
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // helper functions for pickerView ----------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = names[row]
    }

}
