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
    private var notifireView: UIView = UIView()
    
    private var timer = 3
    private var height = 100
    private let overLap = 30
    private var navBar: UINavigationController?
    private var isNavBar = false
    private var hNav = 0
    private var isShow = false
    
    private init() {}
    
    public func show(type: NotifireType, message: String, timer: Int = 3) {
        if !isShow {
            isShow = true
            self.timer = timer
            title.numberOfLines = 3
            title.text = message
            setupView(type: type)
            animated()
        }
        
    }
    
    private func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return navigationController
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return selected
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }

    private func setupView(type: NotifireType) {
        let frameTopVC = topViewController()?.view.frame

        let frame = CGRect(x: 0, y: -1000, width: Int((frameTopVC?.width)!), height: height)
        notifireView.frame = frame
        notifireView.backgroundColor = getColor(type: type)
        notifireView.layer.cornerRadius = 10.0
        notifireView.layer.shadowOpacity = 0.3
        notifireView.layer.shadowOffset = CGSize(width: 3, height: 3)
        topViewController()?.view.addSubview(notifireView)
        notifireView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: (notifireView.bottomAnchor), constant: -16).isActive = true
        title.leftAnchor.constraint(equalTo: (notifireView.leftAnchor), constant: 16).isActive = true
        title.rightAnchor.constraint(equalTo: (notifireView.rightAnchor), constant: -16).isActive = true
        title.textColor = .white
        notifireView.layoutSubviews()
        height = Int(title.frame.height + 80)
        notifireView.frame.size.height = CGFloat(height)
        print(height)
    }
    
    private func getColor(type: NotifireType) -> UIColor {
        switch type {
        case .info: return UIColor(red: 9/255, green: 194/255, blue: 102/255, alpha: 1.0)
        case .error: return UIColor(red: 1, green: 50/255, blue: 90/255, alpha: 1.0)
        case .warning: return UIColor(red: 254/255, green: 205/255, blue: 5/255, alpha: 1.0)
        }
    }
    
    private func animated() {
        UIView.animate(withDuration: 0.4, animations: {
            self.notifireView.frame.origin.y = CGFloat(-10 + self.hNav)
        }) { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.notifireView.frame.origin.y = (CGFloat)(-self.overLap + self.hNav)
            })
            Timer.scheduledTimer(timeInterval: TimeInterval(self.timer), target: self, selector: #selector(self.dismiss), userInfo: nil, repeats: false)
        }
    }
    
    @objc private func dismiss() {
        UIView.animate(withDuration: 0.4, animations: {
            self.notifireView.frame.origin.y = CGFloat(-10 + self.hNav)
        }) { _ in
            UIView.animate(withDuration: 0.4, animations: { 
                self.notifireView.frame.origin.y = -(CGFloat(self.height + self.overLap))
            }, completion: { _ in
                self.notifireView.removeFromSuperview()
                self.isShow = false
            })
        }
    }
}
