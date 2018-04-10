//
//  SecondViewController.swift
//  Example
//
//  Created by Farhad on 3/11/18.
//  Copyright © 2018 Farhad. All rights reserved.
//

import UIKit
import Notifire

class SecondViewController: UIViewController {

    @IBAction func didTapShowMessage(_ sender: Any) {
        Notifire.shared.show(type: .info, message: "this is SecondViewController")
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
