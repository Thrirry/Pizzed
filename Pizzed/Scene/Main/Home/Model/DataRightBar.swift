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
    var rightbarData: [RightbarData] = []
    var images: [UIImage] = []
    func getRightbarData(completion: @escaping () -> Void) {

        APIClient.getObjectsAPI(named: Config.apiRightbarURL) { (json) in
            
            let feed = json?["feed"] as? APIJSON
            if let results = feed?["pizza"] as? [APIJSON] {
                for dict in results {
                    let newRightbarData = RightbarData(dictionary: dict)
                    self.rightbarData.append(newRightbarData)
                }
                OperationQueue.main.addOperation {
                    completion()
                }
            }
        }
    }
    
//    func fetchJSON(completion: @escaping () -> Void) {
//
//        guard let url = URL(string: Config.apiRightbarURL) else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, err) in
//            DispatchQueue.main.async {
//                if let err = err {
//                    print("Failed to get data from url:", err)
//                    return
//                }
//
//                guard let data = data else { return }
//
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    self.rightbarData = try decoder.decode([RightbarData].self, from: data)
//                    print(self.rightbarData)
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
//    func getRightbarImages(completion: @escaping () -> Void) {
//        getRightbarData {
//            for data in self.rightbarData {
//                let url = URL(string: data.coverImage)
//
//                let data = try? Data(contentsOf: url!)
//                if let imageData = data {
//                    let image = UIImage(data: imageData)
//                    self.images.append(image!)
//                }
//            }
//            OperationQueue.main.addOperation {
//                completion()
//            }
//        }
//    }
}
