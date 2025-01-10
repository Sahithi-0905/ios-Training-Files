//
//  SecondViewController.swift
//  NavigationController
//
//  Created by FCI on 26/11/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var popButton1: UIButton!
    @IBOutlet var popToRootButton1: UIButton!
    @IBOutlet var dismisssButton1: UIButton!
    @IBOutlet var pushButton2: UIButton!
    
    @IBOutlet var home: UIBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("Second View DidLoad")
    }
    
    @IBAction func popButton1Display(){
        
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func popToRootButton1Display(){
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func dismissButton1Display(){
        
        self.dismiss(animated: true)
    }

    @IBAction func pushButton1Display(){
        
    }
    
    @IBAction func homeclick(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print("Second View will appear")
    }
    
    override func viewWillLayoutSubviews() {
        print("Second View WillLayout Subviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Second View Did Appear")
    }
    
    override func didReceiveMemoryWarning() {
        print("Second View Did Receive Memory Warning")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
