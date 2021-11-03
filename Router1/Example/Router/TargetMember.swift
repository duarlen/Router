//
//  TargetMember.swift
//  Router_Example
//
//  Created by 杜林顺 on 2021/10/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class TargetMember: NSObject {
    static let host = "member"
    static let instance: NSObject = TargetMember()
        
    @objc func join(_ param: [String: Any]) {
        print(" 加入会员")
    }
}
