//
//  ViewController.swift
//  textviewapp
//
//  Created by FCI on 22/11/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var tf1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayDataInTextVieww()
    }
    
    func displayDataInTextVieww(){
        
        do{
            let path = Bundle.main.path(forResource: "hyd", ofType: "txt")
            
            let str = try String(contentsOfFile: path!)
            tf1.text = str
        }
        catch{
            print(error.localizedDescription)
        }
        
    }

}

