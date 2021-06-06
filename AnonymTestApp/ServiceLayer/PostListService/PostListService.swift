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
    func getImageData(by url: String, _ complete: @escaping(Data?) -> Void)
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

    func getImageData(by url: String, _ complete: @escaping(Data?) -> Void) {
        guard let url = URL(string: url) else {
            complete(nil); return
        }

        apiManager.getData(by: url) { result in
            switch result {
            case .success(let data): complete(data)
            case .failure(_): complete(nil)
            }
        }
    }
}
