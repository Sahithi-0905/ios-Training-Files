//
//  ViewController.swift
//  DisplayStaticLocationWithMapTypes
//
//  Created by FCI on 02/12/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet var m1: MKMapView!
    @IBOutlet var b1: UIButton!
    @IBOutlet var sc1:UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func b1click(){
        
        let staticlocation = CLLocationCoordinate2D(latitude: 12.641891, longitude: 77.440458)
        let span1=MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region1=MKCoordinateRegion(center: staticlocation, span: span1)
        
        m1.setRegion(region1, animated: true)
        
        //annotation red pin on map
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation
        annotation.title = "Jain University Campus"
        annotation.subtitle = "karnataka"
        m1.addAnnotation(annotation)
        
    }
    
    @IBAction func Sc1click(){
        
        let index:Int = sc1.selectedSegmentIndex
        if index==0{
            m1.mapType = .standard
        }
        else if index==1{
            m1.mapType = .satellite
        }
        else{
            m1.mapType = .hybrid
        }
    }

}

