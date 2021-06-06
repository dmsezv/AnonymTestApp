//
//  ApiEndpointItem.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol ApiEndpointItemProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: String { get }
    var headers: [String: Any]? { get }
    var url: URL { get }
    var version: String { get }

}

enum ApiEndpointItem {

    // MARK: - User Actions

}

extension ApiEndpointItem: ApiEndpointItemProtocol {
    var baseUrl: String {
        switch ApiManager.networkEnvironment {
        case .dev: return ""
        case .prod: return ""
        }
    }

    var path: String {
        switch self {
        default: break
        }
    }

    var httpMethod: String {
        switch self {
        default: break
        }
    }

    var headers: [String: Any]? {
        switch self {
        default: break
        }
    }

    var url: URL {
        switch self {
        default: break
        }
    }

    var version: String {
        switch self {
        default: break
        }
    }
}
