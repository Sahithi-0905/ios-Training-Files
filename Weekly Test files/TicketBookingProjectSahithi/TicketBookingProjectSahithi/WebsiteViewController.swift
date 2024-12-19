//
//  WebsiteViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 13/12/24.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController {

    //ui elements
    @IBOutlet var webview: WKWebView!
    var homebtn:UIBarButtonItem!
    
    //variables for web view
    var url: URL!
    var req1: URLRequest!
    
    var weburl: String!
    var titles: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //calling barbtn and show website methods
        self.addbarbtn()
        self.showWebsite()
    }
    //adding barbutton to navigation
    func addbarbtn(){
        homebtn = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeBtnClick))
        self.navigationItem.rightBarButtonItem = homebtn
        homebtn.tintColor = .white
    }
    @objc func homeBtnClick(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //web view function
    func showWebsite(){
       
        let lasturl = String(describing: weburl!)
        url = URL(string: lasturl)
        
        if webview == nil {
            
            webview = WKWebView(frame: self.view.bounds)
            self.view.addSubview(webview)
        }
        // Load the URL in the WebView
        webview.load(URLRequest(url: url))
        self.navigationItem.title = titles
    }
    

}
