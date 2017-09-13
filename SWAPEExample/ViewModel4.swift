//
//  ViewModel4.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/12/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate4:class{
    func passCharacterData(array: [String])
}

class ViewModel4 {
    
    var homeworldArray:[String] = []
    
    weak var ViewController4:VMDelegate4?
    
    init(delegate:VMDelegate4? = nil){
        self.ViewController4 = delegate
    }
    
    func getCharacterHomeworld(homeworldUrl: String) {
        Networking.callApi(url: homeworldUrl) {
            [weak self] (error, data) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                guard let dictionary = json as? [String:Any] else {return}
                let homeworldInfo = try? SWCharacterHomeworld(dict: dictionary)
                
                guard let nameIn = homeworldInfo?.name else {return}
                self?.homeworldArray.append(nameIn)
                print(nameIn)
                
                guard let diameterIn = homeworldInfo?.diameter else {return}
                self?.homeworldArray.append(diameterIn)
                print(diameterIn)
                
                guard let climateIn = homeworldInfo?.climate else {return}
                self?.homeworldArray.append(climateIn)
                print(climateIn)
                
                guard let populationIn = homeworldInfo?.population else {return}
                self?.homeworldArray.append(populationIn)
                print(populationIn)
                
                guard let finalArray = self?.homeworldArray else {return}
                self?.ViewController4?.passCharacterData(array: finalArray)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        print ("getCharacterHomeworld")
    }
}

