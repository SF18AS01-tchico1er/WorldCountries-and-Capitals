//
//  AsiaTableViewController.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/20/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
//

import UIKit

class AsiaTableViewController: UITableViewController {
    
    
    var state: [Asian] = [
        Asian(name: "Afghanistan", capital: "Kabul"),
        Asian(name: "Armenia", capital: "Yerevan"),
        Asian(name: "Azerbaijan", capital: "Baku"),
        Asian(name: "Bahrain", capital: "Manama"),
        Asian(name: "Bangladesh", capital: "Dhaka"),
        Asian(name: "Bhutan", capital: "Thimphu"),
        Asian(name: "Brunei", capital: "Bandar Seri Begawan"),
        Asian(name: "Cambodia", capital: "Phnom Penh"),
        Asian(name: "China", capital: "Beijing"),
        Asian(name: "Cyprus", capital: "Nicosia"),
        Asian(name: "Georgia", capital: "Tbilisi"),
        Asian(name: "India", capital: "New Delhi"),
        Asian(name: "Indonesia", capital: "Jakarta"),
        Asian(name: "Iran", capital: "Tehran"),
        Asian(name: "Iraq", capital: "Baghdad"),
        Asian(name: "Israel", capital: "Jerusalem"),
        Asian(name: "Japan", capital: "Tokyo"),
        Asian(name: "Jordan", capital: "Amman"),
        Asian(name: "Kazakhstan", capital: "Astana"),
        Asian(name: "Kuwait", capital: "Kuwait City"),
        Asian(name: "Kyrgyzstan", capital: "Bishkek"),
        Asian(name: "Laos", capital: "Vientiane"),
        Asian(name: "Lebanon", capital: "Beirut"),
        Asian(name: "Malaysia", capital: "Kuala Lumpur"),
        Asian(name: "Maldives", capital: "Male"),
        Asian(name: "Mongolia", capital: "Ulaanbaatar"),
        Asian(name: "Myanmar", capital: "Naypyidaw"),
        Asian(name: "Nepal", capital: "Kathmandu"),
        Asian(name: "North Korea", capital: "Pyongyang"),
        Asian(name: "Oman", capital: "Muscat"),
        Asian(name: "Pakistan", capital: "Islamabad"),
        Asian(name: "Palestine", capital: "Jerusalem"),
        Asian(name: "Philippines", capital: "Manila"),
        Asian(name: "Qatar", capital: "Doha"),
        Asian(name: "Russia", capital: "Moscow"),
        Asian(name: "Saudi Arabia", capital: "Riyadh"),
        Asian(name: "Singapore", capital: "Singapore"),
        Asian(name: "South Korea", capital: "Seoul"),
        Asian(name: "Sri Lanka", capital: "Sri Jayawardenepura Kotte"),
        Asian(name: "Syria", capital: "Damascus"),
        Asian(name: "Taiwan", capital: "Taipei"),
        Asian(name: "Tajikistan", capital: "Dushanbe"),
        Asian(name: "Thailand", capital: "Bangkok"),
        Asian(name: "Timor-Leste", capital: "Dili"),
        Asian(name: "Turkey", capital: "Ankara"),
        Asian(name: "Turkmenistan", capital: "Ashgabat"),
        Asian(name: "United Arab Emirates", capital: "Abu Dhabi"),
        Asian(name: "Uzbekistan", capital: "Tashkent"),
        Asian(name: "Vietnam", capital: "Hanoi"),
        Asian(name: "Yemen", capital: "Sana'a"),
        ]

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
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "AsianCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = " \(state[indexPath.row ])";
        cell.detailTextLabel?.text = "Welcome to the Asian \([indexPath.row + 1]) country in alphabetic"
        //" \(state[indexPath.row]) is \([indexPath.row + 1])";
        cell.imageView?.image = UIImage(named: state[indexPath.row].name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let china = state[indexPath.row ]
        print("\(china) \(indexPath)")
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
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
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
