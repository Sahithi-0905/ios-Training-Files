//
//  ViewController.swift
//  Task5ActionSheet
//
//  Created by FCI on 26/11/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet var txt: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var web: WKWebView!
    
    //var url: URL!
    //var req1: URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func b5click(){
        
        let alert = UIAlertController(title: "Title", message: "Select Any Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "WebKitView", style: .default, handler:{ (_) in
            
            let url = URL(string: String(describing:self.txt.text!))
            let req1=URLRequest(url: url!)
            self.web.load(req1)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Safari", style: .default, handler:{ (_) in
            
            let sfurl = URL(string: String(describing:self.txt.text!))
            let safariVC = SFSafariViewController(url: sfurl!)
            self.present(safariVC,animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:{ (_) in
            print("Delete Button Clicked")
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }



}

