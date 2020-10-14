//
//  Offer.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation
import ObjectMapper

struct Offer: Entity, Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var imageUrl: String?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        imageUrl <- map["imageUrl"]
        
    }
}
