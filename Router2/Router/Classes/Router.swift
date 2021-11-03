//
//  Router.swift
//  Router
//
//  Created by 杜林顺 on 2021/11/3.
//

import Foundation

public class Router {
    
    static public func openURL(_ urlString: String, callback: CallbackBlock? = nil ) {
        guard let url = URL(string: urlString) else { return }
        openURL(url, callback: callback)
    }
    
    static public func openURL(_ url: URL, callback: CallbackBlock? = nil ) {
        if isWebURL(url) {
            let params = ["url": url];
            handle("web", actionName: "load", params:params , callback: callback)
        } else if let arg = isNativeURL(url) {
            handle(arg.0, actionName: arg.1, params: arg.2, callback: callback)
        }
    }
}


private extension Router {

    static func isWebURL(_ url: URL) -> Bool {
        guard let scheme = url.scheme, WebSchemes.contains(scheme) else { return false }
        return true
    }

    static func isNativeURL(_ url: URL) -> (String, String, [String: Any])? {
        guard let shcheme = url.scheme, NativeSchemes.contains(shcheme) else { return nil }
        guard let host = url.host else { return nil }
        guard let path = url.pathComponents.last else { return nil }
        var params: [String: Any] = [:]
        let items = URLComponents(string: url.absoluteString)?.queryItems ?? []
        for item in items where item.value != nil {
            params[item.name] = item.value
        }
        return (host, path, params)
    }

    static func handle(_ targetName: String, actionName: String, params: [String: Any], callback: CallbackBlock?) {
        guard let module = HostModuleMap[targetName], let targetClass = NSClassFromString("\(module).Target_\(targetName)") else { return }
        let selector = NSSelectorFromString("action_\(actionName):")
        let target = (targetClass as! NSObject.Type).init()
        if var t = target as? Callbackable {
            t.callback = callback
        }
        if target.responds(to: selector) {
            _ = target.perform(selector, with: params)
        }
    }
}
