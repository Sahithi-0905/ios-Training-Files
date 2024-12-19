//
//  ViewController.swift
//  SahithiTask1
//
//  Created by FCI on 22/11/24.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var name: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var saveDetails: UIButton!
    @IBOutlet var submit: UIButton!
    @IBOutlet var register: UILabel!
    @IBOutlet var label1: UILabel!
    
    var defaults1: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        name.delegate = self
        password.delegate = self
        email.delegate = self
        phoneNumber.delegate = self
        city.delegate = self
        
        defaults1 = UserDefaults.standard
        name.text = defaults1.string(forKey: "username")
        password.text = defaults1.string(forKey: "userpassword")
        email.text=defaults1.string(forKey: "useremail")
        phoneNumber.text=defaults1.string(forKey: "userphoneNumber")
        city.text=defaults1.string(forKey: "usercity")
    }
    
    //hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        name.resignFirstResponder()
        password.resignFirstResponder()
        email.resignFirstResponder()
        phoneNumber.resignFirstResponder()
        city.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //save details
    @IBAction func displaySaveDetails(){
        
        defaults1 = UserDefaults.standard
        defaults1.set(name.text, forKey: "username")
        defaults1.set(password.text, forKey: "userpassword")
        defaults1.set(email.text, forKey: "useremail")
        defaults1.set(phoneNumber.text, forKey: "userphoneNumber")
        defaults1.set(city.text, forKey: "usercity")
        defaults1.synchronize()
    }
    @IBAction func displaySubmit(){
        
        
        label1.text=String(describing:name.text!+" ") +
        String(describing:password.text!+" ") +
        String(describing:email.text!+" ") +
        String(describing:phoneNumber.text!+" ") +
        String(describing:city.text!+" ")
        
        
        
    }
                     

}

