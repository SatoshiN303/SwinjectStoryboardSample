//
//  ReposGateway.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/30.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation
import APIKit

final class ReposGateway: ReposGatewayProtocol {

    weak var useCase: ReposLikesUseCaseInput!
    var request: GitHubRepoRequest!
    
    // completionのResult
    func search(using keywords: [String], completion: @escaping (Result<[GitHubRepo]>) -> Void) {
        // やること
        // フレームワーク, ドライバーに通信を頼む
        // ※テストならReposGatewayProtocolに準拠したStubGatewayを定義すればよい
        // ここではURLSession/Alamofire/APIKit なにを使っても 「(Result<[GitHubRepo]>) -> Void」を返せばよい
        
        
    }
}
