//
//  ViewController.swift
//  LocalNotificationsApp
//
//  Created by FCI on 29/11/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet var b1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {_,_ in })
    }
    
    @IBAction func b1Click(){
        
        //creating the notification
        let content = UNMutableNotificationContent()
        
        content.title=""
        content.subtitle=""
        content.body=""
        content.badge=1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "simpleFieldIOSNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        <#code#>
    }


}

