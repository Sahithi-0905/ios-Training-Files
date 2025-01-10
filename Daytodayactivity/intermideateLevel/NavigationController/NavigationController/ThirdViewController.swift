//
//  ThirdViewController.swift
//  NavigationController
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var popButton2: UIButton!
    @IBOutlet var popToRootButton2: UIButton!
    @IBOutlet var home: UIBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func popButton2Display(){
        
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func popToRootButton2Display(){
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func homeclick2(){
        self.navigationController?.popToRootViewController(animated: true)
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
