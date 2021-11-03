//
//  TargetLogin.swift
//  Router_Example
//
//  Created by 杜林顺 on 2021/10/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Router

class TargetLogin: NSObject {
    
    static var host = "login"
    
    static var instance: NSObject = TargetLogin()
    
    @objc func login(_ param: [String: Any]) {
        print(" 登录成功")
    }
}
