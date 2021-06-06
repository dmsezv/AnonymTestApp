//
//  PostListService.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

protocol PostListServiceProtocol {

}

class PostListService: PostListServiceProtocol {
    private let apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
    }

    func getPostList() {

    }
}
