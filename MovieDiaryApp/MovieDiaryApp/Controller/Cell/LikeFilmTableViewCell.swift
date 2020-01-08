//
//  LikeFilmTableViewCell.swift
//  MovieDiaryApp
//
//  Created by Xcode on 8.12.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit

class LikeFilmTableViewCell: UITableViewCell {

    @IBOutlet weak var LikeFilmTitle: UILabel!
    @IBOutlet weak var LikeFilmPoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
