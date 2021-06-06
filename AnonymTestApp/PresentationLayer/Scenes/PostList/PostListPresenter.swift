//
//  PostListPresenter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
// 

import UIKit

protocol PostListPresentationLogic {
    func presentPostList(response: PostList.Response)
}

class PostListPresenter: PostListPresentationLogic {
    typealias ViewModel = PostList.ViewModel
    weak var viewController: PostListDisplayLogic?

    func presentPostList(response: PostList.Response) {
        if let postList = response.postListModel?.items, !response.isError {
            var postsViewModel: [ViewModel.Post] = []
            for post in postList {
                postsViewModel
                    .append(ViewModel.Post(author: ViewModel.Author(id: post.author?.id,
                                                                    name: post.author?.name,
                                                                    photoUrl: post.author?.url)))
            }
            let viewModel = ViewModel(posts: postsViewModel,
                                      isLastPage: response.postListModel?.cursor == nil,
                                      isLoading: true)
            DispatchQueue.main.async {
                self.viewController?.displayPostList(viewModel: viewModel)
            }
        } else {
            DispatchQueue.main.async {
                self.viewController?.displayError("Can't loaded list")
            }
        }
    }
}
