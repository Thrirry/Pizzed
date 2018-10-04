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
    static let apiRightBarURL = "https://static.tumblr.com/vgmqumd/gBqpg08uf/api-menu.json"
    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/6u9pg27kf/api-product.json"
    static let apiLogoURL = "https://static.tumblr.com/vgmqumd/lEjpeisvw/logodata.json"
    #else
    static let apiRightbarURL = "https://static.tumblr.com/vgmqumd/gBqpg08uf/api-menu.json"
//    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/0CIpg22pt/api-product.json" //old
    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/6u9pg27kf/api-product.json"
    static let apiLogoURL = "https://static.tumblr.com/vgmqumd/lEjpeisvw/logodata.json"
    #endif
}
