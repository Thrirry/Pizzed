//
//  Structuration.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

struct ProductStorage {
    var composition: String
    var nutritionals: [Nutritional]
    var descriptions: [Description]
    var imageUrls: [ImageUrl]
    
    struct Nutritional: Codable {
        var calories: String
        var carbohydrate:String
        var proteins: String
        var fats: String
    }
    
    struct Description: Codable {
        var weight: String
        var size: String
        var price: Int
    }
    
    struct ImageUrl: Codable {
        var firstImg: String
        var secondImg: String
        var thirdImg: String
    }
}

struct ProductStorageService: Decodable {
    let productId: Int
    let productCategory: String
    let productInfo: [Info]
    
    struct Info: Decodable {
        let name: String
        let detail: [Detail]
        let state: String
        
        struct Detail: Decodable {
            let composition: String
            let nutritional: ProductStorage.Nutritional
            let description: ProductStorage.Description
            let imageUrl: ProductStorage.ImageUrl
        }
    }
}

extension ProductStorage {
    init(from service: ProductStorageService) {
        composition = service.productCategory
        nutritionals = []
        descriptions = []
        imageUrls = []
        
        for product_info in service.productInfo {
            for details in product_info.detail{
                descriptions.append(details.description)
                nutritionals.append(details.nutritional)
                imageUrls.append(details.imageUrl)
            }
        }
    }
}

public struct Menu {
    static let PizzaWorld = 0
    static let Cart = 1
    static let Map = 2
    static let Clock = 3
    static let Telephone = 4
    static let Back = 5
}

public struct RighBar {
    static let Hey = 0
    static let Marine = 1
    static let MultiMeat = 2
    static let Cheese = 3
    static let Chili = 4
    static let Pineapple = 5
    static let Salad = 6
    static let Onion = 7
    static let Strawberry = 8
    static let Vegetarian = 9
    static let Mushroom = 10
    static let Olives = 11
    static let Drinks = 12
    static let News = 13
}

//struct RightBar: Codable {
//    var iconId: String
//    var iconName: String
//    var cell: String
//    var iconBackground: String
//}
