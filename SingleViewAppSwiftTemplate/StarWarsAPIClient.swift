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
    
    
    func getObjects(with identificationDetails: IdentificationDetails, completionHandler completion: @escaping (Data?, StarWarsError?) -> Void) {
        guard let url = URL(string: identificationDetails.description, relativeTo: baseURL) else {
            completion(nil, .invalidURL)
            return
        }
        
        let request = URLRequest(url: url)
        
        print(request)
        
        let task = downloader.dataTask(with: request) { data, error in
            guard let data = data else {
                completion(nil, error)
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet:
                        print("Connection down!")
                    default: break
                    }
                }
                return
            }
            
            completion(data, nil)
        }
        
        task.resume()
    }
    
    
    func getHomeName(with url: String, completionHandler completion: @escaping (Data?, StarWarsError?) -> Void ) {
        let request = URLRequest(url: URL(string: url)!)
        
        let task = downloader.dataTask(with: request) { data, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            completion(data, nil)
        }
        
        task.resume()
        
    }
    
}














