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

    let avatarImageWidthAnchor: CGFloat = 70
    let commonPadding: CGFloat = 10

    // MARK: - Views

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
        label.font = .boldSystemFont(ofSize: 15)
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

        addSubview(nameAuthorLabel)
        addSubview(avatarAuthorImageView)

        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            avatarAuthorImageView.topAnchor.constraint(equalTo: topAnchor, constant: commonPadding),
            avatarAuthorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: commonPadding),
            avatarAuthorImageView.widthAnchor.constraint(equalToConstant: avatarImageWidthAnchor),
            avatarAuthorImageView.heightAnchor.constraint(equalToConstant: avatarImageWidthAnchor),

            nameAuthorLabel.topAnchor.constraint(equalTo: avatarAuthorImageView.bottomAnchor, constant: commonPadding),
            nameAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: commonPadding),
            nameAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: commonPadding),
            nameAuthorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: commonPadding)
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
