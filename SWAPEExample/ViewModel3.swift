//
//  ViewModel3.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 9/11/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate3:class{
    func passCharacterData(array: [String])
}

class ViewModel3 {
    
    var characterInfoArray:[String] = []
    
    weak var ViewController3:VMDelegate3?
    
    init(delegate:VMDelegate3? = nil){
        self.ViewController3 = delegate
    }
    
    func getCharacterInfo(infoArray: [String]) {
        characterInfoArray.append(infoArray[0])
        characterInfoArray.append(infoArray[1])
        characterInfoArray.append(infoArray[2])
        characterInfoArray.append(infoArray[3])
        characterInfoArray.append(infoArray[4])
        characterInfoArray.append(infoArray[5])
        print ("getCharacterInfo")
        ViewController3?.passCharacterData(array: characterInfoArray)
    }
}






