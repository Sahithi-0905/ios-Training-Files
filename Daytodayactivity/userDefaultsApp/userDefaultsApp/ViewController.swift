//
//  ViewController.swift
//  userDefaultsApp
//
//  Created by FCI on 22/11/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var save: UIButton!
    
    var defaults1: UserDefaults!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        defaults1 = UserDefaults.standard
        userName.text = defaults1.string(forKey: "username")
        password.text = defaults1.string(forKey: "userpassword")
        /*print("\(String(desscribing:userName.txt!)) \(String(desscribing:password.txt!))")*/
        
    }
    
    @IBAction func saveButtonClick(){
        
        defaults1 = UserDefaults.standard
        defaults1.set(userName.text, forKey: "username")
        defaults1.set(password.text, forKey: "userpassword")
        defaults1.synchronize()
        
        
    }

}

