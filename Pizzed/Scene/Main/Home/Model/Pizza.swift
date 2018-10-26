//
//  Pizza.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import ObjectMapper

class Pizza: Mappable {
    var name: String?
    var detail: Detail?
    var state: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        detail <- map["detail"]
        state <- map["state"]
        
    }
}

class Detail: Mappable {
    
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

//class Nutritional: Mappable {
//
//    var calories: String?
//    var carbohydrate: String?
//    var proteins: String?
//    var fats: String?
//
//    required init?(map: Map) {
//    }
//
//    func mapping(map: Map) {
//        calories <- map["calories"]
//        carbohydrate <- map["carbohydrate"]
//        proteins <- map["proteins"]
//        fats <- map["fats"]
//    }
//}
