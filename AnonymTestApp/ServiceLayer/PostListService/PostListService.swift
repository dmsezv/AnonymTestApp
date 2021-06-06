//
//  PostListService.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

typealias PostListResult = Result<PostListApiModel, Error>

protocol PostListServiceProtocol {
    func getPostList(cursor: String?, _ complete: @escaping(PostListResult) -> Void)
}

class PostListService: PostListServiceProtocol {
    private let apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
    }

    func getPostList(cursor: String?, _ complete: @escaping(PostListResult) -> Void) {
        apiManager.call(endpoint: ApiEndpointItem.getPosts(pageSize: 20,
                                                           nextPageCursor: cursor,
                                                           orderBy: nil),
                        parameters: nil) { (result: PostListResult) in
            switch result {
            case .success(let model):
                complete(.success(model))
            case .failure(let error):
                complete(.failure(error))
            }
        }
    }
}
