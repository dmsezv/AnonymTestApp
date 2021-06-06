//
//  PostListService.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol PostListServiceProtocol {
    func getPostList()
}

class PostListService: PostListServiceProtocol {
    typealias PostListResult = Result<PostListModel?, Error>
    private let apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
    }

    func getPostList() {
        apiManager.call(endpoint: ApiEndpointItem.getPosts(pageSize: 1,
                                                           nextPageCursor: nil,
                                                           orderBy: nil),
                        parameters: nil) { (result: PostListResult) in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
}
