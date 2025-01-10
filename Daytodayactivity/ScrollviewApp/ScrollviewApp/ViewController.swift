//
//  ViewController.swift
//  ScrollviewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scv: UIScrollView!
    @IBOutlet var lab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scv.contentSize = CGSize(width: 550, height: 600)
        
    }


}

