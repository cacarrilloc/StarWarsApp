//
//  ViewModel2.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 9/10/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate2:class{
    func updateTableView(array: [SWCharacter])
}

class ViewModel2 {
    
    var masterArray:[SWCharacter]?
    weak var ViewController2:VMDelegate2?
    
    init(delegate:VMDelegate2? = nil){
        self.ViewController2 = delegate
    }
    
    func getCharacters (url: String){
        Networking.callApi(url: url) {
            [weak self] (error, data) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                guard let dict = json as? [String:Any] else {return}
                guard let results = dict["results"] as? [[String:Any]] else {return}
                let characters:[SWCharacter] = results.flatMap{
                    try? SWCharacter(json: $0)
                }
                self?.addCharacters(array: characters)
                guard let next = dict["next"] as? String else {return}
                self?.getCharacters(url: next)

            } catch let error {
                print(error.localizedDescription)
            }
            print ("getCharacters")
        }
    }
    
    func addCharacters (array:[SWCharacter]){
        if self.masterArray != nil {
            for obj in array {
                self.masterArray?.append(obj)
            }
        } else { self.masterArray = array }
        
        guard let arrayOut = masterArray else {return}
        ViewController2?.updateTableView(array: arrayOut)
    }
    
    func getCounter() -> Int {
        guard let counter = masterArray?.count else {return 0}
        return counter
    }
    
    func getName(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let name = array.flatMap{$0.name}
        return name[index]
    }
    
    func getGender(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let gender = array.flatMap{$0.gender}
        return gender[index]
    }
    
    func getBD(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let BD = array.flatMap{$0.birthYear}
        return BD[index]
    }
    
    func getMass(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let mass = array.flatMap{$0.mass}
        return mass[index]
    }
    
    func getSpeciesUrl(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let specie = array.flatMap{$0.speciesUrl}
        return specie[index]
    }
    
    func getHomeworldUrl(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let homeworld = array.flatMap{$0.homeworldUrl}
        return homeworld[index]
    }
    
    func getCharacterData(index: Int) -> [String]{
        var output:[String] = []
        let name = self.getName(index: index)
        output.append(name)
        let gender = self.getGender(index: index)
        output.append(gender)
        let BD = self.getBD(index: index)
        output.append(BD)
        let mass = self.getMass(index: index)
        output.append(mass)
        let species = self.getSpeciesUrl(index: index)
        output.append(species)
        let homeWorld = self.getHomeworldUrl(index: index)
        output.append(homeWorld)
        return output
    }
}



