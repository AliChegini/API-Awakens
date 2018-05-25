//
//  JSONParser.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 21/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation


struct Result: Decodable {
    var name: String?
    var make: String?
    var cost: String?
    var length: String?
    var classType: String?
    var crew: String?
    
    var born: String?
    var home: String?
    var height: String?
    var eyes: String?
    var hair: String?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case classType
        case crew
        case born
        case home
        case height
        case eyes
        case hair
    }
}



struct AllResults: Decodable {
    let results: [Result]
}















