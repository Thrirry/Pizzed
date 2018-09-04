//
//  Structuration.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

struct RightbarData {
    let name: String
    let cell: String
    let coverImage: String
    
    init(dictionary: apiJSON) {
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
    let id: String
    
    init(dictionary: apiJSON) {
        self.cell = dictionary["cell"] as! String
        self.image = dictionary["image"] as! String
        self.title = dictionary["title"] as! String
        self.size = dictionary["size"] as! String
        self.content = dictionary["content"] as! String
        self.price = dictionary["price"] as! String
        self.state = dictionary["state"] as! String
        self.id = dictionary["id"] as! String
    }
}
