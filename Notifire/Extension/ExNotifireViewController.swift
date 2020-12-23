//
//  ExNotifireViewController.swift
//  Notifire
//
//  Created by Farhad on 12/23/20.
//  Copyright © 2020 Farhad. All rights reserved.
//

import Foundation

extension UIViewController {
    func getTopViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            if let visibleViewController = navigation.visibleViewController {
                return visibleViewController
            }
            return navigation
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.getTopViewController()
            }
            return tab.getTopViewController()
        }
        return self.presentedViewController!.getTopViewController()
    }
}

extension UIApplication {
    func getTopViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.getTopViewController()
    }
}
