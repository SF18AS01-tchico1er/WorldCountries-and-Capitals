//
//  America.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
//

import UIKit

class AmericaTableViewController: UITableViewController {
    
    var state: [USA] = [
        USA(name: "Alabama",capital: "Montgomery"),
        USA(name: "Alaska", capital: "Juneau"),
        USA(name: "Arizona", capital: "Phoenix"),
        USA(name: "Arkansas", capital: "Little Rock"),
        USA(name: "California", capital: "Sacramento"),
        USA(name: "Colorado", capital: "Denver"),
        USA(name: "Delaware", capital: "Dover"),
        USA(name: "Florida", capital: "Tallahassee"),
        USA(name: "Georgia", capital: "Atlanta"),
        USA(name: "Hawaii", capital: "Honolulu"),
        USA(name: "Idaho", capital: "Boise"),
        USA(name: "Illinois", capital: "Springfield"),
        USA(name: "Indiana", capital: "Indianapolis"),
        USA(name: "Iowa", capital: "Des Moines"),
        USA(name: "Kansas", capital: "Topeka"),
        USA(name: "Kentucky", capital: "Frankfort"),
        USA(name: "Louisiana", capital: "Baton Rouge"),
        USA(name: "Maine", capital: "Augusta"),
        USA(name: "Maryland", capital: "Annapolis"),
        USA(name: "Massachusetts", capital: "Boston"),
        USA(name: "Michigan", capital: "Lansing"),
        USA(name: "Minnesota", capital: "St. Paul"),
        USA(name: "Mississippi", capital: "Jackson"),
        USA(name: "Montana", capital: "Helena"),
        USA(name: "Nebraska", capital: "Lincoln"),
        USA(name: "Nevada", capital: "Carson City"),
        USA(name: "New Hampshire", capital: "Concord"),
        USA(name: "New Jersey", capital: "Trenton"),
        USA(name: "New Mexico", capital: "Santa Fe"),
        USA(name: "New York", capital: "Albany"),
        USA(name: "North Carolina", capital: "Raleigh"),
        USA(name: "North Dakota", capital: "Bismarck"),
        USA(name: "Ohio", capital: "Columbus"),
        USA(name: "Oklahoma", capital: "Oklahoma City"),
        USA(name: "Oregon", capital: "Salem"),
        USA(name: "Pennsylvania", capital: "Harrisburg"),
        USA(name: "Rhode Island", capital: "Providence"),
        USA(name: "South Carolina", capital: "Columbia"),
        USA(name: "South Dakota", capital: "Pierre"),
        USA(name: "Tennessee", capital: "Nashville"),
        USA(name: "Texas", capital: "Austin"),
        USA(name: "Utah", capital: "Salt Lake City"),
        USA(name: "Vermont", capital: "Montpelier"),
        USA(name: "Virginia", capital: "Richmond"),
        USA(name: "Washington", capital: "Olympia"),
        USA(name: "West Virginia", capital: "Charleston"),
        USA(name: "Wisconsin", capital: "Madison"),
        USA(name: "Wyoming", capital: "Cheyenne"),
        USA(name: "Falkland Islands  ",capital: "Stanley")
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.rightBarButtonItem = editButtonItem
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
        return state.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else{
            fatalError("there is no section number\(indexPath.section).")
        }
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UsaCell", for: indexPath)
        
        // Configure the cell...
        let american: USA = state[indexPath.row];
        cell.textLabel?.text = "The capital of \(american.name) is \(american.capital).";
        cell.detailTextLabel?.text = " \(state[indexPath.row])";
        cell.imageView?.image = UIImage(named: state[indexPath.row].name)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let usa = state[indexPath.row ]
        //print("\(usa) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            state.remove(at: indexPath.row)
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
    // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
  // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
    
}



