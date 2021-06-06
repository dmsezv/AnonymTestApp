//
//  PostListPresenter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
// 

import UIKit

protocol PostListPresentationLogic {
    func presentSomething(response: PostList.Response)
}

class PostListPresenter: PostListPresentationLogic {
    weak var viewController: PostListDisplayLogic?

    // MARK: Do something

    func presentSomething(response: PostList.Response) {

    }
}
