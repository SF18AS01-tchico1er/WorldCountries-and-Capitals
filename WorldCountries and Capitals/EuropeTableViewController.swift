//
//  Europe.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
//

import UIKit

class EuropeTableViewController: UITableViewController {
    
    var euroState :[EuropeState] = [
    
        EuropeState(name: "Albania", capital: "Tirana"),
        EuropeState(name: "Andorra", capital: "Andorra la Vella"),
        EuropeState(name: "Armenia Europe", capital: "Yerevan"),
        EuropeState(name: "Austria", capital: "L Vienna"),
        EuropeState(name: "Azerbaijan Europe", capital: "Baku"),
        EuropeState(name: "Belarus", capital: "Minsk"),
        EuropeState(name: "Belgium", capital: "Brussels"),
        EuropeState(name: "Bosnia Herzegovina", capital: "Sarajevo"),
        EuropeState(name: "Bulgaria", capital: "Sofia"),
        EuropeState(name: "Croatia", capital: "Zagreb"),
        EuropeState(name: "Cyprus Europe", capital: "Nicosia"),
        EuropeState(name: "Czech Republic", capital: "Prague"),
        EuropeState(name: "Denmark", capital: "Copenhagen"),
        EuropeState(name: "Estonia", capital: "Tallinn"),
        EuropeState(name: "Finland", capital: "Helsinki"),
        EuropeState(name: "France", capital: "Paris"),
        EuropeState(name: "Germany", capital: "Berlin"),
        EuropeState(name: "Greece", capital: "Athens"),
        EuropeState(name: "Georgia Europe", capital: "Tbilisi"),
        EuropeState(name: "Hungary", capital: "Budapest"),
        EuropeState(name: "Iceland", capital: "Reykjavik"),
        EuropeState(name: "Ireland", capital: "Dublin"),
        EuropeState(name: "Italy", capital: "Rome"),
//        EuropeState(name: "Kazakhstan", capital: "Astana"),
        EuropeState(name: "Kosovo", capital: "Pristina"),
        EuropeState(name: "Latvia", capital: "Riga"),
        EuropeState(name: "Liechtenstein", capital: "Vaduz"),
        EuropeState(name: "Lithuania", capital: "Vilnius"),
        EuropeState(name: "Luxembourg", capital: "Luxembourg"),
        EuropeState(name: "Macedonia", capital: "Skopje"),
        EuropeState(name: "Malta", capital: "Valletta"),
        EuropeState(name: "Moldova", capital: "Chişinău"),
        EuropeState(name: "Monaco", capital: "Monaco"),
        EuropeState(name: "Montenegro", capital: "Podgorica"),
        EuropeState(name: "Netherlands", capital: "Amsterdam"),
        EuropeState(name: "Norway", capital: "Oslo"),
        EuropeState(name: "Poland", capital: "Warsaw"),
        EuropeState(name: "Portugal", capital: "Lisbon"),
        EuropeState(name: "Romania", capital: "Bucharest"),
        EuropeState(name: "Russia Europe", capital: "Moscow"),
        EuropeState(name: "San Marino", capital: "San Marino"),
        EuropeState(name: "Serbia", capital: "Belgrade"),
        EuropeState(name: "Slovakia", capital: "Bratislava"),
        EuropeState(name: "Slovenia", capital: "Ljubljana"),
        EuropeState(name: "Spain", capital: "Madrid"),
        EuropeState(name: "Sweden", capital: "Stockholm"),
        EuropeState(name: "Switzerland", capital: " Bern"),
        EuropeState(name: "Turkey Europe", capital: "Ankara"),
        EuropeState(name: "Ukraine", capital: "Kiev"),
        EuropeState(name: "United Kingdom", capital: " London"),
        EuropeState(name: "Vatican City", capital: "Vatican City")
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
        return euroState.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else{
            fatalError("there is no section number\(indexPath.section).")
        }
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "EuropeCell", for: indexPath)
        
        // Configure the cell...
        let europe: EuropeState = euroState[indexPath.row];
        cell.textLabel?.text = "The capital of \(europe.name) is \(europe.capital).";
        cell.detailTextLabel?.text = " \(euroState[indexPath.row])";
        cell.imageView?.image = UIImage(named: euroState[indexPath.row].name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let euro = euroState[indexPath.row ]
        print("\(euro) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            euroState.remove(at: indexPath.row)
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
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
