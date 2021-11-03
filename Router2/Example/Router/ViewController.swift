//
//  ViewController.swift
//  Router
//
//  Created by dulinshun on 11/03/2021.
//  Copyright (c) 2021 dulinshun. All rights reserved.
//

import UIKit
import Router


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        print(NSStringFromClass(ViewController.self))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Router.openURL("http://www.baidu.com") { data in
            print(data)
        }
        
        Router.openURL("native://member/register?aaa=bbb") { data in
            print(data)
        }
    }
    
}

