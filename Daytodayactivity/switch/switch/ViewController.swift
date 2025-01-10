//
//  ViewController.swift
//  switch
//
//  Created by FCI on 21/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sw1:UISwitch!
    var ssw2:UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ssw2=UISwitch()
        ssw2.frame=CGRect(x: 22, y: 100, width: 100, height: 50)
        
        ssw2.isOn=false
        ssw2.onTintColor = .green
        ssw2.thumbTintColor = .orange
        
        ssw2.addTarget(self, action: #selector(switchClick2), for: .valueChanged)
        
        self.view.addSubview(ssw2)
    }
    @IBAction func switchClick1(){
        if sw1.isOn{
            self.view.backgroundColor = .orange
            print("switch is in on state")
            
        }
        else{
            self.view.backgroundColor = .white
            print("switch is in off state")
        }
    }
    @objc func switchClick2(){
        if ssw2.isOn{
            self.view.backgroundColor = .purple
            print("switch is in on state")
        }
        else{
            self.view.backgroundColor = .gray
            print("switch is in off state")
        }
    }

}

