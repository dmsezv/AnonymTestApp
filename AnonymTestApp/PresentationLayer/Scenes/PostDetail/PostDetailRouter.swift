//
//  PostDetailRouter.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

@objc protocol PostDetailRoutingLogic {
    // func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PostDetailDataPassing {
    var dataStore: PostDetailDataStore? { get }
}

class PostDetailRouter: PostDetailRoutingLogic, PostDetailDataPassing {
    weak var viewController: PostDetailViewController?
    var dataStore: PostDetailDataStore?

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

    // func navigateToSomewhere(source: PostDetailViewController, destination: SomewhereViewController)
    // {
    //  source.show(destination, sender: nil)
    // }

    // MARK: Passing data

    // func passDataToSomewhere(source: PostDetailDataStore, destination: inout SomewhereDataStore)
    // {
    //  destination.name = source.name
    // }
}
