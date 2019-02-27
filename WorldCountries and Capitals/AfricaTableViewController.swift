//
//  Africa.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.


import UIKit
import SafariServices
class AfricaTableViewController: UITableViewController{
    
    var country: [African] = [
        African(name: "Algeria", capital: "Algiers"),
        African(name: "Angola", capital:  "Luanda"),
        African(name: "Benin", capital: "Porto-Novo"),
        African(name: "Botswana", capital: "Gaborone"),
        African(name: "Burkina Faso ", capital: "Ouagadougou"),
        African(name: "Burundi", capital: "Gitega"),
        African(name: "Cameroon", capital: "Bujumbura"),
        African(name: "Cap Verde", capital: "Yaounde"),
        African(name: "Central African Republic", capital: "Bangui"),
        African(name: "Chad", capital: "N’Djamena"),
        African(name: "Comoros", capital: "Moroni"),
        African(name: "Democratic Republic of Congo", capital: "Kinshasa"),
        African(name: "Republic of Congo", capital: "Brazzaville"),
        African(name: "Cote d’Ivoire", capital: "Yamoussoukro"),
        African(name: "Djibouti", capital: "Djibouti"),
        African(name: "AEgypt", capital: "Cairo"),
        African(name: "Equatorial Guinea ", capital: "Malabo"),
        African(name: "Eritrea", capital: "Asmara"),
        African(name: "Gabon", capital: "Addis Ababa"),
        African(name: "Ethiopia", capital: "Libreville"),
        African(name: "Gambia", capital: "Banjul"),
        African(name: "Ghana", capital: "Accra"),
        African(name: "Guinea Conakry", capital: "Conakry"),
        African(name: "Guinea-Bissau ", capital: "Bissau"),
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
        African(name: "Tunisia ", capital: "Tunis"),
        African(name: "Uganda", capital: "Kampala"),
        African(name: "Zambia", capital: "Lusaka"),
        African(name: "Zimbabwe", capital: "Harare")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.rightBarButtonItem = editButtonItem
        //navigationItem.title = "my title"
        // print("type(of: self) == \(type(of: self))");
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
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "AfricaCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = " \(country[indexPath.row])";
        cell.detailTextLabel?.text = "Welcome to the African \([indexPath.row + 1]) country in alphabetic order";
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
        //return .insert
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
    
    //Called when a cell is tapped.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let state: String = " \(country[indexPath.row])";
        print("selected \(state) in cell number \(indexPath)");
        
        
        var urlComponents: URLComponents = URLComponents();
        urlComponents.scheme = "https";
        urlComponents.host = "en.wikipedia.org"; //English
        urlComponents.path = "/wiki/\(state)";    //will change " " to "%20"
        
        guard let url: URL = urlComponents.url else {
            fatalError("could not create url for state \(state)");
        }
        
        let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
        present(safariViewController, animated: true);
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
}

