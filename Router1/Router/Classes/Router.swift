//
//  Router.swift
//  Pods-Router_Example
//
//  Created by duarlen on 2021/10/13.
//

import UIKit

public class Router: NSObject {
    private static let targets: [String: NSObject] = Router.queryTargets()
}

public extension Router {
    
    static func open(_ urlString: String) -> Bool {
        guard let url = URL(string: urlString) else { return false }
        return open(url)
    }
    
    static func open(_ url: URL) -> Bool {
        if openH5(url) { return true}
        if openNavite(url) { return true }
        return false
    }
}


private extension Router {
    
    static func queryTargets() -> [String: NSObject] {
        var targets: [String: NSObject] = [:]
        let expectedClassCount = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass?>.allocate(capacity: Int(expectedClassCount))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        let actualClassCount:Int32 = objc_getClassList(autoreleasingAllClasses, expectedClassCount)
        for i in 0 ..< actualClassCount {
            if let currentClass: AnyClass = allClasses[Int(i)],
               class_conformsToProtocol(currentClass, TargetInterface.self),
               let target = currentClass as? TargetInterface.Type {
                targets[target.host] = target.instance
            }
        }
        allClasses.deallocate()
        return targets
    }
    
    static func isH5(_ url: URL) -> Bool {
        guard let scheme = url.scheme else { return false }
        let schemes = ["http", "https"]
        return schemes.contains(scheme)
    }
    
    static func isNavite(_ url: URL) -> Bool {
        guard let scheme = url.scheme else { return false }
        let schemes = ["navite"]
        return schemes.contains(scheme)
    }
    
    static func openH5(_ url: URL) -> Bool {
        guard isH5(url) else { return false }
        return true
    }
    
    static func openNavite(_ url: URL) -> Bool {
        guard isNavite(url),
              let host = url.host,
              let target = targets[host],
              let path = url.pathComponents.last else { return false }
        
        let selector = NSSelectorFromString(path + ":")
        var params: [String: String] = [:]
        let items = URLComponents(string: url.absoluteString)?.queryItems ?? []
        for item in items where item.value != nil {
            params[item.name] = item.value
        }
        if target.responds(to: selector) {
            target.perform(selector, with: params)
            return true
        }
        return false
    }
}
