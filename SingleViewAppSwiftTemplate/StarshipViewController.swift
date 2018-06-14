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
    // array to hold the Vehicles
    var allStarships: [Starship] = []
    let englishUnit = 39.37  // 1 meter is 39.37 inches
    var returnedLength: Double? = nil
    var returnedCost: Double? = nil
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var classType: UILabel!
    @IBOutlet weak var crew: UILabel!
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var smallest: UILabel!
    @IBOutlet weak var largest: UILabel!
    
    @IBOutlet weak var exchangeRate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Starships"
        
        self.hideKeyboardWhenTappedAround()
        
        let starships = IdentificationDetails(idType: .starships)
        
        client.getObjects(with: starships) { starships, error in
            let decoder = JSONDecoder()
            guard let starships = starships else {
                print("vehicles is empty")
                return
            }
            
            let allResults = try? decoder.decode(AllResults.self, from: starships)
            if let allResultsUnwrapped = allResults {
                for result in allResultsUnwrapped.results {
                    let starship = Starship(name: result.name, make: result.make, cost: result.cost, length: result.length, classType: result.starshipClassType, crew: result.crew)
                    if let starshipUnwrapped = starship {
                        self.allStarships.append(starshipUnwrapped)
                    }
                }
                self.allStarships.sort(by: { $0.sortDescriptor > $1.sortDescriptor })
            // branch to handle missing key/element in JSON file
            } else {
                let alert = UIAlertController(title: "Error", message: "Oops, something went wrong \nPlease try again later...", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
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
    
    
    @IBAction func convertToEnglishUnit(_ sender: UIButton) {
        if let currentValue = returnedLength {
            let result = currentValue * englishUnit
            length.text = "\(result) Inches"
        }
    }
    
    
    @IBAction func convertToMetricUnit(_ sender: UIButton) {
        if let currentValue = returnedLength {
            length.text = "\(currentValue) Meter"
        }
    }
    
    
    @IBAction func convertToUSD(_ sender: UIButton) {
        if let insertedRate = Double(exchangeRate.text!) {
            if insertedRate > 0 {
                if let returnedCostUnwrapped = returnedCost {
                    let result = insertedRate * returnedCostUnwrapped
                    cost.text = "\(result)"
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "Rate must be bigger than zero \nPlease try again later...", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    

    
    // helper functions for pickerView ----------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allStarships.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allStarships[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = allStarships[row].name
        make.text = allStarships[row].make
        cost.text = allStarships[row].cost
        if let costUnwrapped = allStarships[row].cost {
            returnedCost = Double(costUnwrapped)
        }
        length.text  = allStarships[row].length?.description
        returnedLength = allStarships[row].length
        
        classType.text = allStarships[row].classType
        crew.text = allStarships[row].crew
        
        smallest.text = allStarships.last?.name
        largest.text = allStarships.first?.name
    }

}
