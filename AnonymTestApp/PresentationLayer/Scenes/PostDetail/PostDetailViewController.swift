//
//  PostDetailViewController.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailDisplayLogic: AnyObject {
    func displayPostDetail()
    func displayError(_ message: String)
}

class PostDetailViewController: UIViewController, PostDetailDisplayLogic {
    var interactor: PostDetailBusinessLogic?
    var router: (PostDetailRoutingLogic & PostDetailDataPassing)?

    // MARK: - Drawing Constants

    let commonLabelFontSize: CGFloat = 15

    // MARK: - Object lifecycle

    // MARK: - Views

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        return activityIndicator
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var textContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: commonLabelFontSize)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground

        activityIndicator.startAnimating()

        view.addSubview(activityIndicator)

        setupLayout()
    }

    private func setupLayout() {
        let safeView = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeView.centerYAnchor)
        ])
    }
}

// MARK: - Display Logic

extension PostDetailViewController {
    func displayPostDetail() {
        disableAnimationActivity()

    }

    func displayError(_ message: String) {
        disableAnimationActivity()

        let alert = UIAlertController.errorAlert(message)
        present(alert, animated: true, completion: nil)
    }

    private func disableAnimationActivity() {
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        }
    }
}

// MARK: - Business Logic

extension PostDetailViewController {

}
