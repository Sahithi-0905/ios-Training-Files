//
//  ViewController.swift
//  StepperApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stp1: UIStepper!
    @IBOutlet var label: UILabel!
    
    var stp2: UIStepper!
    var labe2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dissplaySteppeer()
    }
    @IBAction func displayStepper1(){
       
        let i:Double = stp1.value
        label.text = Int(i).description
        
    }
    
    func dissplaySteppeer(){
        
        stp2 = UIStepper()
        
        stp2.frame = CGRect(x: 40, y: 400, width: 180, height: 40)
        stp2.value = 0
        stp2.minimumValue = 0
        stp2.maximumValue = 5
        stp2.stepValue = 1
        stp2.isContinuous = true
        stp2.autorepeat = true
        stp2.wraps = true
        stp2.backgroundColor = .darkGray
        stp2.tintColor = .blue
        
        stp2.addTarget(self, action: #selector(s2click), for: .valueChanged)
        
        //stp2.addSubview()
    }
    
    @objc func s2click(){
        let i:Double = stp2.value
        label.text = Int(i).description
        
    }

}

