//
//  PostDetailInteractor.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailBusinessLogic {
    func doSomething(request: PostDetail.Request)
}

protocol PostDetailDataStore {
    // var name: String { get set }
}

class PostDetailInteractor: PostDetailBusinessLogic, PostDetailDataStore {
    var presenter: PostDetailPresentationLogic?

    // MARK: Do something

    func doSomething(request: PostDetail.Request) {
        let response = PostDetail.Response()
        presenter?.presentSomething(response: response)
    }
}
