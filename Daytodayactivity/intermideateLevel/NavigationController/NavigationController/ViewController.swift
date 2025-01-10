//
//  ViewController.swift
//  NavigationController
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pushButton1: UIButton!
    @IBOutlet var presentButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.navigationController?.isNavigationBarHidden=true
        print("First View DidLoad")
    }
    
    @IBAction func pushButton1Display(){
        
    }

    @IBAction func presentButton1Display(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First View will appear")
    }
    
    override func viewWillLayoutSubviews() {
        print("First View WillLayout Subviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First View Did Appear")
    }
    
    override func didReceiveMemoryWarning() {
        print("First View Did Receive Memory Warning")
    }
}

