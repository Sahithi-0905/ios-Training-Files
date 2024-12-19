//
//  FullWebViewController.swift
//  SahithiAssignment2Coding1
//
//  Created by FCI on 28/11/24.
//

import UIKit
import WebKit

class FullWebViewController: UIViewController {
    
    @IBOutlet var webview1: WKWebView!
    
    var web1: String!
    var titles: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var url = URL(string: web1)
        var req1=URLRequest(url: url!)
        self.webview1.load(req1)
        self.navigationItem.title = titles
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
