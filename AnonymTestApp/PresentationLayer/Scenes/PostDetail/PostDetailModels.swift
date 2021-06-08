//
//  PostDetailModels.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

enum PostDetail {

    // MARK: Use cases

    struct Response {
        var imageData: Data?
        var imageSize: ExtraLargeApiModel?
        var text: String?
        var isError: Bool
    }

    struct ViewModel {
        var imageContent: ImageContent?
        var text: String?

        struct ImageContent {
            var image: UIImage?
            var imageHeight: Int?
            var imageWidth: Int?
        }
    }
}
