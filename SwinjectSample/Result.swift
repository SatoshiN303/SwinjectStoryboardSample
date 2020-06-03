//
//  Result.swift
//  DIKitExample
//
//  Created by 佐藤 慎 on 2018/12/06.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

public enum Result<T>
{
    case success(_ value: T)
    case error(_ error: Error)
    
    func ifSuccess(_ f: (T) -> Void) -> Result {
        if case let .success(value) = self {
            f(value)
        }
        return self
    }
    
    func ifError(_ f: (Error) -> Void) -> Result {
        if case let .error(error) = self {
            f(error)
        }
        return self
    }
}
