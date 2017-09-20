//
//  HomeworldViewController.swift
//  SWAPEExample
//
//  Created by Carlos Carrillo on 9/12/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class HomeworldViewController: UIViewController, UIActionSheetDelegate{
  
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    lazy var HomeworldViewModel:ViewModel4 = ViewModel4(delegate: self)
    var passHomeworldUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.clipsToBounds = true
        guard let url = passHomeworldUrl else {return}
        HomeworldViewModel.getCharacterHomeworld(homeworldUrl: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeworldViewController:VMDelegate4{
    func passCharacterData(array: [String]){
        DispatchQueue.main.async {
            // MARK: Background image
            let background = UIImage(named: "skyWalker")
            var imageView : UIImageView!
            imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode =  UIViewContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = self.view.center
            self.view.addSubview(imageView)
            self.view.sendSubview(toBack: imageView)
            
            // Pass values to Items
            self.myImageView.image = #imageLiteral(resourceName: "StarWarsLogo")
            self.myLabel1.text = array[0]
            self.myLabel2.text = array[1]
            self.myLabel3.text = array[2]
            self.myLabel4.text = array[3]
        }
    }
}
