//
//  ViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 11/12/24.
//

import UIKit
import QuartzCore
//first view controller
class ViewController: UIViewController {
    
    @IBOutlet var ticketbook:UIButton!
    @IBOutlet var climate:UIButton!
    
    //core animation variables
    var buttonLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set core animation for ui elements
        buttonLayer=ticketbook.layer
        buttonLayer.borderWidth = 0.5
        buttonLayer.cornerRadius = 10
        buttonLayer.borderColor=UIColor.black.cgColor
        
        buttonLayer=climate.layer
        buttonLayer.borderWidth=0.5
        buttonLayer.cornerRadius = 10
        buttonLayer.borderColor=UIColor.black.cgColor
        
    }


}

