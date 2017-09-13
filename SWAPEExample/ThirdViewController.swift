//
//  SecondViewController.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myButton1: UIButton!
    @IBOutlet weak var myButton2: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    lazy var ThirdViewModel:ViewModel3 = ViewModel3(delegate: self)
    
    var passedArray:[String]? = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        myButton1.layer.cornerRadius = 15
        myButton2.layer.cornerRadius = 15
        guard let array = passedArray else {return}
        self.ThirdViewModel.getCharacterInfo(infoArray: array)
    }
    
    
    @IBAction func sendToHomeworld(sender: UIButton){
        let myVC1 = self.storyboard?.instantiateViewController(withIdentifier: "HomeworldViewController") as! HomeworldViewController
        myVC1.passHomeworldUrl = self.passedArray?[5]
        self.navigationController?.pushViewController(myVC1, animated: true)
        print ("@IBActionHomeWorld")
    }
    
    @IBAction func sendToSpecies(sender: UIButton){
        let myVC2 = self.storyboard?.instantiateViewController(withIdentifier: "SpecieViewController") as! SpecieViewController
        myVC2.passSpecieUrl = self.passedArray?[4]
        self.navigationController?.pushViewController(myVC2, animated: true)
        print ("@IBActionSpecies")
    }
}

extension ThirdViewController:VMDelegate3{
    func passCharacterData(array: [String]){
        DispatchQueue.main.async {
            self.myImageView.image = #imageLiteral(resourceName: "StarWarsLogo")
            self.myLabel1.text = array[0]
            self.myLabel2.text = array[1]
            self.myLabel3.text = array[2]
            self.myLabel4.text = array[3]
        }
    }
}
