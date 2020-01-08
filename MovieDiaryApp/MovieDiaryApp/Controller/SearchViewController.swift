import UIKit
import Kingfisher
class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let _searchService = SearchService();
    var films = [Search]();
    var selectedFilm : Search?;
         
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var SearchBox: UISearchBar!
    @IBOutlet weak var SearchTableView: UITableView!
    @IBAction func SearchButton(_ sender: Any) {
        let parameters: [String: String] = [
            "apikey":"ebb5f279",
            "type": "movie",
            "s": SearchBox.text!
        ]
        self._searchService.search(param: parameters){ (data) in
            self.films = data
            DispatchQueue.main.async {
                self.SearchTableView.reloadData();
                self.hideKeyboard();
            };
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as?
            SearchViewTableViewCell else { return UITableViewCell() }
        cell.frame.size.height=250;
        cell.SearchTitle.text = films[indexPath.row].title
         let imageURL = URL(string: films[indexPath.row].poster!)
        cell.SearchPoster.kf.setImage(with: imageURL);        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                selectedFilm = films[indexPath.row];
        self.performSegue(withIdentifier: "ToDetailsFilmSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailsFilmSegue" {
            let destinationVC = segue.destination as! DetailFilmController
            destinationVC.selectedFilm = selectedFilm
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let printAction = self.printAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [printAction])
    }
    func printAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "print") {  (action, view, completion) in
            DispatchQueue.main.async {
                 RealmHelper.sharedInstance.addData(object: self.films[indexPath.row])
            }
            let alert = UIAlertController(title: "Alert", message: self.films[indexPath.row].title!+" Eklendi", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
            completion(true)
        }
        action.title = "Ekle";
        return action
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchTableView.delegate = self
        SearchTableView.dataSource = self
        navBar.title = "Movie Diary App"
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}


