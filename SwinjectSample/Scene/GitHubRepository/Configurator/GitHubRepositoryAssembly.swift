//
//  GitHubRepositoryAssembly.swift
//  SwinjectSample
//
//  Created by 佐藤 慎 on 2019/01/09.
//  Copyright © 2019年 佐藤 慎. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class GitHubRepositoryAssembly: Assembly {
    func assemble(container: Container) {

        container.register(ReposLikesUseCase.self) { (r, presenter: ReposPresenter) in
            let usecase = ReposLikesUseCase()
            usecase.presenter = presenter
            usecase.gateway = r.resolve(ReposGateway.self, argument: usecase)
            return usecase
        }
        
        container.register(ReposGateway.self) { (r, usecase: ReposLikesUseCase) in
            let gateway = ReposGateway()
            gateway.useCase = usecase
            gateway.request = GitHubRepoRequest()
            return gateway
        }
        
        container.register(ReposPresenter.self) { (r, vc: ViewController) in
            let presenter = ReposPresenter()
            presenter.view = vc
            presenter.useCase = r.resolve(ReposLikesUseCase.self, argument: presenter)
            return presenter
        }
        
        // StroyboardでVCが作られたタイミングでフックして注入する
        container.storyboardInitCompleted(ViewController.self) { (r, vc) in
            vc.presenter = r.resolve(ReposPresenter.self, argument: vc)
        }
    }

    
}
