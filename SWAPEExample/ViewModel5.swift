//
//  ViewModel5.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/12/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate5:class{
    func passCharacterData(array: [String])
}

class ViewModel5 {
    
    var spicieArray:[String] = []
    
    weak var ViewController5:VMDelegate5?
    
    init(delegate:VMDelegate5? = nil){
        self.ViewController5 = delegate
    }
    
    
    func getCharacterSpecie(specieUrl: String) {
        Networking.callApi(url: specieUrl) {
            [weak self] (error, data) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            do{
                
                let json = try JSONSerialization.jsonObject(with: data)
                guard let dictionary = json as? [String:Any] else {return}
                let homeworldInfo = try? SWCharacterSpecie(dict: dictionary)
                
                guard let nameIn = homeworldInfo?.name else {return}
                self?.spicieArray.append(nameIn)
                print(nameIn)
                
                guard let languageIn = homeworldInfo?.language else {return}
                self?.spicieArray.append(languageIn)
                print(languageIn)
                
                guard let skin_colorsIn = homeworldInfo?.skin_colors else {return}
                self?.spicieArray.append(skin_colorsIn)
                print(skin_colorsIn)
                
                guard let hair_colorsIn = homeworldInfo?.hair_colors else {return}
                self?.spicieArray.append(hair_colorsIn)
                print(hair_colorsIn)
                
                guard let designationIn = homeworldInfo?.designation else {return}
                self?.spicieArray.append(designationIn)
                print(designationIn)
                
                guard let averageLifespanIn = homeworldInfo?.average_lifespan else {return}
                self?.spicieArray.append(averageLifespanIn)
                print(averageLifespanIn)
                
                guard let finalArray = self?.spicieArray else {return}
                self?.ViewController5?.passCharacterData(array: finalArray)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        print ("getCharacterSpecie")
    }
    
}


