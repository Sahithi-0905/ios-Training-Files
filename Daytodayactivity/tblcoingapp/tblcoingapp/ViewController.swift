//
//  ViewController.swift
//  tblcoingapp
//
//  Created by FCI on 21/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var tf1: UITextField!
    var lable1: UILabel!
    var b1: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayUi()
    }
    func displayUi(){
        
        self.view.backgroundColor = .blue
        
        tf1 = UITextField()
        tf1.frame = CGRect(x: 40, y: 50, width: 280, height: 34)
        tf1.placeholder="Enter any text"
        tf1.textColor = .black
        tf1.backgroundColor = .yellow
        tf1.returnKeyType = .done
        tf1.keyboardType = .emailAddress
        tf1.keyboardAppearance = .dark
        tf1.textAlignment = .center
        
        self.view.addSubview(tf1)
        
        lable1 = UILabel()
        lable1.frame = CGRect(x: 40, y: 100, width: 280, height: 40)
        lable1.backgroundColor  = .cyan
        lable1.textColor = .black
        lable1.textAlignment = .center
        lable1.numberOfLines = 3
        
        self.view.addSubview(lable1)
        
        b1 = UIButton()
        b1.frame = CGRect(x: 40, y: 150, width: 280, height: 40)
        b1.backgroundColor = .darkGray
        b1.setTitle("click", for: .normal)
        b1.setTitleColor(.black, for: .normal)
        b1.addTarget(self, action: #selector(click1), for: .touchUpInside)
        self.view.addSubview(b1)
        
    }
    
    @objc func click1(){
        
        lable1.text = tf1.text
    }


}

