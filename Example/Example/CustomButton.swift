//
//  CustomButton.swift
//  Example
//
//  Created by Farhad on 12/23/20.
//  Copyright © 2020 Farhad. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()

    }
    
    private func setup() {
        layer.cornerRadius = 20
        layer.masksToBounds = true

    }
}
