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

    let avatarImageWidthAnchor: CGFloat = 100

    // MARK: - Views

    private lazy var avatarAuthorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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

    private func setupView() {
        selectionStyle = .none

        addSubview(nameAuthorLabel)
        addSubview(avatarAuthorImageView)

        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            avatarAuthorImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarAuthorImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarAuthorImageView.widthAnchor.constraint(equalToConstant: avatarImageWidthAnchor),
            avatarAuthorImageView.heightAnchor.constraint(equalToConstant: avatarImageWidthAnchor),

            nameAuthorLabel.topAnchor.constraint(equalTo: avatarAuthorImageView.bottomAnchor, constant: 20),
            nameAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameAuthorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
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
