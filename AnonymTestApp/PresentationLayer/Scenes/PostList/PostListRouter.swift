//
//  PostListRouter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

@objc protocol PostListRoutingLogic {
    // func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PostListDataPassing {
    var dataStore: PostListDataStore? { get }
}

class PostListRouter: NSObject, PostListRoutingLogic, PostListDataPassing {
    weak var viewController: PostListViewController?
    var dataStore: PostListDataStore?

    // MARK: Routing

    // func routeToSomewhere(segue: UIStoryboardSegue?)
    // {
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    // }

    // MARK: Navigation

    // func navigateToSomewhere(source: PostListViewController, destination: SomewhereViewController)
    // {
    //  source.show(destination, sender: nil)
    // }

    // MARK: Passing data

    // func passDataToSomewhere(source: PostListDataStore, destination: inout SomewhereDataStore)
    // {
    //  destination.name = source.name
    // }
}
