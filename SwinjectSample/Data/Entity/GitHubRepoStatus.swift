//
//  GitHubRepoStatus.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/29.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

// GitHubリポジトリのお気に入り状態を管理
struct GitHubRepoStatus: Equatable {
    let repo: GitHubRepo
    var isLiked: Bool
    static func == (lhs: GitHubRepoStatus, rhs: GitHubRepoStatus) -> Bool {
        return lhs.repo == rhs.repo
    }
}
