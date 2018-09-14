//
//  APIClient.swift
//  Pizzed
//
//  Created by Gone on 8/31/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import Foundation

typealias APIJSON = [String: Any]

struct APIClient {
    static func getObjectsAPI(named: String, completion: @escaping (APIJSON?) -> Void) {
        let url = URL(string: named)
        let session = URLSession.shared
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            guard let unwrappedData = data else { print("Error unwrapping data"); return }
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? APIJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
