//
//  Notifire.swift
//  Notifire
//
//  Created by Farhad on 8/8/17.
//  Copyright © 2017 Farhad. All rights reserved.
//

import UIKit

class Notifire {
    
    var notifireView: UIView?
    static let default = Notifire()

    private init() {
        let frame = CGRect(x: 0, y: -200, width: viewController.view.frame.width, height: 200)
        notifireView = UIView(frame: frame)
    }

    public func show(target viewController: UIViewController, type: NotifireType) {
        notifireView?.backgroundColor = getColor(type: type)
        notifireView?.layer.cornerRadius = 5.0
        
        UIView.animate(withDuration: 1.0) {
            notifireView?.frame.origin.y = 0
        }
    }
    
    private func getColor(type: NotifireType) -> UIColor {
        switch type {
        case .info: return .gray
        case .error: return .red
        case .warning: return .yellow
        }
    }
}
