//
//  JSONParser.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 21/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation


struct Result: Decodable {
    let name: String
    let manufacturer: String
}


struct AllResults: Decodable {
    
    
    let results: [Result]
    
}















