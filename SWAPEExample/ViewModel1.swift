//
//  ViewModel.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

protocol VMDelegate1:class{
    func loginFunction()
}

class ViewModel1 {
    
    weak var ViewController1:VMDelegate1?
    
    init(delegate:VMDelegate1? = nil){
        self.ViewController1 = delegate
    }
    
    func assignbackground(){
        ViewController1?.loginFunction()
    }
}







