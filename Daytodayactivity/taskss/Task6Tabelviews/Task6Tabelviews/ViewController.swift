//
//  ViewController.swift
//  Task6Tabelviews
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var table1 : UITableView!
    @IBOutlet var table2 : UITableView!
    
    var Section1 : [String] = []
    var Section2 : [String] = []
    var Section3 : [String] = []
    var Section4 : [String] = []
    var Section5 : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Section1 = ["OPPO","VIVO", "ONE PLUSE",]
        Section2 = ["REALME","NOKIA", "BLACKBERRY",]
        Section3 = ["15","18","17"]
        Section4 = ["IPHONE","IPAD","IPAD TOUCH"]
        Section5 = ["MACK BOOK AIR","IMAC", "MACBOOK PRO",]
        table1.delegate = self
        table1.dataSource = self
        table2.delegate = self
        table2.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //tableview protocol methods implementation
    //1.number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == table1 {
            return 2
        }
        else
        {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table1 {
            if section == 0 {
                return Section1.count
            }
            else{
                return Section2.count
            }
        }
        else {
            if section == 0 {
                return Section3.count
            }
            else if section == 1 {
                return Section4.count
            }
            else {
                return Section5.count
            }
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == table1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            if indexPath.section == 0 {
                   cell1.textLabel?.text = Section1[indexPath.row]
            } else {
                // Fill with data from array2
                cell1.textLabel?.text = Section2[indexPath.row]
            }
                return cell1
            } else {
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                if indexPath.section == 0 {
                   
                    cell2.textLabel?.text = Section3[indexPath.row]
                } else if indexPath.section == 1 {
                    
                    cell2.textLabel?.text = Section4[indexPath.row]
                } else {
                    cell2.textLabel?.text = Section5[indexPath.row]
                }
                return cell2
            }
        }
        
        //4.section header title
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if tableView == table1 {
                if section == 0 {
                    return "ANDROID"
                } else {
                    return "OLD ANDROID"
                }
            } else {
                if section == 0 {
                    return "VERSIONS"
                } else if section == 1{
                    return "IOS"
                } else {
                    return "MAC"
                }
            }
            
        }
        //5.section footer title
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            if tableView == table1 {
                if section == 0 {
                    return "ANDROID LIST END"
                } else {
                    return "OLD ANDROID LIST END"
                }
            } else {
                if section == 0 {
                    return "VERSIONS END"
                } else if section == 1{
                    return "IOS LIST END"
                } else {
                    return "MAC LIST END"
                }
            }
            
        }


}

