//
//  Target_Member.swift
//  Router_Example
//
//  Created by 杜林顺 on 2021/11/3.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Router

class Target_member: NSObject, Callbackable {
    
    var callback: CallbackBlock?
    
    /// url：native://Member/register?
    @objc func action_register(_ params: [String: Any]) {
        print("member register", params);
        callback?("member register callback")
    }
}
