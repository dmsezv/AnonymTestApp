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

    let avatarImageWidthAnchor: CGFloat = 30
    let commonPadding: CGFloat = 12
    let nameAuthorLabelFontSize: CGFloat = 14
    let commonViewRadius: CGFloat = 12

    // MARK: - Views

    private lazy var commonView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = commonViewRadius
        view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .systemBackground
        return view
    }()

    private lazy var avatarAuthorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = avatarImageWidthAnchor / 2
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var nameAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: nameAuthorLabelFontSize)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    // MARK: - Setup

    override func prepareForReuse() {
        imageView?.image = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear

        addSubview(commonView)
        // addSubview(nameAuthorLabel)
        // addSubview(avatarAuthorImageView)

        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            commonView.topAnchor.constraint(equalTo: topAnchor, constant: commonPadding),
            commonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: commonPadding),
            commonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -commonPadding),
            commonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -commonPadding),
            commonView.heightAnchor.constraint(equalToConstant: 100)

//            avatarAuthorImageView.topAnchor.constraint(equalTo: topAnchor, constant: commonPadding),
//            avatarAuthorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: commonPadding),
//            avatarAuthorImageView.widthAnchor.constraint(equalToConstant: avatarImageWidthAnchor),
//            avatarAuthorImageView.heightAnchor.constraint(equalToConstant: avatarImageWidthAnchor),
//            avatarAuthorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: commonPadding),
//
//            nameAuthorLabel.centerYAnchor.constraint(equalTo: avatarAuthorImageView.centerYAnchor),
//            nameAuthorLabel.leadingAnchor.constraint(equalTo: avatarAuthorImageView.trailingAnchor, constant: commonPadding),
//            nameAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: commonPadding)
        ])
    }

    // MARK: - Configure

    func configure(with model: PostList.ViewModel.Post) {
        nameAuthorLabel.text = model.author.name
    }

    func setAvatar(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.avatarAuthorImageView.image = image
        }
    }
}
