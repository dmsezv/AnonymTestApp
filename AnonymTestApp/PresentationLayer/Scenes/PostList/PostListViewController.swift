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
    let navBarHeight: CGFloat = 44
    let commonPadding: CGFloat = 10
    let mainAlpha: CGFloat = 0.85
    let footerActivityIndicatorHeight: CGFloat = 50

    // MARK: - Object Lifestyle

    var viewModel: PostList.ViewModel?

    // MARK: - Views

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true

        return activityIndicator
    }()

    private lazy var labelBackgroundTable: UILabel = {
        let label = UILabel()
        label.text = "No posts"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray

        return label
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(
            string: "Turn down to refresh",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        refreshControl.layer.zPosition = -1
        refreshControl.tintColor = UIColor.darkGray

        return refreshControl
    }()

    private lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: [
            "Most Popular",
            "Most Commented"
        ])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false

        return segmentControl
    }()

    private lazy var titleViewNavBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
        view.addSubview(segmentControl)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.register(PostListCell.self, forCellReuseIdentifier: PostListCell.identifier)

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.frame = CGRect(x: 0,
                                         y: 0,
                                         width: tableView.frame.width,
                                         height: footerActivityIndicatorHeight)
        activityIndicator.startAnimating()

        tableView.tableFooterView = activityIndicator
        tableView.tableFooterView?.isHidden = true

        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.shadowImage = UIImage()

        view.backgroundColor = .systemBackground
        view.addSubview(titleViewNavBar)
        view.addSubview(tableView)

        setupLayout()
    }

    private func setupLayout() {
        let safeView = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            titleViewNavBar.topAnchor.constraint(equalTo: safeView.topAnchor),
            titleViewNavBar.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
            titleViewNavBar.leadingAnchor.constraint(equalTo: safeView.leadingAnchor),
            titleViewNavBar.heightAnchor.constraint(equalToConstant: navBarHeight),

            segmentControl.centerXAnchor.constraint(equalTo: titleViewNavBar.centerXAnchor),
            segmentControl.centerYAnchor.constraint(equalTo: titleViewNavBar.centerYAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: titleViewNavBar.trailingAnchor, constant: -commonPadding),
            segmentControl.leadingAnchor.constraint(equalTo: titleViewNavBar.leadingAnchor, constant: commonPadding),

            tableView.topAnchor.constraint(equalTo: titleViewNavBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor)
        ])
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
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostListCell.identifier,
                                     for: indexPath) as? PostListCell else {
            return UITableViewCell()
        }

        cell.configure()

        return cell
    }
}