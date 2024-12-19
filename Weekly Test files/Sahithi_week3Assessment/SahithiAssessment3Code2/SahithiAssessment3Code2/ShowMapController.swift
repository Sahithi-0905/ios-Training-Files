//
//  ShowMapController.swift
//  SahithiAssessment3Code2
//
//  Created by FCI on 07/12/24.
//

import UIKit
import MapKit
import CoreLocation
import QuartzCore

class ShowMapController: UIViewController {
    
    @IBOutlet var m1: MKMapView!
    @IBOutlet var sc1:UISegmentedControl!
    
    var lat:String!
    var lon:String!
    var temp:String!
    var headerTitle: String!
    var address:String!
    
    var seg:CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        seg=sc1.layer
        seg.borderWidth = 1
        seg.cornerRadius = 10
        seg.borderColor=UIColor.black.cgColor
        
        print("\(lat)\(lon)")
        //self.navigationController!.title=headerTitle
        self.title=headerTitle
        let staticlocation = CLLocationCoordinate2D(latitude: Double(lat ?? " ") ?? 0.0, longitude: Double(lon ?? " ") ?? 0.0)
        let span1=MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region1=MKCoordinateRegion(center: staticlocation, span: span1)
        
        m1.setRegion(region1, animated: true)
        
        //annotation red pin on map
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation
        annotation.title=headerTitle
        annotation.subtitle="Temperature: \(String(describing: temp!)), \(String(describing: address!))"
        m1.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func showDifferentMaps(){
        sc1.selectedSegmentTintColor = .systemYellow
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
