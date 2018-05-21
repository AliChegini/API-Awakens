//
//  Character.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 17/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

struct Character: UnifiedObjects {
    var name: String?
    var born: String?
    var home: String?
    var height: Double?
    var eyes: String?
    var hair: String?
    
    var make: String? = nil
    var cost: Int? = nil
    var length: Double? = nil
    var classType: String? = nil
    var crew: Int? = nil
    
    init(name: String?, born: String?, home: String?, height: Double?, eyes: String?, hair: String?) {
        self.name = name
        self.born = born
        self.home = home
        self.height = height
        self.eyes = eyes
        self.hair = hair
    }
}


let char = Character(name: "as", born: "as", home: "as", height: 12.0, eyes: "brown", hair: "blue")

