//
//  PizzaDetail.swift
//  Pizzed
//
//  Created by Gone on 10/27/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import ObjectMapper

class PizzaDetail: Mappable {
    var name: String?
    var detail: Details?
    var composition: String?
    // nutritional obj
    var calories: String?
    var carbohydrate: String?
    var proteins: String?
    var fats: String?
    // description obj
    var weight: String?
    var size: String?
    var price: Int?
    // image obj
    var firstImg: String?
    var secondImg: String?
    var thirdImg: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        name <- map["name"]
        detail <- map["detail"]
        
        composition <- map["composition"]
        // nutritional obj
        calories <- map["nutritional.calories"]
        proteins <- map["nutritional.proteins"]
        fats <- map["nutritional.fats"]
        // description obj
        weight <- map["description.weight"]
        size <- map["description.size"]
        price <- map["description.price"]
        // image obj
        firstImg <- map["image_url.first_img"]
        secondImg <- map["image_url.second_img"]
        thirdImg <- map["image_url.third_img"]
    }
}
