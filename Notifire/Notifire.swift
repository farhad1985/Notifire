//
//  Notifire.swift
//  Notifire
//
//  Created by Farhad on 8/8/17.
//  Copyright © 2017 Farhad. All rights reserved.
//

import UIKit

public class Notifire {
    
    public static let shared = Notifire()
    
    public let title = UILabel()
    public let color = UIColor.white

    var tap: UISwipeGestureRecognizer!
    var line = UIView()

    var notifireView: UIView = UIView()
    
    var timer = 2
    var height = 10
    let overLap = 65
    var hNav = 0

    var isNavBar = false
    var isShow = false

    var animation: NotifireAnimationType = .jelly
    var timerNotifire: Timer?
    var navBar: UINavigationController?
    var completion: (() -> ())?
    
    init() {}

    
    public func show(type: NotifireType,
                     message: String,
                     timer: Int = 2,
                     animation: NotifireAnimationType,
                     textAlignment:NSTextAlignment = .left,
                     completion: (() -> ())? = nil) {
        
        if !isShow {
            self.timer = timer
            self.completion = completion
            self.animation = animation
            
            hNav =  Int((UIApplication.shared.getTopViewController()?.navigationController?.navigationBar.frame.height) ?? 0) + 30
            
            isShow = true

            title.numberOfLines = 3
            title.text = message
            title.textAlignment = textAlignment
            setupView(type: type)
            animated()
            tap = UISwipeGestureRecognizer(target: self, action: #selector(dismissDissolve))
            tap.direction = .up
            notifireView.addGestureRecognizer(tap)
        }
        
    }
    
    func animated() {
        switch animation {
        case .jelly:
            animatedJelly()
            
        case .dissolve:
            animatedDissolve()
        }
    }
    
    private func setupView(type: NotifireType) {
        let frame = CGRect(x: 0, y: -1000, width: Int((UIApplication.shared.getTopViewController()?.view.frame.width)!), height: height)
        notifireView.frame = frame
        notifireView.backgroundColor = getColor(type: type).0
        notifireView.layer.cornerRadius = 10.0
        notifireView.layer.shadowOpacity = 0.3
        notifireView.layer.shadowOffset = CGSize(width: 3, height: 3)
        UIApplication.shared.keyWindow?.addSubview(notifireView)
        notifireView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: (notifireView.bottomAnchor), constant: -24).isActive = true
        title.leftAnchor.constraint(equalTo: (notifireView.leftAnchor), constant: 16).isActive = true
        title.rightAnchor.constraint(equalTo: (notifireView.rightAnchor), constant: -16).isActive = true
        title.textColor = getColor(type: type).1

        notifireView.layoutSubviews()
        height = Int(title.frame.height + 100)
        notifireView.frame.size.height = CGFloat(height)
        
        line.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        line.layer.cornerRadius = 2
        notifireView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.bottomAnchor.constraint(equalTo: notifireView.bottomAnchor, constant: -3).isActive = true
        line.widthAnchor.constraint(equalToConstant: 100).isActive = true
        line.heightAnchor.constraint(equalToConstant: 4).isActive = true
        line.centerXAnchor.constraint(equalTo: notifireView.centerXAnchor).isActive = true
    }
    
    private func getColor(type: NotifireType) -> (UIColor, UIColor) {
        switch type {
        case .info: return (UIColor(red: 9/255, green: 194/255, blue: 102/255, alpha: 1.0), color)
        case .error: return (UIColor(red: 1, green: 50/255, blue: 90/255, alpha: 1.0), color)
        case .warning: return (UIColor(red: 254/255, green: 205/255, blue: 5/255, alpha: 1.0), color)
        case .custome(let backgroundColor, let textColor): return (backgroundColor, textColor)
        }
    }
}



