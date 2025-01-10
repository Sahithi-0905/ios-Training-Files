//
//  ViewController.swift
//  WebkitViewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webkitview: WKWebView!
    var url: URL!
    var req1: URLRequest!
    
    var webkitview2: WKWebView!
    var url2: URL!
    var req2: URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        url=URL(string: "https://www.apple.com")
        req1=URLRequest(url: url)
        webkitview.load(req1)
        
        self.dislpayWebkitView()
    }
    
    func dislpayWebkitView(){
        
        webkitview2=WKWebView()
        webkitview2.frame=CGRect(x: 20, y: 450, width: 350, height: 380)
        self.view.addSubview(webkitview2)
        
        url2=URL(string: "https://www.google.com")
        req2=URLRequest(url: url2)
        webkitview2.load(req2)
        
    }


}

