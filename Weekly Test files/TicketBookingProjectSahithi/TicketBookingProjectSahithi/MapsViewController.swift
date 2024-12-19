//
//  MapsViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 15/12/24.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {

    //ui elements
    @IBOutlet var map: MKMapView!
    @IBOutlet var diffmap:UISegmentedControl!
    @IBOutlet var homebar:UIBarButtonItem!
    @IBOutlet var shareInfo:UIButton!
    
    //data transfer variables
    var lat : String!
    var lon : String!
    var temp : String!
    var headerTitle : String!
    var address : String!
    
    //core animation variables
    var mapViewLayer : CALayer!
    var segmentControlLayer : CALayer!
    var sharebtnLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adding core animation to ui elements
        segmentControlLayer = diffmap.layer
        segmentControlLayer.borderColor = UIColor.black.cgColor
        segmentControlLayer.borderWidth = 2
        segmentControlLayer.cornerRadius = 10
        
        sharebtnLayer = shareInfo.layer
        sharebtnLayer.cornerRadius = 10
        
        mapViewLayer = map.layer
        mapViewLayer.borderColor = UIColor.black.cgColor
        mapViewLayer.borderWidth = 2
        mapViewLayer.cornerRadius = 10
        
        // calling map and addbarbtn functions
        self.showMaps()
        self.addbarbtn()
        // Do any additional setup after loading the view.
    }
    
    //function to display maps
    func showMaps(){
        
        self.title=headerTitle
        let staticlocation = CLLocationCoordinate2D(latitude: Double(lat ?? " ") ?? 0.0, longitude: Double(lon ?? " ") ?? 0.0)
        let span1=MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region1=MKCoordinateRegion(center: staticlocation, span: span1)
        
        map.setRegion(region1, animated: true)
        
        //annotation red pin on map
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation
        annotation.title=" \(String(describing: address!))"
        annotation.subtitle="Temperature: \(String(describing: temp!))"
        map.addAnnotation(annotation)
    }
    
    //segmentedcontroll Maps implementation
    @IBAction func showDifferentMaps(){
        diffmap.selectedSegmentTintColor = .systemRed
        let index:Int = diffmap.selectedSegmentIndex
        if index==0{
            map.mapType = .standard
        }
        else if index==1{
            map.mapType = .satellite
        }
        else{
            map.mapType = .hybrid
        }
    }
    //adding barbutton to navigation
    func addbarbtn(){
        homebar = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeBtnClick))
        self.navigationItem.rightBarButtonItem = homebar
        homebar.tintColor = .white
    }
    @objc func homeBtnClick(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //share button action
    @IBAction func shareInfoClicked(){
        
        let sharetext = "Address : \(address!)\nTemperature : \(temp!)°C"
        let shareAll = [sharetext] as [Any]
        
        print(shareAll)
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
           
        self.present(activityViewController, animated: true)
    }


}
