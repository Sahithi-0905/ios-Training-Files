//
//  ViewController.swift
//  CoreAnimationApp
//
//  Created by FCI on 28/11/24.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var tf1: UITextField!
    @IBOutlet var img1: UIImageView!
    
    var labelLayer: CALayer!
    var textFieldLayer: CALayer!
    var imageLayer: CALayer!
    var screenViewLayyer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //label layer
        labelLayer = label1.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 6
        labelLayer.cornerRadius = 30
        labelLayer.backgroundColor = UIColor.yellow.cgColor
        
        //text field
        textFieldLayer = tf1.layer
        textFieldLayer.borderColor = UIColor.black.cgColor
        textFieldLayer.borderWidth = 2
        textFieldLayer.cornerRadius = 13
        textFieldLayer.backgroundColor = UIColor.red.cgColor
        
        //image layer
        imageLayer = img1.layer
        imageLayer.borderColor = UIColor.orange.cgColor
        imageLayer.borderWidth = 2
        imageLayer.cornerRadius = 13
        
        screenViewLayyer = self.view.layer
        screenViewLayyer.borderColor = UIColor.orange.cgColor
        screenViewLayyer.borderWidth = 2
        screenViewLayyer.cornerRadius = 13
        
    }


}

