//
//  Callbackable.swift
//  Router
//
//  Created by 杜林顺 on 2021/11/3.
//

import Foundation

public typealias CallbackBlock = (Any?) -> ()

public protocol Callbackable {
    var callback: CallbackBlock? { set get }
}
