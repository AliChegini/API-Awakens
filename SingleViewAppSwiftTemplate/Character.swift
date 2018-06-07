//
//  Character.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 17/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

struct Character: UnifiedObjects, Codable {
    var name: String?
    var born: String?
    var home: String?
    var height: Double?
    var eyes: String?
    var hair: String?
    
    var make: String? = nil
    var cost: String? = nil
    var length: Double? = nil
    var classType: String? = nil
    var crew: String? = nil
    
    init?(name: String?, born: String?, home: String?, height: String?, eyes: String?, hair: String?) {
        self.name = name
        self.born = born
        self.home = home
        self.eyes = eyes
        self.hair = hair
        
        guard let heightUnwrapped = height else {
            return nil
        }
        self.height = Double(heightUnwrapped)
    }
}


extension Character: Sortable {
    var sortDescriptor: Double {
        return self.height!
    }
}


