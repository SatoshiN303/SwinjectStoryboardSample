//
//  GitHubRepoRequest.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/12/06.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation
import APIKit

struct GitHubRepoRequest: Request {
    typealias Response = GitHubRepo
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return ""
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> GitHubRepo {        
        return GitHubRepo(id: GitHubRepo.ID(rawValue: "id"), fullName: "fullname", description: "description", language: "language", stargazersCount: 1)
    }
}
