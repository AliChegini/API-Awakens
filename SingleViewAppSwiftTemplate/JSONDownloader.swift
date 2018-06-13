//
//  JSONDownloader.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Ehsan on 15/05/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

class JSONDownloader {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    
    func dataTask(with request: URLRequest, completionHandler completion: @escaping (Data?, StarWarsError?) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    //how to throw error or show an alert to user ?
                    //throw StarWarsError.noInternetConnection
                case .networkConnectionLost:
                    print("Connection down!")
                    
                default: break
                }
            }
            
            // Convert to HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    completion(data, nil)
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
            
        }
        return task
        
    }
    
    
    
    
    
    
}

















