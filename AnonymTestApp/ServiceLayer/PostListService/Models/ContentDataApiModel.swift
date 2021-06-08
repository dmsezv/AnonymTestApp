//
//  ContentDataApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct ContentDataApiModel: Codable {
    var value: String?
    var extraSmall, small, original, medium, large, extraLarge: ExtraLargeApiModel?
    var duration: Double?
    var url: String?
    var size: SizeApiModel?
    var previewImage: PreviewImageApiModel?
    var values: [String]?
}
