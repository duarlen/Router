//
//  Constants.swift
//  Router
//
//  Created by 杜林顺 on 2021/11/3.
//

import Foundation

/// h5 的 scheme
let WebSchemes = ["http", "https"]

/// 本地的 scheme
let NativeSchemes = ["native"]

/// host 和 module 的表
/// key 为 host
/// value 为 module
var HostModuleMap: [String: String] = [
    "member" : "Router_Example",
    "web" : "Router_Example",
];
