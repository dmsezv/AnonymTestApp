//
//  StatsApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct StatsApiModel: Codable {
    var likes, views, comments, shares: CommentsApiModel?
    var replies: CommentsApiModel?
}
