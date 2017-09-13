//
//  Networking.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/7/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation

class Networking {
    
    static func callApi (url:String, completion:@escaping (Error?, Data?)->()) {
        
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            completion(error, data)
        }
        task.resume()
    }
}
