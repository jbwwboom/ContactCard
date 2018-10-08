//
//  UserTableViewController.swift
//  ContactCard
//
//  Created by Jop on 08/10/2018.
//  Copyright © 2018 Justin van den Boomen. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class UserTableViewController: UITableViewController, UserManagerDelegate {
    
    var userManager = UserManager()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userManager.delegate = self
        
        userManager.getUsers()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func didReceiveNewUser(user: User) {
        self.users.append(user)
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userIdentifier", for: indexPath) as! UserTableViewCell

        // Configure the cell...
        let user = users[indexPath.row]
        cell.usernameLabel?.text = user.username
        
        let url = user.imageUrl
        
        Alamofire.request(url!).responseImage{
            response in
            cell.avatarImageView?.image = response.result.value
        }
        
        return cell
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

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? DetailedViewController{
            let index = self.tableView.indexPathForSelectedRow?.row
            
            let user = users[index!]
            destination.user = user
        }
    }
 

}
