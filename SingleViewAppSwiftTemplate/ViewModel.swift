//
//  ViewModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 14/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//


// View Model to format the data for each entity

struct CharacterViewModel {
    let name: String
    let born: String
    let home: String
    let height: Double
    let eyes: String
    let hair: String
    
    init(model: Character) {
        self.name = model.name
        self.born = model.born
        self.home = model.home
        self.height = model.height
        self.eyes = model.eyes
        self.hair = model.hair
    }
}


struct VehicleViewModel {
    var name: String
    var make: String
    var cost: Int
    var length: Double
    var classType: String
    var crew: Int
    
    init(model: Vehicle) {
        self.name = model.name
        self.make = model.make
        self.cost = model.cost
        self.length = model.length
        self.classType = model.classType
        self.crew = model.crew
    }
}


struct StarshipViewModel {
    var name: String
    var make: String
    var cost: Int
    var length: Double
    var classType: String
    var crew: Int
    
    init(model: Starship) {
        self.name = model.name
        self.make = model.make
        self.cost = model.cost
        self.length = model.length
        self.classType = model.classType
        self.crew = model.crew
    }
}












