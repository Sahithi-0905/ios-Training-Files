//
//  ViewController.swift
//  SahithiAssignment2Coding1
//
//  Created by FCI on 28/11/24.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var websiteName: UITextField!
    @IBOutlet var websiteUrl: UITextField!
    @IBOutlet var clickHere: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func displayClickHere(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! FullWebViewController
        
        nextScreen.web1 = websiteUrl.text
        nextScreen.titles = websiteName.text
    }


}

