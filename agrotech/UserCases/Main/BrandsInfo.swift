//
//  MainTableData.swift
//  agrotech
//
//  Created by n.shmatov on 12.11.2019.
//  Copyright © 2019 n.shmatov. All rights reserved.
//

import UIKit

struct BrandsInfo {
    var brands: [BrandModel]
}

struct BrandModel {
    var type: AgroBrand
    var image: UIImage?
    var logo: UIImage?
    var name: String
    var description: String
}

enum AgroBrand: String {
    case rostselmash
    case claas
    case deutz_fahr
    case john_deere
}
