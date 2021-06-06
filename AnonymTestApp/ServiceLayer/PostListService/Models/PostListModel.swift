//
//  PostListModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PostListModel: Codable {
    var items: [PostModel]?
    var cursor: String?
}
