//
//  StatsModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct StatsModel: Codable {
    var likes, views, comments, shares: CommentsModel?
    var replies: CommentsModel?
}
