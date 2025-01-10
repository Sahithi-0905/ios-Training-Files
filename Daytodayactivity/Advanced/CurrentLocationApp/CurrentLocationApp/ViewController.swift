//
//  ViewController.swift
//  CurrentLocationApp
//
//  Created by FCI on 02/12/24.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var label1: UILabel!
    @IBOutlet var latitude: UILabel!
    @IBOutlet var longitude: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var getlocDetails: UIButton!
    @IBOutlet var map :MKMapView!
    
    var locationmanager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationmanager = CLLocationManager()

        locationmanager.requestAlwaysAuthorization()
    }
    @IBAction func getlocBtnDetails(){
        if CLLocationManager.locationServicesEnabled(){
            locationmanager = CLLocationManager()
            
            locationmanager.delegate = self
            locationmanager.desiredAccuracy = kCLLocationAccuracyBest //k=constant
            locationmanager.distanceFilter = kCLDistanceFilterNone
            locationmanager.startUpdatingLocation()
            print("Location Services are enabled")
            statusLabel.text = "location serrvice are enabled"
        }
        else{
            print("Location Services are not enabled")
            statusLabel.text = "location serrvice are not enabled"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //getting location valuess and displaying in label
        
        let lat:Double = manager.location!.coordinate.latitude
        let long:Double = manager.location!.coordinate.longitude
        
        print("\(lat) and \(long)")
        
        latitude.text = "latitude: \(lat)"
        longitude.text = "longitude: \(long)"
        
        
        //code location values to mape
        
        let locationValue: CLLocationCoordinate2D = manager.location!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locationValue, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationValue
        annotation.title = "curent location found"
        annotation.subtitle = "You are Here!..."
        map.addAnnotation(annotation)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("\(error)")
        statusLabel.text = "\(error)"
    }


}

