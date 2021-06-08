//
//  PostListRouter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

@objc protocol PostListRoutingLogic {
    func routeToPostDetail(by identifier: String)
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

    func routeToPostDetail(by identifier: String) {
        let destenationVC = presenterAssembly.postDetailViewController()
        if let dataStore = dataStore,
           var destinationDataStore = destenationVC.router?.dataStore {
            passDataFrom(dataStore, where: identifier, to: &destinationDataStore)
            viewController?.show(destenationVC, sender: nil)
        }
    }

    // MARK: - Navigation

    // func navigateToSomewhere(source: PostListViewController, destination: SomewhereViewController)
    // {
    //  source.show(destination, sender: nil)
    // }

    // MARK: - Passing data

     func passDataFrom(_ source: PostListDataStore,
                     where identifier: String,
                     to destination: inout PostDetailDataStore) {
        destination.postModel = source.postListModel?.items?.first(where: { $0.id == identifier })
     }
}
