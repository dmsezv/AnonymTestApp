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
    var url: URL? { get }
    var version: String { get }

}

enum ApiEndpointItem {

    // MARK: - User Actions

    case getPosts(pageSize: Int, nextPageCursor: String?, orderBy: String?)
}

extension ApiEndpointItem: ApiEndpointItemProtocol {
    var baseUrl: String {
        switch ApiManager.networkEnvironment {
        case .dev: return "https://k8s-stage.apianon.ru/posts/"
        case .prod: return ""
        }
    }

    var path: String {
        switch self {
        case .getPosts(let pageSize, let nextPageCursor, let orderBy):
            var urlPath = "posts?first=\(pageSize)"
            if let nextPageCursor = nextPageCursor {
                urlPath += "&after=\(nextPageCursor)"
            }
            if let orderBy = orderBy {
                urlPath += "&orderBy=\(orderBy)"
            }
            return urlPath
        }
    }

    var httpMethod: String {
        switch self {
        case .getPosts: return "GET"
        }
    }

    var headers: [String: Any]? {
        switch self {
        default: return nil
        }
    }

    var url: URL? {
        switch self {
        default: return URL(string: baseUrl + version + path)
        }
    }

    var version: String {
        switch self {
        default: return "v1/"
        }
    }
}
