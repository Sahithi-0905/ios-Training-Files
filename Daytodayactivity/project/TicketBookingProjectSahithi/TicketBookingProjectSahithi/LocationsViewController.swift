//
//  LocationsViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 11/12/24.
//

import UIKit
import QuartzCore

class LocationsViewController: UIViewController {

    
    @IBOutlet var currentloc:UIButton!
    @IBOutlet var ststicloc:UIButton!
    
    var buttonLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonLayer=currentloc.layer
        buttonLayer.cornerRadius = 10
       
        
        buttonLayer=ststicloc.layer
        buttonLayer.cornerRadius = 10 
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
