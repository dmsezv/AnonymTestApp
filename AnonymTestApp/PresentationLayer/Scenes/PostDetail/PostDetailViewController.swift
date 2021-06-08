//
//  PostDetailViewController.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 08.06.2021.
//  

import UIKit

protocol PostDetailDisplayLogic: AnyObject {
    func displaySomething(viewModel: PostDetail.ViewModel)
}

class PostDetailViewController: UIViewController, PostDetailDisplayLogic {
    var interactor: PostDetailBusinessLogic?
    var router: (PostDetailRoutingLogic & PostDetailDataPassing)?

    // MARK: - Object lifecycle

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
    }

    // MARK: Do something

    // @IBOutlet weak var nameTextField: UITextField!

    func doSomething() {
        let request = PostDetail.Request()
        interactor?.doSomething(request: request)
    }

    func displaySomething(viewModel: PostDetail.ViewModel) {
        // nameTextField.text = viewModel.name
    }
}
