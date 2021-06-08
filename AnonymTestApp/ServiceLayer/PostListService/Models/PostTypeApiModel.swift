//
//  PostTypeApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

enum PostTypeApiModel: String {
    case plain = "PLAIN"
    case plainCover = "PLAIN_COVER"
    case video = "VIDEO"
    case unknown
}

extension PostTypeApiModel: Codable {
    public init(from decoder: Decoder) throws {
        self = try PostTypeApiModel(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
