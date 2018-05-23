//
//  Starship.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 17/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

struct Starship: UnifiedObjects, Codable {
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


struct Starships {
    let starships: [Starship]
    
    struct ResultsCodingKeys: CodingKey {
        let stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
        
        static let results = ResultsCodingKeys(stringValue: "results")!
    }
    
    enum StarshipCodingKeys: String, CodingKey {
        case name
        case make
        case cost
        case length
        case classType
        case crew
    }
    
}



extension Starships: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsCodingKeys.self)
        let starshipsContainer = try container.nestedContainer(keyedBy: ResultsCodingKeys.self, forKey: .results)
        
        self.starships = try starshipsContainer.allKeys.map { key in
            let starshipContainer = try starshipsContainer.nestedContainer(keyedBy: StarshipCodingKeys, forKey: key)
            
            let result = key.stringValue
            let name = try starshipContainer.decode(String.self, forKey: .name)
            
            return Starship(name: name, make: nil, cost: nil, length: 0.0, classType: "Dingo", crew: 32)
            
        }
        
    }
}







