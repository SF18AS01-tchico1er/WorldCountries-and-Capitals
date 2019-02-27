//
//  America.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
//

import UIKit

class AmericaTableViewController: UITableViewController {
    
    var state: [State] = [
        State(state: "Alabama",capital: "Montgomery"),
        State(state: "Alaska", capital: "Juneau"),
        State(state: "Arizona", capital: "Phoenix"),
        State(state: "Arkansas", capital: "Little Rock"),
        State(state: "California", capital: "Sacramento"),
        State(state: "Colorado", capital: "Denver"),
        State(state: "Delaware", capital: "Dover"),
        State(state: "Florida", capital: "Tallahassee"),
        State(state: "Georgia", capital: "Atlanta"),
        State(state: "Hawaii", capital: "Honolulu"),
        State(state: "Idaho", capital: "Boise"),
        State(state: "Illinois", capital: "Springfield"),
        State(state: "Indiana", capital: "Indianapolis"),
        State(state: "Iowa", capital: "Des Moines"),
        State(state: "Kansas", capital: "Topeka"),
        State(state: "Kentucky", capital: "Frankfort"),
        State(state: "Louisiana", capital: "Baton Rouge"),
        State(state: "Maine", capital: "Augusta"),
        State(state: "Maryland", capital: "Annapolis"),
        State(state: "Massachusetts", capital: "Boston"),
        State(state: "Michigan", capital: "Lansing"),
        State(state: "Minnesota", capital: "St. Paul"),
        State(state: "Mississippi", capital: "Jackson"),
        State(state: "Montana", capital: "Helena"),
        State(state: "Nebraska", capital: "Lincoln"),
        State(state: "Nevada", capital: "Carson City"),
        State(state: "New Hampshire", capital: "Concord"),
        State(state: "New Jersey", capital: "Trenton"),
        State(state: "New Mexico", capital: "Santa Fe"),
        State(state: "New York", capital: "Albany"),
        State(state: "North Carolina", capital: "Raleigh"),
        State(state: "North Dakota", capital: "Bismarck"),
        State(state: "Ohio", capital: "Columbus"),
        State(state: "Oklahoma", capital: "Oklahoma City"),
        State(state: "Oregon", capital: "Salem"),
        State(state: "Pennsylvania", capital: "Harrisburg"),
        State(state: "Rhode Island", capital: "Providence"),
        State(state: "South Carolina", capital: "Columbia"),
        State(state: "South Dakota", capital: "Pierre"),
        State(state: "Tennessee", capital: "Nashville"),
        State(state: "Texas", capital: "Austin"),
        State(state: "Utah", capital: "Salt Lake City"),
        State(state: "Vermont", capital: "Montpelier"),
        State(state: "Virginia", capital: "Richmond"),
        State(state: "Washington", capital: "Olympia"),
        State(state: "West Virginia", capital: "Charleston"),
        State(state: "Wisconsin", capital: "Madison"),
        State(state: "Wyoming", capital: "Cheyenne"),
        State(state: "Falkland Islands  ",capital: "Stanley")
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
        cell.textLabel?.text = " \(state[indexPath.row])";
        cell.detailTextLabel?.text = "Welcome to the USA \([indexPath.row + 1]) state in alphabetic"
        //"\(state[indexPath.row]) is \([indexPath.row + 1])";
        cell.imageView?.image = UIImage(named: state[indexPath.row].state)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let usa = state[indexPath.row ]
        print("\(usa) \(indexPath)")
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



