//
//  PostListModels.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//  

import UIKit

enum PostList {
  // MARK: - Use cases

    struct Request {
    }

    struct Response {
        var postListModel: PostListApiModel?
        var isError: Bool
        var message: String?
    }

    struct ViewModel {
        var posts: [Post]

        struct Post {
            let author: Author
        }

        struct Author {
            let id: String
            let name: String
            let photoUrl: String
        }
    }
}