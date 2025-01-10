//
//  ViewController.swift
//  functions
//
//  Created by FCI on 21/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.'
       // self.click2()
        var team=("boston","red ssox",97,65,59.9)
        print(team)
        
        var team1=(city:"boston",name:"red ssox",wins:97,
                   losses:65,percent:59.9)
        print(team1)
        print(team1.city)
        print(team1.name)
        
    }
    /*
     func click2(){
        print("helllo worrld")
        self.click3(value2: 10, value3: 20)
    }
    func click3(value2:Int ,value3:Int){
        print("\(value2) & \(value3)")
    }
     */
    
}

