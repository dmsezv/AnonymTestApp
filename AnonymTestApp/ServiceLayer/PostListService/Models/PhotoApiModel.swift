//
//  PhotoApiModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PhotoApiModel: Codable {
    var type: BannerTypeApiModel?
    var id: String?
    var data: PhotoDataApiModel?
}
