//
//  ReciepeTableViewController.swift
//  SahithiAssignment2Coding2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ReciepeTableViewController: UITableViewController {

    var section1Names: [String] = []
    var section1Images: [String] = []
    var section1InfoTxt: [String] = []
    
    var section2Names: [String] = []
    var section2Images: [String] = []
    var section2InfoTxt: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        section1Names = ["Chicken Biryani","Fish Fry","chicken 65"]
        section1Images = ["chickenbiryani.jpeg","fishfry.jpeg","chicken65.jpeg"]
        section1InfoTxt = ["chickenbiryani.txt","fishfry.txt","chicken65.txt"]
        
        section2Names = ["Rajma","Shahi Paneer","Daal"]
        section2Images = ["rajma.jpeg","paneercurry.jpeg","daal.jpeg"]
        section2InfoTxt = ["rajma.txt","paneer.txt","daal.txt"]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return section1Names.count
        }else {
            return section2Names.count
        }
    }

    //3.create and display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = section1Names[indexPath.row]
            cell1.backgroundColor = .clear
            cell1.accessoryType = .detailDisclosureButton
            
            return cell1
        }
        else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell2.textLabel?.text = section2Names[indexPath.row]
            cell2.backgroundColor = .clear
            cell2.accessoryType = .detailDisclosureButton
            
            return cell2
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        let nextScreen = storyboard.instantiateViewController(withIdentifier: "storyid") as! ViewController
        if indexPath.section==0{
            
            
            nextScreen.titles = section1Names[indexPath.row]
            nextScreen.imgg = UIImage(named: section1Images[indexPath.row])!
            //nextScreen.tf = section1InfoTxt[indexPath.row]
            
            var file = section1InfoTxt[indexPath.row]
                        
            do{
                
                let path = Bundle.main.path(forResource: file, ofType: nil)
                            
                let str = try String(contentsOfFile: path! ,encoding: .utf8)
                nextScreen.tf = str
            }
            catch{
                    print(error.localizedDescription)
            }
            
                        
        }
        else{
            nextScreen.titles = section2Names[indexPath.row]
            nextScreen.imgg = UIImage(named: section2Images[indexPath.row])!
            //nextScreen.tf = section2InfoTxt[indexPath.row]
            
            var file = section2InfoTxt[indexPath.row]
                        
            do{
                
                let path = Bundle.main.path(forResource: file, ofType: nil)
                            
                let str = try String(contentsOfFile: path! ,encoding: .utf8)
                nextScreen.tf = str
            }
            catch{
                    print(error.localizedDescription)
            }
        }
        
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
