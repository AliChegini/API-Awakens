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
    // array to hold the characters
    var characters: [Character] = []
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var home: UILabel!
    @IBOutlet weak var eyes: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var born: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var smallest: UILabel!
    @IBOutlet weak var largest: UILabel!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Characters"
        
        let people = IdentificationDetails(idType: .people)
        
        client.getObjects(with: people) { characters, error in
            let decoder = JSONDecoder()
            guard let characters = characters else {
                print("characters is empty")
                return
            }
            
            let allResults = try! decoder.decode(AllResults.self, from: characters)
            for result in allResults.results {
                let character = Character(name: result.name, born: result.born, home: result.home, height: result.height, eyes: result.eyes, hair: result.hair)
                if let characterUnwrapped = character {
                    self.characters.append(characterUnwrapped)
                }
                
            }
            
            print(characters.count)
            
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
        return characters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characters[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = characters[row].name
        home.text = characters[row].home
        eyes.text  = characters[row].eyes
        hair.text = characters[row].hair
        born.text = characters[row].born
        //height.text = characters[row].height
        
        //smallest.text = returnMin(array: fullInfo).name
        //largest.text = returnMax(array: fullInfo).name
    }
    
}
