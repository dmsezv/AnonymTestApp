//
//  PostApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PostApiModel: Codable {
    var id: String?
    // var type: PostTypeApiModel?
    var isCommentable, hasAdultContent, isAuthorHidden, isHiddenInProfile: Bool?
    var contents: [ContentApiModel]?
    var createdAt, updatedAt: Int?
    var author: AuthorApiModel?
    // var stats: StatsApiModel?
}
