//
//  SearchViewTableViewCell.swift
//  MovieDiaryApp
//
//  Created by Xcode on 4.12.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {

    @IBOutlet weak var SearchTitle: UILabel!
    @IBOutlet weak var SearchPoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
