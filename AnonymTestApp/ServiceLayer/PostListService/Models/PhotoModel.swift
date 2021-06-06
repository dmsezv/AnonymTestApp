//
//  PhotoModel.swift
//  AnonymTestApp
//
//  Created by Dmitrii Zverev on 06.06.2021.
//

import Foundation

struct PhotoModel: Codable {
    var type: BannerTypeModel?
    var id: String?
    var data: PhotoDataModel?
}
