//
//  DataForPizza.swift
//  Pizzed
//
//  Created by Gone on 8/31/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import Foundation
import UIKit

final class DataForPizza {
    
    static let sharedInstance = DataForPizza()
    fileprivate init() {}
    
    var pizzaData: [PizzaData] = []
    var images: [UIImage] = []
    
    func getPizzaData(completion: @escaping () -> Void) {
        
        APIClient.getObjectsAPI(named: Config.apiPizzaURL){ (json) in
            let feed = json?["feed"] as? apiJSON
            if let results = feed?["pizza"] as? [apiJSON] {
                for dict in results {
                    let newPizzaData = PizzaData(dictionary: dict)
                    self.pizzaData.append(newPizzaData)
                }
                    completion()
            }
        }
    }
    
    func getPizzaImages(completion: @escaping () -> Void) {
        getPizzaData {
            for image in self.pizzaData {
                let url = URL(string: image.image)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
}
