//
//  PhotoDataApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PhotoDataApiModel: Codable {
    var extraSmall, small, medium, original: ExtraLargeApiModel?
}
