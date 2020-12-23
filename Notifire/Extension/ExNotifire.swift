//
//  ExNotifire.swift
//  Notifire
//
//  Created by Farhad on 12/23/20.
//  Copyright © 2020 Farhad. All rights reserved.
//

import Foundation

extension Notifire {
    
    func animatedDissolve(sender: UITapGestureRecognizer? = nil) {
        
        self.notifireView.alpha = 0
        self.notifireView.frame.origin.y = CGFloat(-40 + self.hNav)

        UIView.animate(withDuration: 0.4, animations: {
            self.notifireView.alpha = 1
            
        }) { _ in
            
            self.timerNotifire = Timer.scheduledTimer(timeInterval: TimeInterval(self.timer),
                                                      target: self,
                                                      selector: #selector(self.dismissDissolve),
                                                      userInfo: nil,
                                                      repeats: false)
        }
        
    }
    
    @objc func dismissDissolve() {
        timerNotifire?.invalidate()
        UIView.animate(withDuration: 0.5, animations: {
            self.notifireView.alpha = 0
            self.notifireView.frame.origin.y = -(CGFloat(self.height))

        }) { _ in
            
            self.notifireView.removeFromSuperview()
            self.isShow = false
            self.completion?()
            self.completion = nil
        }
    }
}

extension Notifire {
    
    func animatedJelly(sender: UITapGestureRecognizer? = nil) {
        self.notifireView.frame.origin.y = -(CGFloat(self.height))
        self.notifireView.alpha = 1

        UIView.animate(withDuration: 0.4, animations: {
            self.notifireView.frame.origin.y = CGFloat(-40 + self.hNav)
            
        }) { _ in
            
            UIView.animate(withDuration: 0.5, animations: {
                self.notifireView.frame.origin.y = (CGFloat)(-self.overLap + self.hNav)
                
            })
            
            self.timerNotifire = Timer.scheduledTimer(timeInterval: TimeInterval(self.timer),
                                                      target: self,
                                                      selector: #selector(self.dismissJelly),
                                                      userInfo: nil,
                                                      repeats: false)
            
        }
        
    }
    
    @objc func dismissJelly() {
        timerNotifire?.invalidate()
        UIView.animate(withDuration: 0.7, animations: {
            self.notifireView.frame.origin.y = CGFloat(-40 + self.hNav)
            
        }) { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.notifireView.frame.origin.y = -(CGFloat(self.height))
            }, completion: { _ in
                self.notifireView.removeFromSuperview()
                self.isShow = false
                self.completion?()
                self.completion = nil
            })
        }
    }
}
