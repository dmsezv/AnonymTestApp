//
//  PostListCell.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import UIKit

class PostListCell: UITableViewCell {
    static var identifier = "PostListCell"

    // MARK: - Drawing Constants

    // MARK: - Views

    private lazy var avatarAuthorImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var nameAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    // MARK: - Setup

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func setupView() {
        selectionStyle = .none

        addSubview(nameAuthorLabel)

        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameAuthorLabel.topAnchor.constraint(equalTo: topAnchor),
            nameAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameAuthorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Configure

    func configure(with model: PostList.ViewModel.Post) {
        textLabel?.text = model.author.name
    }
}
