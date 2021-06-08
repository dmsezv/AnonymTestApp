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
    var presenter: PostDetailPresentationLogic?
    var postModel: PostApiModel?

    func getPostDetail() {
        let response = PostDetail.Response()
        presenter?.presentSomething(response: response)
    }
}
