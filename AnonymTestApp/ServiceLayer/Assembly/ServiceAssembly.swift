//
//  ServiceAssembly.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol ServiceAssemblyProtocol {
    func postListService() -> PostListServiceProtocol
}

class ServiceAssembly: ServiceAssemblyProtocol {
    private let coreAssembly: CoreAssemblyProtocol

    init(coreAssembly: CoreAssemblyProtocol) {
        self.coreAssembly = coreAssembly
    }

    func postListService() -> PostListServiceProtocol {
        PostListService(apiManager: coreAssembly.apiManager())
    }
}
