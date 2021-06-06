//
//  ApiManager.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol ApiManagerProtocol {

}

class ApiManager: ApiManagerProtocol, NetworkEnvironmentProtocol {
    private init() {}
    static let shared = ApiManager()
}
