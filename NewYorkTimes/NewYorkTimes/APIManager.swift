//
//  APIManager.swift
//  NewYorkTimes
//
//  Created by Simone on 11/20/16.
//  Copyright © 2016 Simone. All rights reserved.
//

import Foundation

class APIManager {
    static let manager = APIManager()
    private init() {}
    
    let NYTEndpoint = "http://api.nytimes.com/svc/topstories/v2/home.json?api-key=4eb9c9ccae8148b39c2e02cd90ff1e39"
    
    func getData(NYTEndpoint: String, callback: @escaping (Data?) -> Void) {
        guard let customURL = URL(string: NYTEndpoint) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: customURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Session error: \(error)")
            }
            guard let validData = data else {return}
            callback(validData)
        }.resume()
    }
}

extension APIManager {
    static func parseJSONFromData(_ jsonData: Data?) -> [String: AnyObject]? {
        if let data = jsonData {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                print(jsonDictionary)
                return jsonDictionary
            } catch let error as NSError {
                print("error processing json data: \(error.localizedDescription)")
            }
        }
        return nil
    }
}
