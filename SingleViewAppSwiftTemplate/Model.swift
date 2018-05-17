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


enum IdType: String {
    case people
    case vehicle
    case starship
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




