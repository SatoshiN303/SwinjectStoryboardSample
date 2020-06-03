//
//  AppCoordinator.swift
//  SwinjectSample
//
//  Created by 佐藤 慎 on 2019/01/11.
//  Copyright © 2019年 佐藤 慎. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let id = "abc123456789"
        guard let vc = ViewController.makeInstance(id: id) else {
            fatalError()
        }
        let nvc = UINavigationController(rootViewController: vc)
        window.rootViewController = nvc
        window.makeKeyAndVisible()
    }
}
