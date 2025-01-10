//
//  FirstTableViewController.swift
//  TableViewController
//
//  Created by FCI on 27/11/24.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var section1Names: [String] = []
    var section1Images: [String] = []
    
    var section2Names: [String] = []
    var section2Images: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        section1Names = ["iMac","MacBook Pro","MacBook Air"]
        section1Images = ["app.jpeg","hyd.jpeg","kerala.jpeg"]
        
        section2Names = ["iPhone","iPad","iPod Touch"]
        section2Images = ["hyd.jpeg","kerala.jpeg","app.jpeg"]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return section1Names.count
        }
        
        else{
            return section2Names.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if indexPath.section == 0{
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = section1Names[indexPath.row]
            cell1.imageView?.image = UIImage(named: section1Images[indexPath.row])
            cell1.backgroundColor = .clear
            cell1.accessoryType = .detailDisclosureButton
            
            return cell1
        }

        else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell2.textLabel?.text = section2Names[indexPath.row]
            cell2.imageView?.image = UIImage(named: section2Images[indexPath.row])
            cell2.backgroundColor = .clear
            cell2.accessoryType = .detailDisclosureButton
            return cell2
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0{
            
            return "Mac End"
        }
        else{
            return "ios End"
        }
    }
    
    //section Header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            
            return "Mac"
        }
        else{
            return "Ios"
        }
    }
    
    //header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            if indexPath.row == 1{
                return 150
            }
            
            return 80
        }
        else{
            return 80
        }
    }
    
    //9. row click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0{
            //label.text = section1Names[indexPath.row]
            //iv1.image = UIImage(named: section1Images[indexPath.row])
            
        }
        else{
            //label.text = section2Names[indexPath.row]
            //iv1.image = UIImage(named: section2Images[indexPath.row])
            
        }
    }
    
    //10.when user select any accessory button
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section==0{
            //label.text = section1Names[indexPath.row]
            //iv1.image = UIImage(named: section1Images[indexPath.row])
            
        }
        else{
            //label.text = section2Names[indexPath.row]
            //iv1.image = UIImage(named: section2Images[indexPath.row])
            
        }
    }
    
    //11. section index titles
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let indexTitels = ["Mac","ios"]
        
        return indexTitels
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        return true
    }*/
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
