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
                let authorVM = fillViewModel(from: post.author)
                let textVM = post.contents?.first(where: { $0.type == .text })?.data?.value
                let image = post.contents?.first(where: { $0.type == .image })?.data?.small
                let imageVM = fillViewModel(from: image)

                postsViewModel
                    .append(ViewModel.Post(author: authorVM,
                                           text: textVM,
                                           image: imageVM))
            }
            let viewModel = ViewModel(posts: postsViewModel,
                                      isLastPage: response.postListModel?.cursor == nil,
                                      isLoading: false)
            DispatchQueue.main.async {
                self.viewController?.displayPostList(viewModel: viewModel)
            }
        } else {
            DispatchQueue.main.async {
                self.viewController?.displayError("Can't loaded list")
            }
        }
    }

    private func fillViewModel(from author: AuthorApiModel?) -> ViewModel.Author {
        ViewModel.Author(id: author?.id,
                         name: author?.name,
                         photoUrl: author?.photo?.data?.extraSmall?.url)
    }

    private func fillViewModel(from image: ExtraLargeApiModel?) -> ViewModel.ImageContent {
        ViewModel.ImageContent(url: image?.url,
                               height: image?.size?.height,
                               width: image?.size?.width)
    }
}
