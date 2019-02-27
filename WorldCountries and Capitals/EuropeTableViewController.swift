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
    
        EuropeState(country: "Albania", capital: "Tirana"),
        EuropeState(country: "Andorra", capital: "Andorra la Vella"),
        EuropeState(country: "Armenia", capital: "Yerevan"),
        EuropeState(country: "Austria", capital: "L Vienna"),
        EuropeState(country: "Azerbaijan", capital: "Baku"),
        EuropeState(country: "Belarus", capital: "Minsk"),
        EuropeState(country: "Belgium", capital: "Brussels"),
        EuropeState(country: "Bosnia and Herzegovina", capital: "Sarajevo"),
        EuropeState(country: "Bulgaria", capital: "Sofia"),
        EuropeState(country: "Croatia", capital: "Zagreb"),
        EuropeState(country: "Cyprus", capital: "Nicosia"),
        EuropeState(country: "Czech Republic", capital: "Prague"),
        EuropeState(country: "Denmark", capital: "Copenhagen"),
        EuropeState(country: "Estonia", capital: "Tallinn"),
        EuropeState(country: "Finland", capital: "Helsinki"),
        EuropeState(country: "France", capital: "Paris"),
        EuropeState(country: "Germany", capital: "Berlin"),
        EuropeState(country: "Greece", capital: "Athens"),
        EuropeState(country: "Georgia", capital: "Tbilisi"),
        EuropeState(country: "Hungary", capital: "Budapest"),
        EuropeState(country: "Iceland", capital: "Reykjavik"),
        EuropeState(country: "Ireland", capital: "Dublin"),
        EuropeState(country: "Italy", capital: "Rome"),
        EuropeState(country: "Kazakhstan", capital: "Astana"),
        EuropeState(country: "Kosovo", capital: "Pristina"),
        EuropeState(country: "Latvia", capital: "Riga"),
        EuropeState(country: "Liechtenstein", capital: "Vaduz"),
        EuropeState(country: "Lithuania", capital: "Vilnius"),
        EuropeState(country: "Luxembourg", capital: "Luxembourg"),
        EuropeState(country: "Macedonia", capital: "Skopje"),
        EuropeState(country: "Malta", capital: "Valletta"),
        EuropeState(country: "Moldova", capital: "Chişinău"),
        EuropeState(country: "Monaco", capital: "Monaco"),
        EuropeState(country: "Montenegro", capital: "Podgorica"),
        EuropeState(country: "Netherlands", capital: "Amsterdam"),
        EuropeState(country: "Norway", capital: "Oslo"),
        EuropeState(country: "Poland", capital: "Warsaw"),
        EuropeState(country: "Portugal", capital: "Lisbon"),
        EuropeState(country: "Romania", capital: "Bucharest"),
        EuropeState(country: "Russia", capital: "Moscow"),
        EuropeState(country: "San Marino", capital: "San Marino"),
        EuropeState(country: "Serbia", capital: "Belgrade"),
        EuropeState(country: "Slovakia", capital: "Bratislava"),
        EuropeState(country: "Slovenia", capital: "Ljubljana"),
        EuropeState(country: "Spain", capital: "Madrid"),
        EuropeState(country: "Sweden", capital: "Stockholm"),
        EuropeState(country: "Switzerland", capital: " Bern"),
        EuropeState(country: "Turkey", capital: "Ankara"),
        EuropeState(country: "Ukraine", capital: "Kiev"),
        EuropeState(country: "United Kingdom", capital: " London"),
        EuropeState(country: "Vatican City", capital: "Vatican City")
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
        cell.textLabel?.text = " \(euroState[indexPath.row])";
        cell.detailTextLabel?.text = "Welcome to the Europe \([indexPath.row + 1]) country in alphabetic"
        cell.imageView?.image = UIImage(named: euroState[indexPath.row].country)
        
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
