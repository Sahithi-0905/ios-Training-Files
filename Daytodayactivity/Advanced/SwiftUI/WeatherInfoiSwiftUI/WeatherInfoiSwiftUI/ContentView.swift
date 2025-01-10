//
//  ContentView.swift
//  WeatherInfoiSwiftUI
//
//  Created by Naga Murali Akula on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    
    
    /// Bindable properties that hold the current values for the text fields
    @State private var username: String = ""
    @State var labelString1: String = ""
    
    var body: some View {
        
        
         // Username Section
        // Text("Enter your username")
            // .font(.title2)
         TextField("Enter CityName,CountryCode Here", text: $username)
             .padding()
             .border(Color.yellow, width: 5)
             .background(Color.brown)
             .foregroundColor(.white)
             .cornerRadius(5.0)
        
        
        // label
        
        /// A label that combines an envelope icon with the "Send Message" text
    Label(labelString1, systemImage: "")
        
        /// Label is styled with a blue background, white foreground, rounded corners, and some padding.
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5.0)
        
        // button
        
        Button(action: {
           
        callwebservice()
            
        }) {
            Text("Tap Me!")
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10.0)
        
    }
}

func callwebservice() {
    

    // 1. preparing the url
    
    let session1 = URLSession.shared
    
    let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Hyderabad,IN&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
    
    print("Sending Request --> weatherURL:\n\(weatherURL)")
    
    //2. Sending Request to Server
    
    let task1 = session1.dataTask(with: weatherURL) {
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
            
            if let secondDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                
                print("main Dictionary values are: \(secondDictionary)")
                
                
                // to display temperature
                                                                
            if let temperaturevalue = secondDictionary.value(forKey: "temp") {
                    DispatchQueue.main.async {
                  // print("\(self.$username.text!): \(temperaturevalue)°C")
              //  self.temperatureLabel.text = "\(self.tf1.text!) Temperature: \(temperaturevalue)°C"
                                  
                        print(temperaturevalue)
                        
                      //  self.labelString1 = "\(temperaturevalue)"
                    }
                                            }
                
                
                if let humidityValue = secondDictionary.value(forKey: "humidity") {
                        DispatchQueue.main.async {
                      // print("\(self.tf1.text!): \(humidityValue)°C")
                   // self.humidityLabel.text = "\(self.tf1.text!) Humidity: \(humidityValue)"
                            print(humidityValue)
                                                }
                                                }
            
                
                
                
                
            }
            
       
                
            
     }
                
                
                
            }
        }
    }
    
    
    task1.resume()
    
    
    
    
    
}

// 


#Preview {
    ContentView()
}
