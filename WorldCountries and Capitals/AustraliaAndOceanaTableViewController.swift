//
//  AustraliaAndOceanaTableViewController.swift
//  WorldCountries and Capitals
//
//  Created by Tiego Ouedraogo on 2/22/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
//

import UIKit

class AustraliaAndOceanaTableViewController: UITableViewController {
    
        var states: [AustraliaAndOceana] = [
            AustraliaAndOceana(country: "Australia", capital: "Canberra"),
            AustraliaAndOceana(country: "American Samoa ", capital:  "Fagatogo, Utulei"),
            AustraliaAndOceana(country: "Christmas Island (Australia)", capital: "Flying Fish Cove"),
            AustraliaAndOceana(country: "Cocos (Keeling) Islands", capital: "West Island"),
            AustraliaAndOceana(country: "Cook Islands", capital: "Avarua"),
            
            AustraliaAndOceana(country: "Fiji", capital: "Suva"),
            AustraliaAndOceana(country: "French Polynesia", capital: "Papeete"),
            AustraliaAndOceana(country: "Guam ", capital: "Agana"),
            AustraliaAndOceana(country: "Kiribati ", capital: "Bairiki"),
            AustraliaAndOceana(country: "Marshall Islands", capital: "Majuro"),
            
            AustraliaAndOceana(country: "Nauru", capital: "Yaren"),
            AustraliaAndOceana(country: "New Caledonia", capital: "Noumea"),
            AustraliaAndOceana(country: "New Zealand" , capital: "Wellington"),
            AustraliaAndOceana(country: "Niue ", capital: "Alofi"),
            AustraliaAndOceana(country: "Norfolk Island", capital: "Kingston"),
            
            AustraliaAndOceana(country: "Northern Mariana Islands", capital: "Saipan"),
            AustraliaAndOceana(country: "EPapua New Guinea ", capital: "Port Moresby"),
            AustraliaAndOceana(country: "Palau ", capital: "Koror"),
            AustraliaAndOceana(country: "Pitcairn Island" , capital: "Adamstown"),
            AustraliaAndOceana(country: "Samoa", capital: "Apia"),
            
            AustraliaAndOceana(country: "Solomon Islands", capital: "Honiara"),
            AustraliaAndOceana(country: "Tonga", capital: "Nuku'alofa"),
            AustraliaAndOceana(country: "Tuvalu", capital: "Funafuti"),
            AustraliaAndOceana(country: "Tokelau ", capital: "Nukunonu, Atafu,Tokelau"),
            AustraliaAndOceana(country: "Vanuatu", capital: "Port-Vila"),
            
            
            AustraliaAndOceana(country: "Virgin Islands (British) ",   capital:   "Road Town"),
            AustraliaAndOceana(country: "Virgin Islands (US)", capital: "Charlotte Amalie"),
            AustraliaAndOceana(country: "Wallis and Futuna", capital: "Mata-Utu"),
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
            return states.count
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard indexPath.section == 0 else{
                fatalError("there is no section number\(indexPath.section).")
            }
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "AustraliaCell", for: indexPath)
            
            // Configure the cell...
            cell.textLabel?.text = " \(states[indexPath.row])";
            cell.detailTextLabel?.text = "Welcome to the Autralia \([indexPath.row + 1]) country in alphabetic"
            cell.imageView?.image = UIImage(named: states[indexPath.row].country)
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let australia = states[indexPath.row ]
            print("\(australia) \(indexPath)")
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                states.remove(at: indexPath.row)
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
