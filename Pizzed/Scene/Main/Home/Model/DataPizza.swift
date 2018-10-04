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
    var serviceProduct = [ProductStorageService]()
    var pizzaStore = [ProductStorage]()
    
    var menu = [MenuStore]()
    func fetchJSON(completion: @escaping () -> Void) {
        guard let url = URL(string: Config.apiPizzaURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.serviceProduct = try decoder.decode([ProductStorageService].self, from: data)
                    self.pizzaStore = self.serviceProduct.map { ProductStorage(from: $0) }
                    
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
                OperationQueue.main.addOperation {
                    completion()
                }
            }
            }.resume()
    }
}
