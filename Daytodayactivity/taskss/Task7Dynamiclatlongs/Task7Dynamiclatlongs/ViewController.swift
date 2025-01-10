//
//  ViewController.swift
//  Task7Dynamiclatlongs
//
//  Created by FCI on 09/12/24.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
    
    
    @IBOutlet var latitude: UITextField!
    @IBOutlet var longitude: UITextField!
    @IBOutlet var annotations: UITextField!
    
    @IBOutlet var btnDisplay: UIButton!
    
    @IBOutlet var mv: MKMapView!
    
    @IBOutlet var segcntrl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnClick() {
        
        let staticLocation = CLLocationCoordinate2D(latitude: Double(latitude.text ?? "") ?? 0.0, longitude: Double(longitude.text ?? "") ?? 0.0)
        
        
        let span1 = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        
        let region1 = MKCoordinateRegion(center: staticLocation, span: span1)
        
        mv.setRegion(region1, animated: true)
        
        // Annotations
        
        // displaying Annotation on Mapview
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticLocation
        annotation.title = annotations.text
        mv.addAnnotation(annotation)
        
    }
    
    
    
    @IBAction func segmentedcontrol() {
        
        
        
        if segcntrl.selectedSegmentIndex == 0 {
            mv.mapType = .standard
        }
        else if segcntrl.selectedSegmentIndex == 1{
            mv.mapType = .satellite
        }
        
        else {
            mv.mapType = .hybrid
            
        }
    }
    
    
    
}


