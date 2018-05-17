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
    
    func getCharacters(with identificationDetails: IdentificationDetails, completionHandler completion: @escaping (Character?, StarWarsError?) -> Void) {
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
            
            print(json)
        }
        
        task.resume()
    }
    
    
    func getVehicles(with identificationDetails: IdentificationDetails, completionHandler completion: @escaping (Vehicle?, StarWarsError?) -> Void) {
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
            
            print(json)
        }
        
        task.resume()
    }
    
    
    func getStarships(with identificationDetails: IdentificationDetails, completionHandler completion: @escaping (Starship?, StarWarsError?) -> Void) {
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
            
            print(json)
        }
        
        task.resume()
    }
    
    
    
    
    
}














