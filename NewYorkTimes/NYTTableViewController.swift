//
//  NYTTableViewController.swift
//  NewYorkTimes
//
//  Created by Simone on 11/19/16.
//  Copyright © 2016 Simone. All rights reserved.
//

import UIKit

class NYTTableViewController: UITableViewController {
    var stories = [TopStory]()
    let NYTEndpoint = "http://api.nytimes.com/svc/topstories/v2/home.json?api-key=4eb9c9ccae8148b39c2e02cd90ff1e39"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.tableView.reloadData()
    }
    func loadData() {
        APIManager.manager.getData(NYTEndpoint: NYTEndpoint) { (data: Data?) in
            if let stories = TopStory.getHeadlines(data: data!) {
                self.stories = stories
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! NYTTableViewCell
        cell.headlines = stories[indexPath.row]
        return cell
    }
    
  
 // MARK: - UITableViewDelegate
 
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let index = stories[indexPath.row]
    let url: URL = URL(string: index.openURL!)!
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

    
