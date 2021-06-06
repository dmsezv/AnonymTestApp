//
//  ContentDataModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct ContentDataModel: Codable {
    var value: String?
    var extraSmall, small, original, medium: ExtraLargeModel?
    var large: ExtraLargeModel?
    var duration: Double?
    var url: String?
    var size: SizeModel?
    var previewImage: PreviewImageModel?
    var extraLarge: ExtraLargeModel?
    var values: [String]?
}
