//
//  Product.swift
//  LoadVCFromNib
//
//  Created by Mike Saradeth on 4/26/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation



struct Product: Codable {
    var id: String
    var name: String
    var description: String
    var price: Int
    var thumbnailUrl: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case thumbnailUrl = "thumbnail_url"
        case imageUrl = "image_url"
    }
    
}

struct PodsService: Codable {
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = "pods"
    }
}
