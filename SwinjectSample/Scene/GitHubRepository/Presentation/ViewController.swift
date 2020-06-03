//
//  ViewController.swift
//  SwinjectSample
//
//  Created by 佐藤 慎 on 2019/01/09.
//  Copyright © 2019年 佐藤 慎. All rights reserved.
//

import UIKit
import SwinjectStoryboard

final class ViewController: UIViewController {

    var presenter: ReposPresenterInput!
    private var id: String!
    
    // NOTE: 暗黙的に解決できないDIグラフがある場合はファクトリーメソッド生やして対応する
    static func makeInstance(id: String) -> ViewController? {
        let sb = SwinjectStoryboard.create(name: "Main", bundle: nil)
        guard let vc = sb.instantiateInitialViewController() as? ViewController else {
            return nil
        }
        vc.id = id
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(presenter)
        print(self.id)
    }
}

extension ViewController: ReposPresenterOutput {
    func update(by viewDataArray: [GitHubRepoViewData]) {
        
    }
}

