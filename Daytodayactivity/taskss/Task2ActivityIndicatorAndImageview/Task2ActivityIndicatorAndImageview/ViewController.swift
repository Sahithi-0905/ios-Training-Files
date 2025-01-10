//
//  ViewController.swift
//  Task2ActivityIndicatorAndImageview
//
//  Created by FCI on 24/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var load1: UIActivityIndicatorView!
    @IBOutlet var timer1: Timer!
    @IBOutlet var img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        img.isHidden = true
        load1.startAnimating()
        timer1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopTimer1), userInfo: nil, repeats: false)
            
    }
    @objc func stopTimer1(){
        
        load1.stopAnimating()
        load1.hidesWhenStopped = true
        self.img.isHidden = false
        self.img.image = UIImage(named: "Image")
        self.view.backgroundColor = .yellow
    }

}

