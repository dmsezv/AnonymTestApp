//
//  PostDetailPresenter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailPresentationLogic {
    func presentPostDetails(response: PostDetail.Response)
}

class PostDetailPresenter: PostDetailPresentationLogic {
    typealias ViewModel = PostDetail.ViewModel
    weak var viewController: PostDetailDisplayLogic?

    func presentPostDetails(response: PostDetail.Response) {
        if !response.isError {
            var viewModel = ViewModel()
            if let textVM = response.text {
                viewModel.text = textVM
            }

            if let data = response.imageData {
                viewModel.imageContent = ViewModel.ImageContent(image: UIImage(data: data),
                                                                imageHeight: response.imageSize?.size?.height,
                                                                imageWidth: response.imageSize?.size?.width)
            }

            DispatchQueue.main.async {
                self.viewController?.displayPostDetail(viewModel: viewModel)
            }
        } else {
            DispatchQueue.main.async {
                self.viewController?.displayError("Can't load datas")
            }
        }
    }
}
