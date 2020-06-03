//
//  GitHubRepoStatusList.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/29.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

struct GitHubRepoStatusList {
    
    enum Error: Swift.Error {
        case notFoundRepo(ofID: GitHubRepo.ID)
    }
    
    private (set) var statuses: [GitHubRepoStatus]
    
    // イニシャライザ
    init(repos: [GitHubRepo], likes: [GitHubRepo.ID: Bool]) {
        self.statuses = [GitHubRepoStatus]()
        self.append(repos: repos, likes: likes)
    }
    
    // GitHubリポジトリ情報とお気に入り状態を組み合わせてGitHubRepoStatusを作りstatusesに追加する
    mutating func append(repos: [GitHubRepo], likes: [GitHubRepo.ID: Bool]) {
        for repo in repos {
            guard let like = likes.first(where: {$0.key == repo.id}) else {
                break
            }
            self.statuses.append(GitHubRepoStatus(repo: repo, isLiked: like.value))
        }
    }
    
    // statusesにある指定GitHubリポジトリのお気に入り状態を更新する
    // 存在しない GitHub リポジトリを指定した場合は notFoundRepo 例外を投げる
    mutating func set(isLiked: Bool, for id: GitHubRepo.ID) throws {
        guard let _ = self[id] else {
            throw Error.notFoundRepo(ofID: id)
        }
        self.statuses = self.statuses.map {
            var mutableStatus = $0
            if $0.repo.id == id {
                mutableStatus.isLiked = isLiked
            }
            return mutableStatus
        }
    }
    
    subscript(id: GitHubRepo.ID) -> GitHubRepoStatus? {
        return statuses.first(where: { $0.repo.id == id })
    }
    
}
