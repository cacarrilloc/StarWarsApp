//
//  SpecieViewController.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/12/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class SpecieViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myLabel5: UILabel!
    @IBOutlet weak var myLabel6: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    lazy var SpecieViewModel:ViewModel5 = ViewModel5(delegate: self)
    var passSpecieUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = passSpecieUrl else {return}
        SpecieViewModel.getCharacterSpecie(specieUrl: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SpecieViewController:VMDelegate5{
    func passCharacterData(array: [String]){
        DispatchQueue.main.async {
            self.myImageView.image = #imageLiteral(resourceName: "StarWarsLogo")
            self.myLabel1.text = array[0]
            self.myLabel2.text = array[1]
            self.myLabel3.text = array[2]
            self.myLabel4.text = array[3]
            self.myLabel5.text = array[4]
            self.myLabel6.text = array[5]
        }
    }
}
