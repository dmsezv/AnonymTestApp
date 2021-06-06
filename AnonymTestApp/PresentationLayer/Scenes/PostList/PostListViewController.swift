//
//  PostListViewController.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//  

import UIKit

protocol PostListDisplayLogic: AnyObject {
    func displaySomething(viewModel: PostList.ViewModel)
}

class PostListViewController: UIViewController, PostListDisplayLogic {
    var interactor: PostListBusinessLogic?
    var router: (PostListRoutingLogic & PostListDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = PostListInteractor()
        let presenter = PostListPresenter()
        let router = PostListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something

    // @IBOutlet weak var nameTextField: UITextField!

    func doSomething() {
        let request = PostList.Request()
        interactor?.doSomething(request: request)
    }

    func displaySomething(viewModel: PostList.ViewModel) {
        // nameTextField.text = viewModel.name
    }
}
