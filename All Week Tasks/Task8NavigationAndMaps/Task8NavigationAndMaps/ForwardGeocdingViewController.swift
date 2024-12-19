//
//  ForwardGeocdingViewController.swift
//  Task8NavigationAndMaps
//
//  Created by FCI on 10/12/24.
//

import UIKit
import CoreLocation

class ForwardGeocdingViewController: UIViewController {
    
    
    @IBOutlet var enterAddress: UITextField!
    
    @IBOutlet var btnForward: UIButton!
    
    @IBOutlet var labelForward: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ForwardClick(_ sender: UIButton) {
        
        
        // Forward Geo COding
            
           
        guard let address = enterAddress.text, !address.isEmpty else {
            print("Address is empty or nil.")
            return
        }

        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            if let error = error {
                print("Geocoding failed with error: \(error.localizedDescription)")
                return
            }
            if let placemark = placemarks?.first {
                let lat = String(format: "%.04f", placemark.location?.coordinate.latitude ?? 0.0)
                let lon = String(format: "%.04f", placemark.location?.coordinate.longitude ?? 0.0)
                print("\(lat), \(lon)")
                
                self.labelForward.text = "Latitude: \(lat) and Longitude: \(lon)"
            } else {
                print("No placemarks found for the address.")
            }
        }

    }
    
 

}
