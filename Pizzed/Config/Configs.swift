//
//  Configs.swift
//  Pizzed
//
//  Created by Gone on 9/2/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import Foundation
// All configuration variables based on the variety of environments must be placed here

struct Config {
    #if DEBUG
    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/nwnpgzme6/product-api.json"
    static let pizzaAPI = "https://static.tumblr.com/vgmqumd/rFnph5zpx/pizzaapi.json"
    static let testAPI = "https://api.github.com/search/repositories?q=language:swift&per_page=10"
    #else
//    static let apiRightbarURL = "https://static.tumblr.com/vgmqumd/gBqpg08uf/api-menu.json"
    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/nwnpgzme6/product-api.json"
    #endif
}
