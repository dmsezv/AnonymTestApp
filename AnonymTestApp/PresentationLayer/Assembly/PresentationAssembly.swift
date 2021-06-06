//
//  PresentationAssembly.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation
import UIKit

protocol PresentationAssemblyProtocol {
    func defaultNavigationController(rootViewController: UIViewController) -> UINavigationController
    func postListViewController() -> PostListViewController
}

class PresentationAssembly: PresentationAssemblyProtocol {
    private let serviceAssembly: ServiceAssemblyProtocol

    init(serviceAssembly: ServiceAssemblyProtocol) {
        self.serviceAssembly = serviceAssembly
    }

    func defaultNavigationController(rootViewController: UIViewController) -> UINavigationController {
        UINavigationController(rootViewController: rootViewController)
    }

    func postListViewController() -> PostListViewController {
        let viewController = PostListViewController()
        let interactor = PostListInteractor(postListService: serviceAssembly.postListService())
        let router = PostListRouter(presenterAssembly: self)
        let presenter = PostListPresenter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        return viewController
    }
}
