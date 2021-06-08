//
//  BannerTypeApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

enum BannerTypeApiModel: String {
    case image = "IMAGE"
    case imageGIF = "IMAGE_GIF"
    case tags = "TAGS"
    case text = "TEXT"
    case video = "VIDEO"
    case audio = "AUDIO"
    case unknown
}

extension BannerTypeApiModel: Codable {
    public init(from decoder: Decoder) throws {
        self = try BannerTypeApiModel(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
