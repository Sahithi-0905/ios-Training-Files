//
//  AllWeatherInfoViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 15/12/24.
//

import UIKit
import CoreLocation

class AllWeatherInfoViewController: UIViewController {
    
    //ui elements
    @IBOutlet var place:UITextField!
    @IBOutlet var latitude:UILabel!
    @IBOutlet var longitude:UILabel!
    @IBOutlet var tempLable:UILabel!
    @IBOutlet var humidityLable:UILabel!
    @IBOutlet var windSpeed:UILabel!
    @IBOutlet var descriptions:UILabel!
    @IBOutlet var address:UILabel!
    @IBOutlet var homebar:UIBarButtonItem!
    
    @IBOutlet var weatherInfo:UIButton!
    @IBOutlet var showMaps:UIButton!
    
    //variables for next screen
    var nxtlat:String!
    var nxtlon:String!
    var nxttemp:String!
    var nxtadd:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addbarbtn()
        // Do any additional setup after loading the view.
    }
    
    //function to display weather
    @IBAction func getWeatherDetails (){
        
        guard let cityName = self.place.text, !cityName.isEmpty else {
            
            self.displayAlerts(alertTitle: "No City Found", alertmessage: "Please Enter a city name to displa weather information")
            return
        }
        
        // 1. preparing the url
        let session1 = URLSession.shared
        let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(place.text!)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
                
        print("Sending Request --> Webservice URL:\n\(webserviceURL)")
                
        //2. Sending Request to Server
                
        let task1 = session1.dataTask(with: webserviceURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error1 = error{
                print("Error:\n\(error1)")
                self.displayAlerts(alertTitle: "Enter city name", alertmessage: "error1")
            }
            else{
                if let data1 = data
                {
                    // server sents data in the form of bytes
                    print("Bytes Data:\n\(data1)")
                    
                    //3. coverting bytes to String
                    let dataString = String(data: data1, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                            
                    // json parsing
                    if let firstDictionary = try? JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary{
                        
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
                                            //to display address
                                            self.address.text = "Address: \(name), \(country), \(administrativeArea), \(locality), \(postalCode)"
                                            self.nxtadd = "\(name), \(country), \(administrativeArea), \(locality), \(postalCode)"
                                        }
                                        
                                    }
                                }
                            }
                                
                            
                            
                        }
                        
                        if let thirdDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                            
                        // to display temperature
                        if let tempvalue = thirdDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    self.tempLable.text = "Temperature: \(tempvalue)°C"
                                    self.nxttemp="\(tempvalue)°C"
                                }
                        }
                           
                        //to display humiddity
                        if let humidityvalue = thirdDictionary.value(forKey: "humidity") {
                                DispatchQueue.main.async {
                                    self.humidityLable.text = "Humidity: \(humidityvalue)"
                                }
                        }
                            
                        }
                        //to display wind speed
                        if let fourthDictionary = firstDictionary.value(forKey: "wind") as? NSDictionary {
                            // to display Wind Speed
                                                                            
                        if let windSpeedvalue = fourthDictionary.value(forKey: "speed") {
                                DispatchQueue.main.async {
                                    //print("\(self.txt.text!): \(temperaturevalue)°C")
                                    self.windSpeed.text = "WindSpeed: \(windSpeedvalue)"
                                }
                        }
                            
                            
                        }
                        //display weather
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
    //navigate to maps function
    @IBAction func navigateMaps(){
        
        guard let cityName = place.text, !cityName.isEmpty else {
            
            displayAlerts(alertTitle: "No City Found", alertmessage: "Please Enter a city name before navigation")
            return
        }

    }
    
    //data parsing to mapsviewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! MapsViewController
        
        nextScreen.lat = nxtlat
        nextScreen.lon = nxtlon
        nextScreen.temp = nxttemp
        nextScreen.headerTitle=place.text
        nextScreen.address=nxtadd
    }
    //allert View function
    func displayAlerts(alertTitle: String, alertmessage: String) {
        // Display an alert with a title and message
        let alert = UIAlertController(title: alertTitle, message: alertmessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
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


}
