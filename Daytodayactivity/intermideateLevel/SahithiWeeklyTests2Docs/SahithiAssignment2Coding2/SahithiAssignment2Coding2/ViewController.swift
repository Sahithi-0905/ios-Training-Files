//
//  ViewController.swift
//  SahithiAssignment2Coding2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img1: UIImageView!
    @IBOutlet var tf1: UITextView!
    
    var imgg: UIImage!
    var tf: String!
    var titles: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        img1.image = imgg
        tf1.text = tf
        self.navigationItem.title = titles
    }


}

