//
//  VehicleViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 02/06/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class VehicleViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let client = StarWarsAPIClient()
    // array to hold the Vehicles
    var allVehicles: [Vehicle] = []
    let englishUnit = 39.37 // 1 meter is 39.37 inches
    var returnedLength: Double? = nil
    var returnedCost: Double? = nil
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var classType: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var exchange: UITextField!
    
    @IBOutlet weak var smallest: UILabel!
    @IBOutlet weak var largest: UILabel!
    
    @IBOutlet weak var exchangeRate: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Vehicles"
        exchange.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
        let vehicles = IdentificationDetails(idType: .vehicles)
        
        client.getObjects(with: vehicles) { vehicles, error in
            let decoder = JSONDecoder()
            guard let vehicles = vehicles else {
                print("vehicles is empty")
                return
            }
            
            let allResults = try? decoder.decode(AllResults.self, from: vehicles)
            if let allResultsUnwrapped = allResults {
                for result in allResultsUnwrapped.results {
                    let vehicle = Vehicle(name: result.name, make: result.make, cost: result.cost, length: result.length, classType: result.vehicleClassType, crew: result.crew)
                    if let vehicleUnwrapped = vehicle {
                        self.allVehicles.append(vehicleUnwrapped)
                    }
                }
                
                self.allVehicles.sort(by: { $0.sortDescriptor > $1.sortDescriptor })
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
        return allVehicles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allVehicles[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = allVehicles[row].name
        make.text = allVehicles[row].make
        cost.text = allVehicles[row].cost
        if let costUnwrapped = allVehicles[row].cost {
            returnedCost = Double(costUnwrapped)
        }
        
        length.text  = allVehicles[row].length?.description
        returnedLength = allVehicles[row].length
        
        classType.text = allVehicles[row].classType
        crew.text = allVehicles[row].crew
        
        smallest.text = allVehicles.last?.name
        largest.text = allVehicles.first?.name
    }
    
}
