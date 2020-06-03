//
//  ReposPresenter.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/12/04.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

final class ReposPresenter: ReposPresenterInput, ReposLikesUseCaseOutput {

    weak var view: ReposPresenterOutput!
    var useCase: ReposLikesUseCaseInput!
        
// MARK: - ReposPresenterInput
    
    func search(using keywords: [String]) {
        useCase.search(using: keywords)
    }
    
    func fetchFavorites() {
        useCase.fetchFavorites()
    }
    
// MARK: - ReposLikesUseCaseOutput
    
    func useCaseDidUpdateStatuses(_ statuses: [GitHubRepoStatus]) {
        // 変換
        let viewData: [GitHubRepoViewData] = statuses.map {
            return GitHubRepoViewData(
                id: $0.repo.id.rawValue,
                fullName: $0.repo.fullName,
                description: $0.repo.description,
                language: $0.repo.language,
                stargazersCount: $0.repo.stargazersCount,
                isLiked: $0.isLiked)
        }
        DispatchQueue.main.async { [weak self] in
            self?.view.update(by: viewData)
        }
    }
    
    func usecaseDidRecieveError(_ error: Error) {
        
    }
}


