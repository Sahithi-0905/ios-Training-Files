//
//  CurrentLocationViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 15/12/24.
//

import UIKit
import CoreLocation
import QuartzCore

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    // ui elements
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var details: UILabel!
    @IBOutlet var getLocationDetailsButton: UIButton!
    @IBOutlet var getWhether: UIButton!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet var wind: UILabel!
    @IBOutlet weak var navigateToMapTapped: UIButton!
    var locationManager: CLLocationManager!
    
    var lat: String?
    var long: String?
    var temperaturevalue: String?
    var administrativeArea1: String?
    var locality1: String?
    var name1: String?
    var postalCode1: String?
    var country1: String?
    
   
    var homeButton1 : UIBarButtonItem!
    
    //core animation variables
    var labelLayer : CALayer!
    var ButtonLayer : CALayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set core animation for ui elements
        labelLayer = latitudeLabel.layer
        labelLayer.cornerRadius = 5
        
        labelLayer = longitudeLabel.layer
        labelLayer.cornerRadius = 5
        
        labelLayer = details.layer
        labelLayer.cornerRadius = 5
        
        labelLayer = temperatureLabel.layer
        labelLayer.cornerRadius = 5
        
        labelLayer = humidityLabel.layer
        labelLayer.cornerRadius = 5
        
        labelLayer = wind.layer
        labelLayer.cornerRadius = 5
        
        ButtonLayer = getWhether.layer
        ButtonLayer.cornerRadius = 5
        
        ButtonLayer = navigateToMapTapped.layer
        ButtonLayer.cornerRadius = 5
        
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        
        self.homebtn()
    }
    // Defines an action triggered when the button is tapped
    @IBAction func getLocationDetailsButtonClick() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            print("Location services are enabled")
        }
        else {
            displayAlerts(alertTitle: "Enable Location", alertmessage: "Location services are not enabled. Please enable them in settings.")
            print("Location services are not enabled")
            
        }
    }
    // CLLocationManagerDelegate Protcol Methods implementation here
    
    // once location values are available then this function will execute
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // getting location values and displaying in labels
                guard let location = locations.last else { return }

                let latValue = location.coordinate.latitude
                let longValue = location.coordinate.longitude

                lat = String(latValue)
                long = String(longValue)

                DispatchQueue.main.async {
                    self.latitudeLabel.text = "Latitude: \(self.lat ?? "No latitude")"
                    self.longitudeLabel.text = "Longitude: \(self.long ?? "No longitue")"
                }

                CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                    if let error = error {
                        print("Reverse geocoding failed: \(error.localizedDescription)")
                        self.displayAlerts(alertTitle: "Error", alertmessage: "Unable to fetch address. Try again.")
                        return
                    }

                    if let placemark = placemarks?.first {
                        self.name1 = placemark.name ?? "NO Name"
                        self.country1 = placemark.country ?? "No country"
                        self.administrativeArea1 = placemark.administrativeArea ?? "no administrativeArea"
                        self.locality1 = placemark.locality ?? "No locality"
                        self.postalCode1 = placemark.postalCode ?? "No postalCode"

                        DispatchQueue.main.async {
                            self.details.text = """
                            \(self.locality1!),\(self.administrativeArea1!), 
                            \(self.postalCode1!),\(self.country1!)
                            """
                        }
                    }
                }

                locationManager.stopUpdatingLocation()
            }
    // Defines an action triggered when the button is tapped
    @IBAction func fetchWhetherTappedClick() {
            guard let lat = lat, let long = long else {
                displayAlerts(alertTitle: "Error", alertmessage: "Please fetch your current location first.")
                return
            }
        // 1. preparing the url
            let session = URLSession.shared
            guard let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric") else {
                displayAlerts(alertTitle: "Error", alertmessage: "Invalid URL.")
                return
            }
        //2. Sending Request to Server
            let task = session.dataTask(with: webserviceURL) { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self.displayAlerts(alertTitle: "Error", alertmessage: "Failed to fetch weather details: \(error.localizedDescription)")
                    }
                    return
                }

                guard let data = data else { return }
                // json parsing
                if let firstDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainData = firstDictionary.value(forKey: "main") as? NSDictionary {
                        //display temperature
                        if let temperature = mainData.value(forKey: "temp") as? Double {
                            DispatchQueue.main.async {
                                self.temperatureLabel.text = "Temperature: \(temperature)°C"
                                self.temperaturevalue = "\(temperature)"
                            }
                        }
                        //display humidity
                        if let humidity = mainData.value(forKey: "humidity") as? Int {
                            DispatchQueue.main.async {
                                self.humidityLabel.text = "Humidity: \(humidity)%"
                            }
                        }
                    }
                    //display wind
                    if let windData = firstDictionary.value(forKey: "wind") as? NSDictionary,
                       let speed = windData.value(forKey: "speed") as? Double {
                        DispatchQueue.main.async {
                            self.wind.text = "WindSpeed: \(speed) m/s"
                        }
                    }
                }
            }
            task.resume()
        }

        // Show Maps btn
        @IBAction func showMaps(_ sender: UIButton) {
            
        }

        //  Prepare for Segue to CurrentLocMapsViewController
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let nextScreen = segue.destination as? CurrentLocMapsViewController {
                
                //alert view if latitude and longitude are not fetched before navigating to maps
                if (lat == nil){
                    displayAlerts(alertTitle: "Fetch current location", alertmessage: "click Current location and Weather Info Buttons")
                }
                nextScreen.title = locality1
                nextScreen.lat = lat
                nextScreen.long = long
                nextScreen.adminarea = administrativeArea1
                nextScreen.arealocality = locality1
                nextScreen.mapcountry = country1
                nextScreen.temp = temperaturevalue
            }
        }

    //  Helper Method to Show Alerts
    func displayAlerts(alertTitle: String, alertmessage: String) {
        // Display an alert with a title and message
        let alert = UIAlertController(title: alertTitle, message: alertmessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    func homebtn(){
        //home  button code
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton))
        self.navigationItem.rightBarButtonItem = homeButton1
        homeButton1.tintColor = .white
    }
    
    // home button function
    @objc func homeButton() {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

