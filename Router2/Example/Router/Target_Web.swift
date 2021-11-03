//
//  Target_Web.swift
//  Router_Example
//
//  Created by 杜林顺 on 2021/11/3.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Router

class Target_web: NSObject, Callbackable {
    
    var callback: CallbackBlock?
    
    @objc func action_load(_ params: [String: Any]) {
        print("web load", params)
        callback?("web load callback")
    }
}
