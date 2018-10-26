//
//  PizzaList.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import ObjectMapper

class PizzaListInput: APIInputBase {
    init() {
        super.init(urlString: Config.pizzaAPI,
                   parameters: nil,
                   requestType: .get)
    }
}

class PizzaListOutput: APIOutputBase {
    
    var repositories: [Pizza]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        repositories <- map["product_info"]
    }
}
