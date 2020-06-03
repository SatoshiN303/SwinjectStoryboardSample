//
//  ReposPresenterProtocols.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/12/04.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

protocol ReposPresenterInput {
    func search(using keywords: [String])
    func fetchFavorites()
}

protocol ReposPresenterOutput: class {
    func update(by viewDataArray: [GitHubRepoViewData])
}

struct GitHubRepoViewData {
    let id: String
    let fullName: String
    let description: String
    let language: String
    let stargazersCount: Int
    let isLiked: Bool
}
