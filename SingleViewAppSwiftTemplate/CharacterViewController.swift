//
//  TableViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 28/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class CharacterViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let client = StarWarsAPIClient()
    var fullInfo: [Result] = []
   
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var home: UILabel!
    @IBOutlet weak var eyes: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var born: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
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
        home.text = fullInfo[row].home
        eyes.text  = fullInfo[row].eyes
        hair.text = fullInfo[row].hair
        
    }
    
}
