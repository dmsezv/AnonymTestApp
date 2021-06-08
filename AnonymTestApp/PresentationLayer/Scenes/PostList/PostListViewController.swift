//
//  PostListViewController.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//  

import UIKit

protocol PostListDisplayLogic: AnyObject {
    func displayPostList(viewModel: PostList.ViewModel)
    func displayError(_ message: String)
}

class PostListViewController: UIViewController, PostListDisplayLogic {
    var interactor: PostListBusinessLogic?
    var router: (PostListRoutingLogic & PostListDataPassing)?

    // MARK: - Drawing Constants

    let estimatedRowHeight: CGFloat = 200
    let navBarHeight: CGFloat = 44
    let commonPadding: CGFloat = 10
    let mainAlpha: CGFloat = 0.85
    let footerActivityIndicatorHeight: CGFloat = 50
    let navBarColor: UIColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)

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
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)

        return refreshControl
    }()

    private lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: [
            "Most Popular",
            "Most Commented",
            "Created At"
        ])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false

        return segmentControl
    }()

    private lazy var titleViewNavBar: UIView = {
        let view = UIView()
        view.backgroundColor = navBarColor
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
        tableView.backgroundView = activityIndicator
        tableView.refreshControl = refreshControl
        tableView.backgroundColor = .lightGray.withAlphaComponent(0.65)

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
        getPostList()
    }

    private func setupView() {
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.shadowImage = UIImage()

        activityIndicator.startAnimating()

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

    private func updateTableView() {
        viewModel = nil
        tableView.reloadData()

        if !refreshControl.isRefreshing {
            activityIndicator.startAnimating()
        }
    }

}

// MARK: - Business Logic

extension PostListViewController {
    func getPostList(_ needRefresh: Bool = true) {
        interactor?.getPostList(selectedIndex: segmentControl.selectedSegmentIndex, needRefresh: needRefresh)
    }
}

// MARK: - Display Logic

extension PostListViewController {
    func displayPostList(viewModel: PostList.ViewModel) {
        disableAnimationActivity()

        self.viewModel = viewModel

        if viewModel.posts.count == 0 {
            tableView.backgroundView = labelBackgroundTable
        } else {
            tableView.backgroundView = activityIndicator
        }

        tableView.reloadData()
    }

    func displayError(_ message: String) {
        disableAnimationActivity()

        let alert = UIAlertController(title: "Error",
                                      message: "Please, try later",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.viewModel?.isLoading = false
        }))
        present(alert, animated: true, completion: nil)
    }

    private func disableAnimationActivity() {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        }

        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }

        if tableView.tableFooterView?.isHidden == false {
            tableView.tableFooterView?.isHidden = true
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PostListCell {
            UIView.animateScale(cell.commonView) {
                guard let identif = self.viewModel?.posts[indexPath.row].identifier else { return }
                self.router?.routeToPostDetail(by: identif)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.posts.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let post = viewModel?.posts[indexPath.row],
            let cell = tableView
                .dequeueReusableCell(withIdentifier: PostListCell.identifier,
                                     for: indexPath) as? PostListCell else {
            return UITableViewCell()
        }

        cell.configure(with: post)

        if let image = post.author.photoImage {
            cell.setAvatar(image)
        } else if let url = post.author.photoUrl {
            DispatchQueue.global(qos: .userInitiated).async {
                self.interactor?.getImage(by: url) { image in
                    self.viewModel?.posts[indexPath.row].author.photoImage = image
                    cell.setAvatar(image)
                }
            }
        }

        if let image = post.image?.contentImage {
            cell.setContent(image)
        } else if let url = post.image?.url {
            DispatchQueue.global(qos: .userInitiated).async {
                self.interactor?.getImage(by: url) { image in
                    self.viewModel?.posts[indexPath.row].image?.contentImage = image
                    cell.setContent(image)
                }
            }
        }

        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let viewModel = viewModel else { return }

        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >=
                scrollView.contentSize.height) &&
            !viewModel.isLastPage &&
            !viewModel.isLoading &&
            tableView.tableFooterView?.isHidden == true {

            tableView.tableFooterView?.isHidden = false
            self.viewModel?.isLoading = true
            getPostList(false)
        }
    }

}

// MARK: - Events

extension PostListViewController {
    @objc private func refreshTable() {
        updateTableView()
        getPostList()
    }
}
