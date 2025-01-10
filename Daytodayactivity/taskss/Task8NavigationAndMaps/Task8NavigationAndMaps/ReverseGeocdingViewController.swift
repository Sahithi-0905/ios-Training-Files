//
//  ReverseGeocdingViewController.swift
//  Task8NavigationAndMaps
//
//  Created by FCI on 10/12/24.
//

import UIKit
import MapKit


class ReverseGeocdingViewController: UIViewController {
    
    
    @IBOutlet var lat: UITextField!
    @IBOutlet var lon: UITextField!
    
    @IBOutlet var btnR: UIButton!
    
    @IBOutlet var labelR: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ReverseClick(_ sender: UIButton) {
        
        // Reverse Geo COding
        
        if let latText = lat.text, let lonText = lon.text,
           let latitude = Double(latText), let longitude = Double(lonText) {
            let loc = CLLocation(latitude: latitude, longitude: longitude)
           
        //if let loc = CLLocation(coder: staticLocation) {
               
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler: { (placemarks, error) in
           
            if let placemark1 = placemarks?[0] {
                
                let name = placemark1.name!
                let country = placemark1.country!
                let adminstrative = placemark1.administrativeArea!
                let locality = placemark1.locality!
                let postalCode = placemark1.postalCode!
                
                
                print("\(name),\(adminstrative), \(locality),\(country), \(postalCode)")
                
                self.labelR.text = """
                  \(name)
                \(adminstrative)
                \(locality)
                \(country)
                \(postalCode)
"""

           }
           })
           }
        
        
        
    }
    

}
