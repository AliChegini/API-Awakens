//
//  IdentificationDetails.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 16/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//


struct IdentificationDetails {
    let idType: IdType
    // might be used later
    //let id: Int
}

extension IdentificationDetails: CustomStringConvertible {
    var description: String {
        return "\(idType)/"
    }
}
