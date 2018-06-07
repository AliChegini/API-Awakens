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
    // array to hold the characters
    var allCharacters: [Character] = []
    
    
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
                    self.allCharacters.append(characterUnwrapped)
                }
            }
            
            self.allCharacters.sort(by: { $0.sortDescriptor > $1.sortDescriptor })
            
            
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
        return allCharacters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allCharacters[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        name.text = allCharacters[row].name
        
        // To get the home name
        //////////////////////////////
        // I believe this part can be refactored to be better but I don't know how
        client.getHomeName(with: allCharacters[row].home!) { home, error in
            let decoder = JSONDecoder()
            guard let homeUnwrapped = home else {
                print("home is empty")
                return
            }
            
            let homePlanet = try! decoder.decode(Home.self, from: homeUnwrapped)
            if let homeNameUnwrapped = homePlanet.name {
                let homeName = homeNameUnwrapped
                DispatchQueue.main.async {
                    self.home.text = homeName
                }
            }
        }
        ////////////////////////////////
        
        eyes.text  = allCharacters[row].eyes
        hair.text = allCharacters[row].hair
        born.text = allCharacters[row].born
        height.text = allCharacters[row].height?.description
        
        smallest.text = allCharacters.last?.name
        largest.text = allCharacters.first?.name
    }
    
}
