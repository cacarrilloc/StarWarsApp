//
//  SWCharacter.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/7/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation

enum SWCharError:Error {
    case NoCharacterName
    case NoCharacterBD
    case NoCharacterGender
    case NoCharacterSpecies
    case NoCharacterHomeworld
}

extension SWCharError:LocalizedError {
    public var errorDescription:String?{
        switch self {
        case .NoCharacterName:
            return NSLocalizedString("No Character Name", comment: "Json did not have name")
        case .NoCharacterBD:
            return NSLocalizedString("No Character DB", comment: "Json did not have DB")
        case .NoCharacterGender:
            return NSLocalizedString("No Character Gender", comment: "Json did not have Gender")
        case .NoCharacterSpecies:
            return NSLocalizedString("No Character Species", comment: "Json did not have Species")
        case .NoCharacterHomeworld:
            return NSLocalizedString("No Character homeland", comment: "Json did not have Homeland")
        }
    }
}

class SWCharacter {
    
    let name:String
    let mass:String
    let gender:String
    let speciesUrl:[String]
    let homeworldUrl:String
    let birthYear:String
    
    init(json:[String:Any]) throws {
        guard let name = json["name"] as? String else {
            throw SWCharError.NoCharacterName}
        let nameOut = "\(name)"
        self.name = nameOut
        print("CHARACTER1: ",nameOut)
        
        guard let mass = json["mass"] as? String else {
            throw SWCharError.NoCharacterBD}
        let massOut = "Mass: \(mass)"
        self.mass = massOut
        print("CHARACTER2: ",massOut)
        
        guard let birthYear = json["birth_year"] as? String else {
            throw SWCharError.NoCharacterBD}
        let birthYearOut = "Birth Year: \(birthYear)"
        self.birthYear = birthYearOut
        print("CHARACTER3: ",birthYearOut)
        
        guard let gender = json["gender"] as? String else {
            throw SWCharError.NoCharacterGender}
        let genderOut = "Gender: \(gender)"
        self.gender = genderOut
        print("CHARACTER4: ",genderOut)
        
        guard let species = json["species"] as? [String] else {
            throw SWCharError.NoCharacterSpecies}
        self.speciesUrl = species
        print("SPECIES: ",species)
        
        guard let homeWorld = json["homeworld"] as? String else {
            throw SWCharError.NoCharacterHomeworld}
        self.homeworldUrl = homeWorld
        print("HOMEWORLD_URL: ",homeWorld)
    }
}


class SWCharacterSpecie {
    let name:String
    let language:String
    let skin_colors:String
    let hair_colors:String
    let designation:String
    let average_lifespan:String
    
    init(dict:[String:Any]) throws {
        
        guard let nameIn = dict["name"] as? String else {
            throw SWCharError.NoCharacterSpecies
        }
        let nameOut = "\(nameIn)"
        self.name = nameOut
        print("CHARACTER1: ",nameOut)
        
        guard let languageIn = dict["language"] as? String else {
            throw SWCharError.NoCharacterSpecies
        }
        let languageOut = "Language: \(languageIn)"
        self.language = languageOut
        print("CHARACTER2: ", languageOut)
        
        guard let skin_colorsIn = dict["skin_colors"] as? String else {
            throw SWCharError.NoCharacterSpecies
        }
        let skin_colorsOut = "Skin Colors: \(skin_colorsIn)"
        self.skin_colors = skin_colorsOut
        print("CHARACTER3: ",skin_colorsOut)
        
        guard let hair_colorsIn = dict["hair_colors"] as? String else {
            throw SWCharError.NoCharacterSpecies
        }
        let hair_colorsOut = "Hair Color: \(hair_colorsIn)"
        self.hair_colors = hair_colorsOut
        print("CHARACTER4: ", hair_colorsOut)
        
        guard let designationIn = dict["designation"] as? String else {
            throw SWCharError.NoCharacterSpecies
        }
        let designationOut = "Designation: \(designationIn)"
        self.designation = designationOut
        print("CHARACTER5: ", designationOut)
        
        guard let averageLifespanIn = dict["average_lifespan"] as? String else {
            throw SWCharError.NoCharacterSpecies
        }
        let averageLifespanOut = "Average Lifespan: \(averageLifespanIn)"
        self.average_lifespan = averageLifespanOut
        print("CHARACTER6: ", averageLifespanOut)
    }
}



class SWCharacterHomeworld {
    let name:String
    let diameter:String
    let climate:String
    let population:String
    
    init(dict:[String:Any]) throws {
        
        guard let nameIn = dict["name"] as? String else {
            throw SWCharError.NoCharacterHomeworld
        }
        let nameOut = "\(nameIn)"
        self.name = nameOut
        print("WORLD NAME: ",nameOut)
        
        guard let diameterIn = dict["diameter"] as? String else {
            throw SWCharError.NoCharacterHomeworld
        }
        let diameterOut = "Diameter: \(diameterIn)"
        self.diameter = diameterOut
        print("CHARACTER3: ", diameterOut)
        
        guard let climateIn = dict["climate"] as? String else {
            throw SWCharError.NoCharacterHomeworld
        }
        let climateOut = "Climate: \(climateIn)"
        self.climate = climateOut
        print("CHARACTER4: ",climateOut)
        
        guard let populationIn = dict["population"] as? String else {
            throw SWCharError.NoCharacterHomeworld
        }
        let populationOut = "Population: \(populationIn)"
        self.population = populationOut
        print("CHARACTER5: ", populationOut)
    }
}




