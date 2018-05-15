//
//  Model.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 14/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//


enum MetricationType {
    case English
    case Metric
}


enum costType {
    case USD
    case Credits
}


struct Character {
    let name: String
    let born: String
    let home: String
    let height: Double
    let eyes: String
    let hair: String
}


// Common attributes for starships and vehicles
protocol CommonAttributes {
    var name: String { get set }
    var make: String { get set }
    var cost: Int { get set }
    var length: Double { get set }
    var classType: String { get set }
    var crew: Int { get set }
}


struct Vehicle: CommonAttributes {
    var name: String
    var make: String
    var cost: Int
    var length: Double
    var classType: String
    var crew: Int
}


struct Starship: CommonAttributes {
    var name: String
    var make: String
    var cost: Int
    var length: Double
    var classType: String
    var crew: Int
}














