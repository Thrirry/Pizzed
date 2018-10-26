//
//  PizzaDetailList.swift
//  Pizzed
//
//  Created by Gone on 10/26/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import ObjectMapper

class PizzaDetailListInput: APIInputBase {
    
    init(pizzaFullName: String) {
        super.init(urlString: String(format: Config.pizzaAPI, pizzaFullName),
                   parameters: nil,
                   requestType: .get)
    }
}

class PizzaDetailListOutput: APIOutputBase {
    
    var pizzaDetail = [Pizza]()
    
    init(pizzaDetail: [Pizza]) {
        self.pizzaDetail = pizzaDetail
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
}
