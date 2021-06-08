//
//  PostDetailInteractor.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailBusinessLogic {
    func getPostDetail()
}

protocol PostDetailDataStore {
    var postModel: PostApiModel? { get set }
}

class PostDetailInteractor: PostDetailBusinessLogic, PostDetailDataStore {
    private let postListService: PostListServiceProtocol

    var presenter: PostDetailPresentationLogic?
    var postModel: PostApiModel?

    init(postListService: PostListServiceProtocol) {
        self.postListService = postListService
    }

    func getPostDetail() {
        guard let postModel = postModel else {
            presenter?.presentPostDetails(response: PostDetail.Response(imageData: nil,
                                                                        imageSize: nil,
                                                                        text: nil,
                                                                        isError: true))
            return
        }

        var response = PostDetail.Response(isError: false)
        if let text = postModel.contents?.first(where: { $0.type == .text })?.data?.value {
            response.text = text
        }

        if let image = postModel
            .contents?.first(where: { $0.type == .image })?.data?.large,
           let imageUrl = image.url {
            postListService.getImageData(by: imageUrl) { data in
                response.imageData = data
                response.imageSize = image

                self.presenter?.presentPostDetails(response: response)
            }
        }
    }
}
