//
//  NYTTableViewCell.swift
//  NewYorkTimes
//
//  Created by Simone on 11/20/16.
//  Copyright © 2016 Simone. All rights reserved.
//

import UIKit

class NYTTableViewCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    
    var headlines: TopStory? {
        didSet {
            headlineLabel?.text = headlines?.headline
            abstractLabel?.text = headlines?.articlePreview
            bylineLabel?.text = headlines?.author
            dateLabel?.text = headlines?.date
        }
    }
}
