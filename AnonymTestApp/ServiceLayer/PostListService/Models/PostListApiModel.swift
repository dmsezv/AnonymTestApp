//
//  PostListApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PostListApiModel: Codable {
    var items: [PostApiModel]?
    var cursor: String?
}
