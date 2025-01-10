//
//  ViewController.swift
//  TableViewWithNavigation
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView1: UITableView!
    
    var section1Names: [String] = []
    var section1Images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "TableView With Navigation"
        section1Names = ["Hyderabad","Kerala","Delhi"]
        section1Images = ["hyd.jpeg","kerala.jpeg","lotus.jpeg"]
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
    }
    
    //1.number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //2.number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section1Names.count
        
    }
    
    //3.create and display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
        cell1.textLabel?.text = section1Names[indexPath.row]
        cell1.imageView?.image = UIImage(named: section1Images[indexPath.row])
        cell1.backgroundColor = .clear
        //cell1.accessoryType = .detailDisclosureButton
            
        return cell1
        
    }
    
    
    
    //9. row click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard1 = UIStoryboard(name: "Main", bundle: nil)
        
        let nextScreen = Storyboard1.instantiateViewController(withIdentifier: "storyid1") as! SecondViewController
        
        nextScreen.string1 = section1Names[indexPath.row]
        nextScreen.image1 = UIImage(named: section1Images[indexPath.row])!
        
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
    


}

