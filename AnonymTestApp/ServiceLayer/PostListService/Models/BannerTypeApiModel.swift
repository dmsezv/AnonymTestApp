//
//  BannerTypeApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

enum BannerTypeApiModel: String, Codable {
    case image = "IMAGE"
    case imageGIF = "IMAGE_GIF"
    case tags = "TAGS"
    case text = "TEXT"
    case video = "VIDEO"
}
