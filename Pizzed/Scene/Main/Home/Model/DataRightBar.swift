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
            let feed = json?["feed"] as? apiJSON
            if let results = feed?["pizza"] as? [apiJSON] {
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
    
    func getRightbarImages(completion: @escaping () -> Void) {
        getRightbarData {
            for data in self.rightbarData {
                let url = URL(string: data.coverImage)

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
