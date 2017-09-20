//
//  Networking.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/7/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class Networking {
    
    static func callApi (url:String, completion:@escaping (Error?, Data?)->()) {
        Alamofire.request(url, method: .get).responseString { response in
                guard let data = response.data else {return}
                completion(response.error, data)
        }
    }
}
