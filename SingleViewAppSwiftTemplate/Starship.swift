//
//  Starship.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 17/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

struct Starship: UnifiedObjects {
    var name: String?
    var make: String?
    var cost: Int?
    var length: Double?
    var classType: String?
    var crew: Int?
    
    var born: String? = nil
    var home: String? = nil
    var height: Double? = nil
    var eyes: String? = nil
    var hair: String? = nil
    
    init(name: String?, make: String?, cost: Int?, length: Double?, classType: String?, crew: Int?) {
        self.name = name
        self.make = make
        self.cost = cost
        self.length = length
        self.classType = classType
        self.crew = crew
    }
}









