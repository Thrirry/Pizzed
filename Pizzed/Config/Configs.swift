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
    static let apiRightbarURL = "https://static.tumblr.com/vgmqumd/loNpehpwq/menudata.json"
    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/vHfpehnx6/pizzadata.json"
    #else
    static let apiRightbarURL = "https://static.tumblr.com/vgmqumd/loNpehpwq/menudata.json"
    static let apiPizzaURL = "https://static.tumblr.com/vgmqumd/vHfpehnx6/pizzadata.json"
    #endif
}
