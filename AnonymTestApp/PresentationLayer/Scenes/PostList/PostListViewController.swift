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

    // MARK: - Drawing Constants

    // MARK: - Object Lifestyle

    // MARK: - Views

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {

        setupLayout()
    }

    private func setupLayout() {

    }
}

// MARK: - Business Logic

extension PostListViewController {
    func doSomething() {
        let request = PostList.Request()
        interactor?.doSomething(request: request)
    }
}

// MARK: - Display Logic

extension PostListViewController {
    func displaySomething(viewModel: PostList.ViewModel) {
    }
}
