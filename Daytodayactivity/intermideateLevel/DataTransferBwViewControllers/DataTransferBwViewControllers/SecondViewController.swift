//
//  SecondViewController.swift
//  DataTransferBwViewControllers
//
//  Created by FCI on 26/11/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var img: UIImageView!
    
    
    var name: String!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label1.text = name
        img.image = UIImage(named: imageName)
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
