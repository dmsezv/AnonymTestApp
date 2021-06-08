//
//  PostListRouter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

@objc protocol PostListRoutingLogic {
    func routeToPostDetail()
}

protocol PostListDataPassing {
    var dataStore: PostListDataStore? { get }
}

class PostListRouter: PostListRoutingLogic, PostListDataPassing {
    private let presenterAssembly: PresentationAssemblyProtocol

    weak var viewController: PostListViewController?
    var dataStore: PostListDataStore?

    init(presenterAssembly: PresentationAssemblyProtocol) {
        self.presenterAssembly = presenterAssembly
    }

    // MARK: - Routing

    func routeToPostDetail() {
        let destenationVC = presenterAssembly.postDetailViewController()
        viewController?.show(destenationVC, sender: nil)
    }

    // MARK: - Navigation

    // func navigateToSomewhere(source: PostListViewController, destination: SomewhereViewController)
    // {
    //  source.show(destination, sender: nil)
    // }

    // MARK: - Passing data

    // func passDataToSomewhere(source: PostListDataStore, destination: inout SomewhereDataStore)
    // {
    //  destination.name = source.name
    // }
}
