//
//  ViewController.swift
//  Task1ImgViewPageContrroll
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    @IBOutlet var pc: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func displlayImagess(){
        
        let index:Int = pc.currentPage
        
        if index == 0{
            img.image = UIImage(named: "Hyde")
            self.view.backgroundColor = .cyan
        }
        
        else if index == 1{
            img.image = UIImage(named: "lotus")
            self.view.backgroundColor = .orange
        }
        else if index == 2{
            img.image = UIImage(named: "taj")
            self.view.backgroundColor = .black
        }
        else if index == 3{
            img.image = UIImage(named: "mysore")
            self.view.backgroundColor = .cyan
        }
        else{
            img.image = UIImage(named: "kerala")
            self.view.backgroundColor = .purple
        }
    }

}

