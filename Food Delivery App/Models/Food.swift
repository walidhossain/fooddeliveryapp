//
//  Food.swift
//  Food Delivery App
//
//  Created by Walid Hossain on 13/10/20.
//  Copyright © 2020 Walid Hossain. All rights reserved.
//

import Foundation
import ObjectMapper

struct Food: Entity, Mappable {
    var id: Int?
    var name: String?
    var description: String?
    var size: String?
    var price: Float?
    var imageUrl: String?
    var type: FoodType?
    
    init() {
        
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        size <- map["size"]
        price <- map["price"]
        imageUrl <- map["imageUrl"]
        if map.JSON["type"] as! String == "Pizza" {
            type = .Pizza
        }else if map.JSON["type"] as! String == "Sushi" {
            type = .Sushi
        }else {
            type = .Drinks
        }
    }
}

enum FoodType{
    case Pizza
    case Sushi
    case Drinks
}
