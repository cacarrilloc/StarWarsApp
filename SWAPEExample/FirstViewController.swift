//
//  ViewController.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.layer.cornerRadius = 10.0
        myLabel.clipsToBounds = true
        myButton.layer.cornerRadius = 15
        myImage.image = #imageLiteral(resourceName: "StarWarsLogo")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}









