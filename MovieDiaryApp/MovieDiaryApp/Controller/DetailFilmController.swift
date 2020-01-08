//
//  DetailFilmController.swift
//  MovieDiaryApp
//
//  Created by Xcode on 8.12.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit

class DetailFilmController: UIViewController {
    let  _detailService = DetailService();
    var selectedFilm : Search?;
    @IBOutlet weak var DetailFilmPoster: UIImageView!
    @IBOutlet weak var DetailFilmTitle: UILabel!
    @IBOutlet weak var DetailFilmImdb: UILabel!
    @IBOutlet weak var DetailFilmYear: UILabel!
    @IBOutlet weak var DetailFilmVotes: UILabel!
    @IBOutlet weak var DetailFilmDetail: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters: [String: String] = [
            "apikey":"ebb5f279",
            "i": selectedFilm!.imdbID!
         ]
        self._detailService.getDetail(param: parameters) { (FilmDetail) in
            DispatchQueue.main.async {
                self.DetailFilmTitle.text = FilmDetail.title
                self.DetailFilmImdb.text = FilmDetail.imdbRating
                self.DetailFilmDetail.text = FilmDetail.plot
                self.DetailFilmVotes.text = FilmDetail.imdbVotes
                self.DetailFilmYear.text = FilmDetail.year
                let imageURL = URL(string: (self.selectedFilm?.poster!)!)
                self.DetailFilmPoster.kf.setImage(with: imageURL)


            }
        }
    }
}
