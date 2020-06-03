//
//  ReposLikesUseCaseProtocols.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/29.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

// Presenterからの入力を受け付ける
protocol ReposLikesUseCaseInput: AnyObject {
    // キーワード検索
    func search(using keywords: [String])
    
    // お気に入り済み レポジトリ一覧取得
    func fetchFavorites()
    
    // お気に入り追加・削除
    func set(liked: Bool, for repo: GitHubRepo)
}

protocol ReposLikesUseCaseOutput: AnyObject {
    // GitHubRepoStatusList.statuses が更新された知らせる
    func useCaseDidUpdateStatuses(_ statuses: [GitHubRepoStatus])
    // UseCaseでエラーを知らせる
    func usecaseDidRecieveError(_ error: Error)
}
