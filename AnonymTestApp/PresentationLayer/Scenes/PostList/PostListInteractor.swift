//
//  PostListInteractor.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

protocol PostListBusinessLogic {
    func getPostList(request: PostList.Request)
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

    func getPostList(request: PostList.Request) {
        if request.needRefresh {
            postListModel = nil
        }

        postListService.getPostList(cursor: postListModel?.cursor) { result in
            switch result {
            case .success(let model):
                if let _ = self.postListModel?.items,
                   let items = model.items {
                    self.postListModel?.items?.append(contentsOf: items)
                    self.postListModel?.cursor = model.cursor
                } else {
                    self.postListModel = model
                }

                let response = PostList.Response(postListModel: self.postListModel, isError: false)
                self.presenter?.presentPostList(response: response)
            case .failure(_):
                let response = PostList.Response(postListModel: nil, isError: true)
                self.presenter?.presentPostList(response: response)
            }
        }
    }
}
