//
//  StarshipViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 02/06/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class StarshipViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let client = StarWarsAPIClient()
    var fullInfo: [Result] = []

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var classType: UILabel!
    @IBOutlet weak var crew: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var smallest: UILabel!
    @IBOutlet weak var largest: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Starships"
        
        let starships = IdentificationDetails(idType: .starships)
        
        client.getObjects(with: starships) { starships, error in
            let decoder = JSONDecoder()
            guard let starships = starships else {
                print("vehicles is empty")
                return
            }
            
            let allResults = try! decoder.decode(AllResults.self, from: starships)
            for result in allResults.results {
                self.fullInfo.append(result)
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
        return fullInfo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fullInfo[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = fullInfo[row].name
        make.text = fullInfo[row].make
        cost.text = fullInfo[row].cost
        length.text  = fullInfo[row].length
        classType.text = fullInfo[row].starshipClassType
        crew.text = fullInfo[row].crew
    }

}
