//
//  ViewController.swift
//  DataTransferBwViewControllers
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tf1: UITextField!
    @IBOutlet var b1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func b1click(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! SecondViewController
        
        nextScreen.name = tf1.text
        nextScreen.imageName = "app.jpeg"
    }
}

