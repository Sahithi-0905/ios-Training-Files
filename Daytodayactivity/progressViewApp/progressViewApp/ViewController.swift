//
//  ViewController.swift
//  progressViewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pv: UIProgressView!
    @IBOutlet var timer: Timer!
    
    var pv1: UIProgressView!
    var timer1: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updatePrrogress1), userInfo: nil, repeats: true)
        
        self.displayProgressView()
    }

    @objc func updatePrrogress1(){
        
        pv.progress += 0.1
        if pv.progress == 1{
            pv.isHidden=true
            self.view.backgroundColor = .yellow
            timer.invalidate()
        }
        
    }
    
    func displayProgressView(){
        
        //progressview code
        pv1 = UIProgressView()
        pv1.frame=CGRect(x: 30, y: 350, width: 300, height: 40)
        
        pv1.progress = 0
        pv1.progressViewStyle = .bar
        pv1.progressTintColor = .blue
        pv1.trackTintColor = .white
        
        self.view.addSubview(pv1)
        
        timer1 = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(updatePrrogress2), userInfo: nil, repeats: true)
        
    }
    @objc func updatePrrogress2(){
        
        pv1.progress += 0.3
        if pv1.progress == 1{
            pv1.isHidden=true
            self.view.backgroundColor = .orange
            timer1.invalidate()
        }
    }

}

