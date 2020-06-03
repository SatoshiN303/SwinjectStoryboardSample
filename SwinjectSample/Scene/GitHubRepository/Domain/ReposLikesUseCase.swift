//
//  ReposLikesUseCase.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/30.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation
import Swinject

final class ReposLikesUseCase: ReposLikesUseCaseInput {
    
    weak var presenter: ReposLikesUseCaseOutput!
    var gateway: ReposGatewayProtocol!
        
    // キーワード検索
    func search(using keywords: [String]) {
        
    }
    
    func fetchFavorites() {
        
    }
    
    func set(liked: Bool, for repo: GitHubRepo) {
        
    }
}


