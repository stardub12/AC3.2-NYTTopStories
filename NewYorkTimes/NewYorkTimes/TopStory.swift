////
////  TopStory.swift
////  NewYorkTimes
////
////  Created by Simone on 11/20/16.
////  Copyright © 2016 Simone. All rights reserved.


import UIKit

class TopStory {
    var headline: String?
    var section: String?
    var articlePreview: String?
    var openURL: String?
    var author: String?
    var date: String?
    init(headline: String, section: String, articlePreview: String, openURL: String, author: String, date: String) {
        self.headline = headline
        self.section = section
        self.articlePreview = articlePreview
        self.openURL = openURL
        self.author = author
        self.date = date
    }
    
    static func getHeadlines(data: Data) -> [TopStory]? {
        var stories: [TopStory] = []
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                guard let results = json["results"] as? [[String:Any]] else {
                print("Could not cast JSON")
                return nil
            }
                for dict in results {
                    guard let headline = dict["title"] as? String,
                    let section = dict["subsection"] as? String,
                    let articlePreview = dict["abstract"] as? String,
                    let openURL = dict["url"] as? String,
                    let author = dict["byline"] as? String,
                    let date = dict["updated_date"] as? String else {
                        print("Error parsing data")
                        continue
                    }
                    let storyDict: TopStory = TopStory(headline: headline, section: section, articlePreview: articlePreview, openURL: openURL, author: author, date: date)
                    stories.append(storyDict)
                }
                return stories
            }
        } catch {
            print("Parsing error: \(data)")
        }
        return nil
    }    
}
