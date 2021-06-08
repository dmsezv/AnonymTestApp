//
//  PostDetailPresenter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailPresentationLogic {
  func presentSomething(response: PostDetail.Response)
}

class PostDetailPresenter: PostDetailPresentationLogic {
  weak var viewController: PostDetailDisplayLogic?

  // MARK: Do something

  func presentSomething(response: PostDetail.Response) {
    let viewModel = PostDetail.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
