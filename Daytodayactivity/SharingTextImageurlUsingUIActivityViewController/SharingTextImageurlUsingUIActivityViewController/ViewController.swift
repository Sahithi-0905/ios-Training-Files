//
//  ViewController.swift
//  SharingTextImageurlUsingUIActivityViewController
//
//  Created by FCI on 29/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareClick(){
        
        let text = ooo
        let image = UIImage(named: "Ball.png")
        let myWebsite = URL(string: "htts://www.apple.com")
        
        let shareAll = [text,image!, myWebsite] as [any]!
    }
   
    

}

