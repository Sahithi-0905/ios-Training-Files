//
//  ViewController.swift
//  NavigationControllerCoding
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {

    var b1: UIButton!
    var b2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .brown
        self.title = "First"
        
        b1 = UIButton()
        b1.frame=CGRect(x: 40, y: 240, width: 150, height: 30)
        b1.backgroundColor = .darkGray
        b1.setTitle("PUSH", for: .normal)
        b1.addTarget(self, action: #selector(button1Click), for: .touchUpInside)
        self.view.addSubview(b1)
        
        b2 = UIButton()
        b2.frame=CGRect(x: 40, y: 300, width: 150, height: 30)
        b2.backgroundColor = .darkGray
        b2.setTitle("PRESENT", for: .normal)
        b2.addTarget(self, action: #selector(button2Click), for: .touchUpInside)
        self.view.addSubview(b2)
        
    }
    
    @objc func button1Click(){
        
        let next = SecondViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    
    @objc func button2Click(){
        let next2 = SecondViewController()
        self.present(next2, animated: true)
        
        
    }

}

