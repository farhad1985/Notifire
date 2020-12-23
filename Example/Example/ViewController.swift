//
//  ViewController.swift
//  Example
//
//  Created by Farhad on 8/8/17.
//  Copyright © 2017 Farhad. All rights reserved.
//

import UIKit
import Notifire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change font
        Notifire.shared.title.font = UIFont.systemFont(ofSize: 18)

    }

    @IBAction func btnShow(_ sender: Any) {
        
        Notifire.shared.show(type: .info,
                             message: "Welcome to Notifire") {
            print("finish")
        }
    }
    
    @IBAction func btnCustomeShow(_ sender: Any) {
        let color = UIColor(red: 94/255,
                            green: 53/255,
                            blue: 177/255,
                            alpha: 1)
                
        Notifire.shared.show(type: .custome(backgroundColor: color,
                                            textColor: .white),
                             message: "This is the custom Color",
                             completion: {
                                
            print("finish")
        })
    }
    
}

