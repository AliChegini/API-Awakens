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
    case vehicles
    case starships
}


protocol UnifiedObjects {
    var name: String? { get set }
    var make: String? { get set }
    var cost: String? { get set }
    var length: Double? { get set }
    var classType: String? { get set }
    var crew: String? { get set }
    var born: String? { get set }
    var home: String? { get set }
    var height: Double? { get set }
    var eyes: String? { get set }
    var hair: String? { get set }
    
}


protocol Sortable {
    associatedtype SortableType: Comparable
    var sortDescriptor: SortableType { get }
}




