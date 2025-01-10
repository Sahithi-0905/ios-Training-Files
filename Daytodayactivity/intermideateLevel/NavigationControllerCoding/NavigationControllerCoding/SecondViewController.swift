//
//  SecondViewController.swift
//  NavigationControllerCoding
//
//  Created by FCI on 26/11/24.
//

import UIKit

class SecondViewController: UIViewController {

    var b3: UIButton!
    var b4: UIButton!
    var homebutton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
        self.title = "First"
        
        b3 = UIButton()
        b3.frame=CGRect(x: 40, y: 240, width: 150, height: 30)
        b3.backgroundColor = .darkGray
        b3.setTitle("POP", for: .normal)
        b3.addTarget(self, action: #selector(button3Click), for: .touchUpInside)
        self.view.addSubview(b3)
        
        b4 = UIButton()
        b4.frame=CGRect(x: 40, y: 300, width: 150, height: 30)
        b4.backgroundColor = .darkGray
        b4.setTitle("DISMISS", for: .normal)
        b4.addTarget(self, action: #selector(button4Click), for: .touchUpInside)
        self.view.addSubview(b4)
        
        homebutton = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButtonClick))
        
        self.navigationItem.rightBarButtonItem = homebutton
        
    }
    
    @objc func button3Click(){
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func button4Click(){
        self.dismiss(animated: true,completion: nil)
        
    }
    
    @objc func homeButtonClick(){
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

    
    

}
