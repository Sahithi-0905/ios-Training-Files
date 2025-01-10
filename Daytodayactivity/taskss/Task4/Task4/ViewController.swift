//
//  ViewController.swift
//  Task4
//
//  Created by FCI on 25/11/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var seg: UISegmentedControl!
    @IBOutlet var web: WKWebView!
    var urlreq: URL!
    var req1: URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func displayWebsites(){
        let index:Int = seg.selectedSegmentIndex
        
        if index==0{
            urlreq=URL(string: "https://www.apple.com")
            req1=URLRequest(url: urlreq)
            web.load(req1)
            
        }
        else if index==1{
            self.view.backgroundColor = .yellow
            urlreq=URL(string: "https://www.google.com")
            req1=URLRequest(url: urlreq)
            web.load(req1)
            
        }
        else {
            
            self.view.backgroundColor = .red
            urlreq=URL(string: "https://en.wikipedia.org/wiki/Taj_Mahal")
            req1=URLRequest(url: urlreq)
            web.load(req1)
            
        }
        
    }


}

