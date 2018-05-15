//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("We are good to go!")
        
        let character = Character(name: "Ali", born: "000", home: "000", height: 177.0, eyes: "brown", hair: "brown")
        let characterViewModel = CharacterViewModel(model: character)
        name.text = characterViewModel.name
        
        
        let base = URL(string: "https://swapi.co/api/")
        guard let finalURL = URL(string: "people/1/", relativeTo: base) else { return }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let request = URLRequest(url: finalURL)
        print("log before request on main thread")
        let dataTask = session.dataTask(with: request) { data, response, error in
            print("log inside completion handler")
        }
        
        dataTask.resume()
        print("log after resume")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

