//
//  Vehicle.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 17/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

struct Vehicle: UnifiedObjects, Codable {
    var name: String?
    var make: String?
    var cost: String?
    var length: Double?
    var classType: String?
    var crew: String?
    
    var born: String? = nil
    var home: String? = nil
    var height: Double? = nil
    var eyes: String? = nil
    var hair: String? = nil
    
    init?(name: String?, make: String?, cost: String?, length: String?, classType: String?, crew: String?) {
        self.name = name
        self.make = make
        self.cost = cost
        self.classType = classType
        self.crew = crew
        
        guard let lengthUnwrapped = length else {
            return nil
        }
        
        self.length = Double(lengthUnwrapped)
    }

}


extension Vehicle: Sortable {
    var sortDescriptor: Double {
        return self.length!
    }
}








