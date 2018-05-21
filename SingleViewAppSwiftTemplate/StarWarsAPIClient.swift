//
//  StarWarsClient.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 15/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

class StarWarsAPIClient {
    
    lazy var baseURL: URL = {
        return URL(string: "https://swapi.co/api/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias JSON = [String: AnyObject]
    
    func getObjects(with identificationDetails: IdentificationDetails, completionHandler completion: @escaping (JSON?, StarWarsError?) -> Void) {
        guard let url = URL(string: identificationDetails.description, relativeTo: baseURL) else {
            completion(nil, .invalidURL)
            return
        }
        
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) { json, error in
            guard let json = json else {
                completion(nil, error)
                return
            }
            
            completion(json, nil)
        }
        
        task.resume()
    }
    
}














