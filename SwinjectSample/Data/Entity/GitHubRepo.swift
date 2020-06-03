//
//  GitHubRepo.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/11/29.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

struct GitHubRepo: Equatable {
    struct ID: RawRepresentable, Hashable {
        let rawValue: String
    }
    let id: ID
    let fullName: String
    let description: String
    let language: String
    let stargazersCount: Int
    public static func == (lhs: GitHubRepo, rhs: GitHubRepo) -> Bool {
        return lhs.id == rhs.id
    }
}
