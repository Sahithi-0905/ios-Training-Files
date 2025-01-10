//
//  ViewController.swift
//  ToolBarAndBarButtonItem
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet var barButtonItem1: UIBarButtonItem!
    @IBOutlet var barButtonItem2: UIBarButtonItem!
    @IBOutlet var barButtonItem3: UIBarButtonItem!
    
    var t2: UIToolbar!
    var bb5: UIBarButtonItem!
    var bb6: UIBarButtonItem!
    var bb7: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.displayToolBarbuttonItems()
    }
    
    @IBAction func BarButtonClick1(){
        
        self.view.backgroundColor = .orange
    }
    @IBAction func BarButtonClick2(){
        
        self.view.backgroundColor = .black
    }
    @IBAction func BarButtonClick3(){
        
        self.view.backgroundColor = .yellow
    }
    
    func displayToolBarbuttonItems(){
        
        t2 = UIToolbar()
        
        t2.frame = CGRect(x: 20, y: 400, width: 340, height: 60)
        
        t2.barStyle = .default
        t2.barTintColor = .yellow
        
        let flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        bb5 = UIBarButtonItem(title: "first", style: .plain, target: self, action: #selector(click5))
        
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 30
        
        bb6 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(click6))
        
        bb7 = UIBarButtonItem(image: UIImage(systemName: "sun.min.fill"), style: .plain, target: self, action: #selector(click7))
        
        let barbuttonItems: [UIBarButtonItem] = [flexibleSpace1, bb5, fixedSpace, bb6, bb7]
        self.t2.items = barbuttonItems
        self.view.addSubview(t2)
        
    }
    
    @objc func click5(){
        self.view.backgroundColor = .purple
    }
    
    @objc func click6(){
        self.view.backgroundColor = .brown
    }
    @objc func click7(){
        self.view.backgroundColor = .yellow
    }
    
    

}

