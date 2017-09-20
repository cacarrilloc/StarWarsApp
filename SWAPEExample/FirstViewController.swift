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
    //@IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    lazy var firstViewModel:ViewModel1 = ViewModel1(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewModel.assignbackground()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension FirstViewController:VMDelegate1{
    func loginFunction(){
        // Items shapes
        self.myButton.layer.cornerRadius = 15
        self.myImage.image = #imageLiteral(resourceName: "StarWarsLogo")
        self.myImage.clipsToBounds = true
        
        // MARK: Background image
        let background = UIImage(named: "skyWalker")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
}






