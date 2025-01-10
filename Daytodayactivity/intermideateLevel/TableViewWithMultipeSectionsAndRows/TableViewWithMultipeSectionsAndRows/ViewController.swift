//
//  ViewController.swift
//  TableViewWithMultipeSectionsAndRows
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var iv1: UIImageView!
    @IBOutlet var label: UILabel!
    
    
    var section1Names: [String] = []
    var section1Images: [String] = []
    
    var section2Names: [String] = []
    var section2Images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        section1Names = ["iMac","MacBook Pro","MacBook Air"]
        section1Images = ["app.jpeg","hyd.jpeg","kerala.jpeg"]
        
        section2Names = ["iPhone","iPad","iPod Touch"]
        section2Images = ["hyd.jpeg","kerala.jpeg","app.jpeg"]
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    //1.number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //2.number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return section1Names.count
        }
        
        else{
            return section2Names.count
        }
    }
    
    //3.create and display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0{
            
            return "Mac End"
        }
        else{
            return "ios End"
        }
    }
    
    //section Header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            
            return "Mac"
        }
        else{
            return "Ios"
        }
    }
    
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0{
            label.text = section1Names[indexPath.row]
            iv1.image = UIImage(named: section1Images[indexPath.row])
            
        }
        else{
            label.text = section2Names[indexPath.row]
            iv1.image = UIImage(named: section2Images[indexPath.row])
            
        }
    }
    
    //10.when user select any accessory button
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section==0{
            label.text = section1Names[indexPath.row]
            iv1.image = UIImage(named: section1Images[indexPath.row])
            
        }
        else{
            label.text = section2Names[indexPath.row]
            iv1.image = UIImage(named: section2Images[indexPath.row])
            
        }
    }
    
    //11. section index titles
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let indexTitels = ["Mac","ios"]
        
        return indexTitels
    }
    //animation for tabel view
    override func viewWillAppear(_ animated: Bool) { //view controller life cycle method
            self.animateTable()
        }
        
        func animateTable() {
       tableView.reloadData()
          let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
       for i in cells {
         let cell: UITableViewCell = i as UITableViewCell
          cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      }
       var index = 0
       for a in cells {
        let cell: UITableViewCell = a as UITableViewCell
           UIView.animate(withDuration: 1.5, delay: 0.09 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent,
       animations: {
         cell.transform = CGAffineTransform(translationX: 0, y: 0);
       }, completion: nil)
       
       index += 1 }
      }
}

