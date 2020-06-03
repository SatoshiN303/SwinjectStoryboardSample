//
//  ReposGatewayProtocol.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/30.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

protocol ReposGatewayProtocol {
    func search(using keywords: [String], completion: @escaping (Result<[GitHubRepo]>) -> Void)
}
