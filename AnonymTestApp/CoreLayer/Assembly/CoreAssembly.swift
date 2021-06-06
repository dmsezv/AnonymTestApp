//
//  CoreAssembly.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol CoreAssemblyProtocol {
    func apiManager() -> ApiManagerProtocol
}

class CoreAssembly: CoreAssemblyProtocol {
    func apiManager() -> ApiManagerProtocol {
        ApiManager.shared
    }
}
