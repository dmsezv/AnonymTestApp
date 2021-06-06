//
//  PostListInteractor.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

protocol PostListBusinessLogic {
    func getPostList()
}

protocol PostListDataStore {
    var postListModel: PostListApiModel? { get set }
}

class PostListInteractor: PostListBusinessLogic, PostListDataStore {
    private let postListService: PostListServiceProtocol

    var presenter: PostListPresentationLogic?
    var postListModel: PostListApiModel?

    init(postListService: PostListServiceProtocol) {
        self.postListService = postListService
    }

    func getPostList() {
        postListService.getPostList { result in
            switch result {
            case .success(let model):
                self.postListModel = model
                let response = PostList.Response(postListModel: model, isError: false)
                self.presenter?.presentPostList(response: response)
            case .failure(_):
                let response = PostList.Response(postListModel: nil, isError: true)
                self.presenter?.presentPostList(response: response)
            }
        }
    }
}
