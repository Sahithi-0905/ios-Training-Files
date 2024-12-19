//
//  CurrentLocMapsViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 15/12/24.
//



//class CurrentLocMapsViewController: UIViewController
import UIKit
import MapKit
import QuartzCore
// Defines a ViewController class that manages the app's user interface.
class CurrentLocMapsViewController: UIViewController {
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet var shareBtn : UIButton!
    var lat: String!
    var long: String!
    var temp: String!
    var adminarea: String!
    var arealocality : String!
    var mapcountry : String!
    
    //core animation variables
    var mapViewLayer : CALayer!
    var segmentControlLayer : CALayer!
    var sharebtnLayer: CALayer!
    
    //barbutton item
    var homeButton1 : UIBarButtonItem!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //adding core animation to ui elements
        segmentControlLayer = segmentControl.layer
        segmentControlLayer.borderColor = UIColor.black.cgColor
        segmentControlLayer.borderWidth = 2
        segmentControlLayer.cornerRadius = 10
        
        sharebtnLayer = shareBtn.layer
        sharebtnLayer.cornerRadius = 10
        
        mapViewLayer = mapView.layer
        mapViewLayer.borderColor = UIColor.black.cgColor
        mapViewLayer.borderWidth = 2
        mapViewLayer.cornerRadius = 10
       
        // calling map and addbarbtn functions
        self.addbarBtn()
        self.showMaps()
        
     
    }
    
    func showMaps(){
        //annotation displays temperature ann address details
        let staticLocation = CLLocationCoordinate2D(latitude: Double(lat ?? "") ?? 0.0, longitude: Double(long ?? "") ?? 0.0)
        let span1 = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region1 = MKCoordinateRegion(center: staticLocation, span: span1)
        mapView.setRegion(region1, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticLocation
        annotation.title = "Address: \(adminarea!), \(arealocality!),\(mapcountry!)"
        annotation.subtitle = "Temperature: \(temp!)°C"
        mapView.addAnnotation(annotation)
    }
    
    // function to display different maps
    @IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == 0
        {
            mapView.mapType = .standard
        }  else if segmentControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
    // Share btn action
    @IBAction func ShareButtonClick() {
        let sharetext = "Address : \(adminarea!), \(arealocality!)\nTemperature : \(temp!)°C"
        let shareAll = [sharetext] as [Any]
        print(shareAll)
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated: true)
    }
    
    //creating bar button that navigates to root controller
    func addbarBtn(){
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton1Click))
        self.navigationItem.rightBarButtonItem = homeButton1
        homeButton1.tintColor = .white
    }
    
    @objc func homeButton1Click() {
            self.navigationController?.popToRootViewController(animated: true)
        }
}
