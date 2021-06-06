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

    let estimatedRowHeight: CGFloat = 44

    // MARK: - Object Lifestyle

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

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

// MARK: - UITableViewDelegate, UITableViewDataSource

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
