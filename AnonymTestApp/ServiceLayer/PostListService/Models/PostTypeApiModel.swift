//
//  PostTypeApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

enum PostTypeApiModel: String, Codable {
    case plain = "PLAIN"
    case plainCover = "PLAIN_COVER"
    case video = "VIDEO"
}
