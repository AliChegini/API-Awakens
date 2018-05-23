//
//  JSONParser.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 21/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

let decoder = JSONDecoder()
let client = StarWarsAPIClient()


struct Result {
    let name: String
    let make: String
    let cost: Int
    let length: Double
    let classType: String
    let crew: Int
}


struct AllResults {
    let results: [Result]
    
    struct AllResultsCodingKeys: CodingKey {
        let stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
        
        static let results = AllResultsCodingKeys(stringValue: "results")!
    }
    
    
    enum ResultCodingKeys: String, CodingKey {
        case name
        case make
        case cost
        case length
        case classType
        case crew
    }
    
    
}



extension AllResults: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AllResultsCodingKeys.self)
        
        // I used unkeyedContainer because in response from API, each result does not have key
        // It is an array of result with no key
        let resultsContainer = try container.nestedUnkeyedContainer(forKey: .results)
        
        // Not sure how to get the name
        //let name = try resultsContainer.decode(???)
        
            
        //return Starship(name: name, make: nil, cost: nil, length: 0.0, classType: "Dingo", crew: 32)
        
    }
}














