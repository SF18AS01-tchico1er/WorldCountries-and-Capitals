//
//  Africa.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.


import UIKit
import SafariServices
class AfricaTableViewController: UITableViewController{
    
    var storeItemController: StoreItemController = StoreItemController(); //p. 893, step2, bullet 1
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterSegmentedController: UISegmentedControl!
    var country: [African] = [
        African(name: "Algeria", capital: "Algers"),
        African(name: "Angola", capital:  "Luanda"),
        African(name: "Benin", capital: "Porto-Novo"),
        African(name: "Botswana", capital: "Gaborone"),
        African(name: "Burkina Faso", capital: "Ouagadougou"),
        African(name: "Burundi", capital: "Gitega"),
        African(name: "Cameroon", capital: "Yaounde"),
        African(name: "Cap Verde", capital: "Praia"),
        African(name: "Central African Republic", capital: "Bangui"),
        African(name: "Chad", capital: "N’Djamena"),
        African(name: "Comoros", capital: "Moroni"),
        African(name: "Democratic Republic of Congo", capital: "Kinshasa"),
        African(name: "Republic of Congo", capital: "Brazzaville"),
        African(name: "Cote d’Ivoire", capital: "Yamoussoukro"),
        African(name: "Djibouti", capital: "Djibouti"),
        African(name: "Egypt", capital: "Cairo"),
        African(name: "Equatorial Guinea", capital: "Malabo"),
        African(name: "Eritrea", capital: "Asmara"),
        African(name: "Gabon", capital: "Addis Ababa"),
        African(name: "Ethiopia", capital: "Libreville"),
        African(name: "Gambia", capital: "Banjul"),
        African(name: "Ghana", capital: "Accra"),
        African(name: "Guinea Conakry", capital: "Conakry"),
        African(name: "Guinea Bissau", capital: "Bissau"),
        African(name: "Kenya", capital: "Nairobi"),
        African(name: "Lesotho", capital: "Maseru"),
        African(name: "Liberia", capital: "Monrovia"),
        African(name: "Libya",   capital:   "Tripoli"),
        African(name: "Madagascar", capital: "Antananarivo"),
        African(name: "Malawi", capital: "Lilongwe"),
        African(name: "Mali", capital: "Bamako"),
        African(name: "Mauritania", capital: "Nouakchott"),
        African(name: "Mauritius", capital: "Port Louis"),
        African(name: "Morocco", capital: "Rabat"),
        African(name: "Mozambique", capital: "Maputo"),
        African(name: "Namibia", capital: "Windhoek"),
        African(name: "Niger", capital: "Niamey"),
        African(name: "Nigeria", capital: "Abuja"),
        African(name: "Rwanda", capital: "Kigali"),
        African(name: "Republic Arab Saharawi Democratic",
                capital: "AauinSao Tome and Principe Sao Tome"),
        African(name: "Senegal", capital: "Dakar"),
        African(name: "Seychelles", capital: "Victoria"),
        African(name: "Sierra Leone", capital: "Algiers"),
        African(name: "Somalia", capital: "Freetown"),
        African(name: "South Africa", capital: "Pretoria"),
        African(name: "South Sudan", capital: "Juba"),
        African(name: "Sudan", capital: "Khartoum"),
        African(name: "Swaziland", capital: "Lobamba"),
        African(name: "Tanzania", capital: "Dar es Salaam"),
        African(name: "Togo", capital: "Lomé"),
        African(name: "Tunisia", capital: "Tunis"),
        African(name: "Uganda", capital: "Kampala"),
        African(name: "Zambia", capital: "Lusaka"),
        African(name: "Zimbabwe", capital: "Harare")
        
    ]
    
    // add item controller property
    
    var items: [StoreItem] = [StoreItem]();   //p. 893, step 2, bullet 2
    let queryOptions: [String] = ["movie", "music", "info", "book","president"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.rightBarButtonItem = editButtonItem

    }
    
    func fetchMatchingItems() {
        
        items = [];
        tableView.reloadData();
        let searchTerm: String = searchBar.text ?? ""
        let mediaType: String = queryOptions[filterSegmentedController.selectedSegmentIndex]
        if !searchTerm.isEmpty {
            
            // Set up query dictionary.
            let query: [String: String] = [   //p. 893, step 2, bullet 3
                "term":  searchTerm,
                "media": mediaType,
                "lang":  "en_us",
                "limit": "10"
            ];
            
            // Use the item controller to fetch items.
            
            storeItemController.fetchItems(matching: query) {(items: [StoreItem]?) in //p. 893, step 2, bullet 4
                // If successful, use the main queue to set items and reload the table view.
                // Otherwise, print an error to the console.
                if let items: [StoreItem] = items {
                    print("fetched \(items)");
                    self.items = items;   //3 variables with the same name
                    DispatchQueue.main.async {   //p. 894, step 3, bullet 2
                        self.tableView.reloadData();
                    }
                } else {
                    print("could not fetch items for \(mediaType) \(searchTerm)");
                }
            }
            
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let item: StoreItem = items[indexPath.row];
        
        // Set label to the item's name.
        // Set detail label to the item's subtitle.
        cell.textLabel?.text = item.trackName;          //p. 893, step 2, bullet 2
        cell.detailTextLabel?.text = item.artistName;   //p. 894, step 4, bullet 1
        
        // Reset the image view to the gray image.
        cell.imageView?.image = UIImage(named: "gray"); //p. 894, step 4, bullet 3
        
        // Initialize a network task to fetch the item's artwork.
        // If successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the
        
        //p. 894, step 4, bullet 3
        let task: URLSessionTask = URLSession.shared.dataTask(with: item.artworkUrl100) {(data: Data?, response: URLResponse?, error: Error?) in
            guard let data: Data = data else {
                print("no artwork data was returned");
                return;
            }
            
            guard let image: UIImage = UIImage(data: data) else {
                print("can't create image from data");
                return;
            }
            
            DispatchQueue.main.async {
                cell.imageView?.image = image;
            }
        }
        
        task.resume();
    }
    @IBAction func filterOptionUpdate(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard section == 0 else{
            fatalError("thereis no section\(section)")
        }
        // #warning Incomplete implementation, return the number of rows
        return country.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else{
            fatalError("there is no section number\(indexPath.section).")
        }
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "AfricanCell", for: indexPath)
        // Configure the cell...
        let african: African = country[indexPath.row];
        cell.textLabel?.text = "The capital of \(african.name) is \(african.capital).";
        cell.detailTextLabel?.text = " \(country[indexPath.row])";
        cell.imageView?.image = UIImage(named: country[indexPath.row].name)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            country.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: . automatic)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //MARK: return .insert
        switch indexPath.row % 3 {
        case 0:
            return .none
        case 1:
            return .delete
        case 2:
            return .insert
        default:
            return .none
        }
    }
    
    // MARK: - Protocol UITableViewControllerDelegate
    
    //MARK: Called when a cell is tapped.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let state: String = " \(country[indexPath.row])";
        var urlComponents: URLComponents = URLComponents();
        urlComponents.scheme = "http";
        urlComponents.host = "youtube.com"; //MARK: English
        urlComponents.path = "/youtube/\(state)";    //MARK: will change " " to "%20"
        
        guard let url: URL = urlComponents.url else {
            fatalError("could not create url for state \(state)");
        }
        
        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
        present(safariViewController, animated: true);
        
    }
    // MARK: Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //MARK: Return false if you do not want the specified item to be editable.
        return true
        
    }
    //MARK: Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    //MARK: Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        //MARK: Return false if you do not want the item to be re-orderable.
        return true
    }
    
}
extension AfricaTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchMatchingItems();
        searchBar.resignFirstResponder();
    }
}
