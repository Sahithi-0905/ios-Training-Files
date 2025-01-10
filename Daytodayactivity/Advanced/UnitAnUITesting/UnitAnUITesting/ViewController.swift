//
//  ViewController.swift
//  UnitAnUITesting
//
//  Created by FCI on 04/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func isStringLong(mysting:String)->Bool{
        return mysting.count > 5
    }
    
    func isAddingTwoNumbers()-> Int{
        let x=5
        let y=9
        
        let z = x+y
        
        return z
    }
    
    func ComparingTwoStrings() -> Bool{
        
        let passwod = "HelloWorld"
        let repeatPassword = "HelloWorld"
        
        if ((passwod.elementsEqual(repeatPassword))==true){
            return true
        }
        else{
            return false
        }
    }


}

