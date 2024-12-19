//
//  ViewController.swift
//  SahithiAssessment3Code2
//
//  Created by FCI on 07/12/24.
//

import UIKit
import CoreLocation
import QuartzCore

class ViewController: UIViewController {
    
    
    @IBOutlet var place:UITextField!
    @IBOutlet var latitude:UILabel!
    @IBOutlet var longitude:UILabel!
    @IBOutlet var tempLable:UILabel!
    @IBOutlet var humidityLable:UILabel!
    @IBOutlet var windSpeed:UILabel!
    @IBOutlet var descriptions:UILabel!
    @IBOutlet var address:UILabel!
    
    @IBOutlet var weatherInfo:UIButton!
    @IBOutlet var showMaps:UIButton!
    
    //variables for next screen
    var nxtlat:String!
    var nxtlon:String!
    var nxttemp:String!
    var nxtadd:String!
    
    //core animetion variables
    var textFieldLayer: CALayer!
    var labelViewLayer: CALayer!
    var buttonLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldLayer=place.layer
        textFieldLayer.borderWidth = 2
        textFieldLayer.cornerRadius = 10
        textFieldLayer.borderColor=UIColor.black.cgColor
        textFieldLayer.backgroundColor=UIColor.white.cgColor
        
        labelViewLayer=latitude.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        labelViewLayer=longitude.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        //labelViewLayer.backgroundColor=UIColor.white.cgColor
        
        labelViewLayer=tempLable.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        labelViewLayer=humidityLable.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        labelViewLayer=windSpeed.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        labelViewLayer=descriptions.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        labelViewLayer=address.layer
        labelViewLayer.borderWidth = 1
        labelViewLayer.cornerRadius = 10
        labelViewLayer.borderColor=UIColor.black.cgColor
        
        buttonLayer=weatherInfo.layer
        buttonLayer.borderWidth = 0.5
        buttonLayer.cornerRadius = 5
        buttonLayer.borderColor=UIColor.white.cgColor
        
        buttonLayer=showMaps.layer
        buttonLayer.borderWidth = 0.5
        buttonLayer.cornerRadius = 5
        buttonLayer.borderColor=UIColor.white.cgColor
        
    }
    @IBAction func displayWeatherDetails(){
        
        // 1. preparing the url
                
                let session1 = URLSession.shared
                
                let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(place.text!)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
                
                print("Sending Request --> Webservice URL:\n\(webserviceURL)")
                
                //2. Sending Request to Server
                
                let task1 = session1.dataTask(with: webserviceURL) {
                    (data: Data?, response: URLResponse?, error: Error?) in
                    if let error1 = error
                    {
                        print("Error:\n\(error1)")
                    }
                    else
                    {
                        if let data1 = data
                        {
                            // server sents data in the form of bytes
                            
                            print("Bytes Data:\n\(data1)")
                            //3. coverting bytes to String
                            
                            let dataString = String(data: data1, encoding: String.Encoding.utf8)
                            
                            print("All the weather data:\n\(dataString!)")
                            
                    // json parsing
                                                   
                    if let firstDictionary = try? JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary
                            {
                        
                        print("first Dictionary values: \(firstDictionary)")
                        
                        if let secondDictionary = firstDictionary.value(forKey: "coord") as? NSDictionary {
                            
                            print("main Dictionary values are: \(secondDictionary)")
                            
                            
                            // to display lat and lon
                                                                            
                        if let latitudevalue = secondDictionary.value(forKey: "lat") {
                                DispatchQueue.main.async {
                                    //print("\(self.txt.text!): \(temperaturevalue)°C")
                                    self.latitude.text = "Latitude: \(latitudevalue)"
                                    self.nxtlat="\(latitudevalue)"
                                }
                        }
                            
                        if let longitudevalue = secondDictionary.value(forKey: "lon") {
                                DispatchQueue.main.async {
                                   //print("\(self.txt.text!): \(humidityValue)°C")
                                    self.longitude.text = "Longitude: \(longitudevalue)"
                                    self.nxtlon="\(longitudevalue)"
                                }
                        }
                            if let latValue = secondDictionary.value(forKey: "lat") as? Double,
                               let lonValue = secondDictionary.value(forKey: "lon") as? Double{
                                let location = CLLocation(latitude: latValue, longitude: lonValue)
                                CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                                    if let error = error {
                                        let alert = UIAlertController(title: "Geocoding error", message: "Invalid Details.", preferredStyle: .alert)
                                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                                        self.present(alert, animated: true)
                                        return
                                    }
                                    else if let placemark = placemarks?.first{
                                        DispatchQueue.main.async {
                                            let name = placemark.name ?? "nill"
                                            let country = placemark.country ?? "nill"
                                            let administrativeArea = placemark.administrativeArea ?? "nill"
                                            let locality = placemark.locality ?? "nill"
                                            let postalCode = placemark.postalCode ?? "nil"
                                                                                                                
                                            self.address.text = "Address: \(name), \(country), \(administrativeArea), \(locality), \(postalCode)"
                                            self.nxtadd = self.address.text
                                        }
                                        
                                    }
                                }
                            }
                                
                            
                            
                        }
                        
                        if let thirdDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                            
                            //print("main Dictionary values are: \(secondDictionary)")
                            
                            
                            // to display temperature
                                                                            
                        if let tempvalue = thirdDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    //print("\(self.txt.text!): \(temperaturevalue)°C")
                                    self.tempLable.text = "Temperature: \(tempvalue)°C"
                                    self.nxttemp="\(tempvalue)°C"
                                }
                        }
                            
                        if let humidityvalue = thirdDictionary.value(forKey: "humidity") {
                                DispatchQueue.main.async {
                                   //print("\(self.txt.text!): \(humidityValue)°C")
                                    self.humidityLable.text = "Humidity: \(humidityvalue)"
                                }
                        }
                            
                        }
                        if let fourthDictionary = firstDictionary.value(forKey: "wind") as? NSDictionary {
                            // to display Wind Speed
                                                                            
                        if let windSpeedvalue = fourthDictionary.value(forKey: "speed") {
                                DispatchQueue.main.async {
                                    //print("\(self.txt.text!): \(temperaturevalue)°C")
                                    self.windSpeed.text = "WindSpeed: \(windSpeedvalue)"
                                }
                        }
                            
                            
                        }
                        if let lastDictionary = firstDictionary.value(forKey: "weather") as? NSArray,
                           let Weather = lastDictionary.firstObject as? NSDictionary,
                           let descriptionValue = Weather.value(forKey: "description") as? String{
                            // to display Wind Speed
                                                                            
                                DispatchQueue.main.async {
                                    //print("\(self.txt.text!): \(temperaturevalue)°C")
                                    self.descriptions.text = "Description: \(descriptionValue)"
                                }
                        
                            
                            
                        }
                        
                        
                 }
                            
                            
                        }
                    }
                }
                
                
                task1.resume()
        
        
    }
    
                                                                   
    @IBAction func displayMaps(){
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! ShowMapController
        
        nextScreen.lat = nxtlat
        nextScreen.lon = nxtlon
        nextScreen.temp = nxttemp
        nextScreen.headerTitle=place.text
        nextScreen.address=nxtadd
    }


}


