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

    let avatarImageWidthAnchor: CGFloat = 28
    let commonPadding: CGFloat = 12
    let nameAuthorLabelFontSize: CGFloat = 14
    let commonViewRadius: CGFloat = 12
    let dividerViewHeight: CGFloat = 3
    let dividerViewWidth: CGFloat = 30
    let dividerViewRadius: CGFloat = 2

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

    private lazy var dividerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = dividerViewRadius
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
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
        commonView.addSubview(avatarAuthorImageView)
        commonView.addSubview(nameAuthorLabel)
        commonView.addSubview(dividerView)

        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            commonView.topAnchor.constraint(equalTo: topAnchor, constant: commonPadding),
            commonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: commonPadding),
            commonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -commonPadding),
            commonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -commonPadding),
            commonView.heightAnchor.constraint(equalToConstant: 100),

            avatarAuthorImageView.topAnchor.constraint(equalTo: commonView.topAnchor, constant: commonPadding),
            avatarAuthorImageView.leadingAnchor.constraint(equalTo: commonView.leadingAnchor, constant: commonPadding),
            avatarAuthorImageView.widthAnchor.constraint(equalToConstant: avatarImageWidthAnchor),
            avatarAuthorImageView.heightAnchor.constraint(equalToConstant: avatarImageWidthAnchor),

            dividerView.topAnchor.constraint(equalTo: avatarAuthorImageView.bottomAnchor, constant: commonPadding),
            dividerView.leadingAnchor.constraint(equalTo: commonView.leadingAnchor, constant: commonPadding),
            dividerView.heightAnchor.constraint(equalToConstant: dividerViewHeight),
            dividerView.widthAnchor.constraint(equalToConstant: dividerViewWidth),

            nameAuthorLabel.centerYAnchor.constraint(equalTo: avatarAuthorImageView.centerYAnchor),
            nameAuthorLabel.leadingAnchor.constraint(equalTo: avatarAuthorImageView.trailingAnchor, constant: commonPadding),
            nameAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: commonPadding)
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
