//
//  ViewController.swift
//  SegmentedControllApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sego: UISegmentedControl!
    
    var sego2: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dissplaySegmentedControl()
    }
    @IBAction func sc1click(){
        
        let index:Int = sego.selectedSegmentIndex
        
        if index==0{
            self.view.backgroundColor = .orange
            sego.selectedSegmentTintColor = .orange
        }
        
        else if index==1{
            self.view.backgroundColor = .white
            sego.selectedSegmentTintColor = .white
            
        }
        else{
            self.view.backgroundColor = .green
            sego.selectedSegmentTintColor = .green
            
        }
        
    }
    
    func dissplaySegmentedControl(){
        
        let segmentName = ["orrange","white","green",UIImage(systemName: "pencil.circle.fill")!] as! [Any]
        
        sego2=UISegmentedControl(items: segmentName)
        sego2.frame=CGRect(x: 40, y: 300, width: 350, height: 40)
        sego2.backgroundColor = .cyan
        sego2.selectedSegmentTintColor = .red
        sego2.addTarget(self, action: #selector(ssc2click), for: .valueChanged)
        self.view.addSubview(sego2)
    }
    
    @objc func ssc2click(){
        
        let index:Int = sego2.selectedSegmentIndex
        
        if index==0{
            self.view.backgroundColor = .orange
        }
        else if index==1{
            self.view.backgroundColor = .white
            
        }
        else if index==2{
            self.view.backgroundColor = .green
            
        }
        else{
            self.view.backgroundColor = .purple
            
        }
        
    }

}

