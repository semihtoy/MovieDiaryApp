//
//  LikeFilmViewController.swift
//  MovieDiaryApp
//
//  Created by Xcode on 8.12.2019.
//  Copyright © 2019 Xcode. All rights reserved.
//

import UIKit
class LikeFilmController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var films = [Search]();
    let _SqlHelper = SQLHelper();
    @IBOutlet weak var LikeTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell") as?
            LikeFilmTableViewCell else { return UITableViewCell() }
        cell.frame.size.height=250;
        cell.LikeFilmTitle.text = films[indexPath.row].title
        let imageURL = URL(string: films[indexPath.row].poster!);
            
        cell.LikeFilmPoster.kf.setImage(with: imageURL)
  
            
        
        return cell
    }
    override func viewDidLoad() {
        
        super.viewDidLoad();
        LikeTableView.dataSource = self
        LikeTableView.delegate = self
        films = RealmHelper.sharedInstance.getDataFromDB().map { $0 }
        self.LikeTableView.reloadData()
    }
}
