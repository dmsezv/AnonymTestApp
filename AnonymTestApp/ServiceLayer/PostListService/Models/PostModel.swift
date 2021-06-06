//
//  PostModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PostModel: Codable {
    var id: String?
    var type: PostTypeModel?
    var isCommentable, hasAdultContent, isAuthorHidden, isHiddenInProfile: Bool?
    var contents: [ContentModel]?
    var createdAt, updatedAt: Int?
    var author: AuthorModel?
    var stats: StatsModel?
}
