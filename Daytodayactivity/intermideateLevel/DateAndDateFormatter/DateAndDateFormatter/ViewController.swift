//
//  ViewController.swift
//  DateAndDateFormatter
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var b1: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    var timer1: Timer!
    
    var dateinfo: Date!
    var df1: DateFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tierDisplay), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func b1click(){
        
        dateinfo = Date()
        df1 = DateFormatter()
        df1.dateStyle = .full
        df1.timeStyle = .full
        label.text = df1.string(from: dateinfo)
        
    }
    @objc func tierDisplay(){
        
        label2.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .medium)
    }

}

