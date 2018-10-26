//
//  SwinjectStoryboard.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard
{
    class func setup ()
    {
        Container.loggingFunction = nil
        
        defaultContainer.register(PizzaServiceProtocol.self, factory: { _ in return PizzaService() })
    }
}
