//
//  DataRightBar.swift
//  Pizzed
//
//  Created by Gone on 8/31/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import Foundation
import UIKit

final class DataForRightbar {
    static let sharedInstance = DataForRightbar()
    fileprivate init() {}
    
//    var rightBarData = [RightBar]()
//    func fetchJSON(completion: @escaping () -> Void) {
//        guard let url = URL(string: Config.apiRightBarURL) else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, err) in
//            DispatchQueue.main.async {
//                if let err = err {
//                    print("Failed to get data from url:", err)
//                    return
//                }
//                guard let data = data else { return }
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    self.rightBarData = try decoder.decode([RightBar].self, from: data)
//
//                } catch let jsonErr {
//                    print("Failed to decode:", jsonErr)
//                }
//                OperationQueue.main.addOperation {
//                    completion()
//                }
//            }
//            }.resume()
//    }
}
