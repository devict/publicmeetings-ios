//
//  UIApplication.swift
//  TruColor
//
//  Created by mpc on 11/29/19.
//  Copyright © 2019 mpc. All rights reserved.
//

import UIKit

extension UIApplication {
    static func topViewController() -> UIViewController? {
        guard var top = shared.keyWindow?.rootViewController else {
            return nil
        }
        
        while let next = top.presentedViewController {
            top = next
        }
        
        return top
    }
}
