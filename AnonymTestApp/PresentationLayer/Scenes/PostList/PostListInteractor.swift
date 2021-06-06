//
//  PostListInteractor.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

protocol PostListBusinessLogic {
    func doSomething(request: PostList.Request)
}

protocol PostListDataStore {
    // var name: String { get set }
}

class PostListInteractor: PostListBusinessLogic, PostListDataStore {
    private let postListService: PostListServiceProtocol
    var presenter: PostListPresentationLogic?

    init(postListService: PostListServiceProtocol) {
        self.postListService = postListService
    }

    // MARK: Do something

    func doSomething(request: PostList.Request) {

    }
}
