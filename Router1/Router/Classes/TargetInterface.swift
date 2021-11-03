//
//  TargetInterface.swift
//  Pods-Router_Example
//
//  Created by duarlen on 2021/10/13.
//

import UIKit

@objc public protocol TargetInterface: NSObjectProtocol {
    static var host: String { get }
    static var instance: NSObject { get }
}
