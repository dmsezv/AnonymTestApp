//
//  PreviewImageApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PreviewImageApiModel: Codable {
    var extraSmall, medium: ExtraLargeApiModel?
}
