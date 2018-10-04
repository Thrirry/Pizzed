//
//  Structuration.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

struct MenuStore: Codable {
    var iconId: String
    var iconName: String
    var cell: String
    var iconBackground: String
}

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

struct IconMenuSlide {
    let cell: Int
    let image: UIImage?
    let title: String
}
