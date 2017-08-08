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
        
    }
    
    @IBAction func btnShow(_ sender: Any) {
        Notifire.shared.title.textAlignment = .right
        Notifire.shared.show(target: self, type: .error, message: "این متن پیش فرض می باشد")
    }
}

