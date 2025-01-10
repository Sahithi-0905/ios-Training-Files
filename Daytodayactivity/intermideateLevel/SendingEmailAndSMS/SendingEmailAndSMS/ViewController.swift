//
//  ViewController.swift
//  SendingEmailAndSMS
//
//  Created by FCI on 29/11/24.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate , MFMailComposeViewControllerDelegate{
    
    
    

    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func b1Click(){
        
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["test@test.test"])
            mail.setSubject("Greeting")
            mail.setMessageBody("<p>Good morning</p>", isHTML: true)
            
            present(mail, animated: true)
            
        }
    }
    
  
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch(result){
        case.cancelled:
            print("Message Was Cancelled")
            dismiss(animated: true)
        case.failed:
            print("Message Was Cancelled")
            dismiss(animated: true)
        case.sent:
            print("Message Was Cancelled")
            dismiss(animated: true)
        default:
            break
        }
    }
    
    @IBAction func b2Click(){
        if (MFMessageComposeViewController.canSendText()){
            let controller = MFMessageComposeViewController()
            controller.body = "Happy Birthday"
            controller.recipients = ["9988997879"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch(result){
        case.cancelled:
            print("Message Was Cancelled")
            dismiss(animated: true)
        case.failed:
            print("Message Was Faild")
            dismiss(animated: true)
        case.sent:
            print("Message Was Sent")
            dismiss(animated: true)
        default:
            break
        }
    }


}

