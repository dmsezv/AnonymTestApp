//
//  PostListModels.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//  

import UIKit

enum PostList {
  // MARK: - Use cases

    struct Response {
        var postListModel: PostListApiModel?
        var isError: Bool
    }

    struct ViewModel {
        var posts: [Post]
        var isLastPage: Bool = true
        var isLoading: Bool = true

        struct Post {
            let author: Author
        }

        struct Author {
            let id: String?
            let name: String?
            let photoUrl: String?
        }
    }
}
