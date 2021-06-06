//
//  PostListInteractor.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

protocol PostListBusinessLogic {
    func getPostList(needRefresh: Bool)
    func getImage(by id: String, _ complete: @escaping(UIImage?) -> Void)
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

    func getPostList(needRefresh: Bool) {
        if needRefresh {
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

    func getImage(by url: String, _ complete: @escaping(UIImage?) -> Void) {
        postListService.getImageData(by: url) { data in
            if let data = data {
                complete(UIImage(data: data))
            } else { complete(nil) }
        }
    }
}
