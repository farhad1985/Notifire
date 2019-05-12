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

    @IBAction func btnShow(_ sender: Any) {
        Notifire.shared.show(type: .error, message: "Welcome to Notifire") {
            print("finish")
        }
    }
    
    @IBAction func btnCustomeShow(_ sender: Any) {
        Notifire.shared.show(type: .custome(backgroundColor: .lightGray, textColor: .yellow), message: "سلام ایران", textAlignment: .right, completion: {
            print("finish")
        })
    }
}

