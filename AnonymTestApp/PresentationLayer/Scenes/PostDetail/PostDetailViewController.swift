//
//  PostDetailViewController.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailDisplayLogic: AnyObject {
    func displayPostDetail(viewModel: PostDetail.ViewModel)
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

    private lazy var scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var textContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: commonLabelFontSize)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

        interactor?.getPostDetail()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground

        activityIndicator.startAnimating()

        view.addSubview(activityIndicator)
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        setupLayout()
    }

    private func setupLayout() {
        let safeView = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeView.centerYAnchor),

            scrollView.topAnchor.constraint(equalTo: safeView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor),

            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func addContent(_ text: String) {
        textContentLabel.text = text

        scrollViewContainer.addArrangedSubview(textContentLabel)
    }

    private func addContent(_ image: UIImage, height: Int) {
        contentImageView.image = image
        let ratio = image.size.width / image.size.height
        contentImageView.widthAnchor
            .constraint(equalTo: contentImageView.heightAnchor, multiplier: ratio).isActive = true

        scrollViewContainer.addArrangedSubview(contentImageView)
    }
}

// MARK: - Display Logic

extension PostDetailViewController {
    func displayPostDetail(viewModel: PostDetail.ViewModel) {
        disableAnimationActivity()

        if let imageContent = viewModel.imageContent,
           let image = imageContent.image,
           let height = imageContent.imageHeight {
            addContent(image, height: height)
        }

        if let text = viewModel.text {
            addContent(text)
        }
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
