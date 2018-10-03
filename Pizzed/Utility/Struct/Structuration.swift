//
//  Structuration.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
// swiftlint:disable force_cast
struct RightbarData {
    let name: String
    let cell: String
    let coverImage: String
    init(dictionary: APIJSON) {
        self.name = dictionary["name"] as! String
        self.cell = dictionary["cell"] as! String
        self.coverImage = dictionary["image"] as! String
    }
}

struct PizzaData {
    let cell: String
    let title: String
    let content: String
    let size: String
    let price: String
    let image: String
    let state: String
    let idPizza: String
    init(dictionary: APIJSON) {
        self.cell = dictionary["cell"] as? String ?? ""
        self.image = dictionary["image"] as! String
        self.title = dictionary["title"] as! String
        self.size = dictionary["size"] as! String
        self.content = dictionary["content"] as! String
        self.price = dictionary["price"] as! String
        self.state = dictionary["state"] as! String
        self.idPizza = dictionary["id"] as! String
    }
}

struct IconMenuSlide {
    let cell: Int
    let image: UIImage
    let title: String
}
