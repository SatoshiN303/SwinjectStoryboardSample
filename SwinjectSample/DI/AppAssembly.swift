//
//  AppAssembly .swift
//  MakeupSimulator
//
//  Created by 佐藤 慎 on 2017/01/18.
//  Copyright © 2017年 i-studio development team. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

// 依存性の注入をまとめて実行
class AppAssembly {
    
    class var assembler: Assembler? {
        return Assembler([
            GitHubRepositoryAssembly()
            ])
    }
}

extension SwinjectStoryboard {
    @objc class  func setup() {
        guard let assembler = AppAssembly.assembler,
              let container =  assembler.resolver as? Container else {
                fatalError()
        }
        defaultContainer = container
    }
}
