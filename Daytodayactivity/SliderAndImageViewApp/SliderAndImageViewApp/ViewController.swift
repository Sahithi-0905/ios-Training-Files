//
//  ViewController.swift
//  SliderAndImageViewApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img1: UIImageView!
    @IBOutlet var slid: UISlider!
    
    //variables coding
    var iv1: UIImageView!
    var slid2: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.displaySliderAndImasgeview()//coding
    }
    @IBAction func sliderMove1(){
        
        let value1 : Float = slid.value
        img1.alpha = CGFloat(value1)
    }
    
    //coding
    func displaySliderAndImasgeview(){
        
        //imageview code
        iv1=UIImageView()
        iv1.frame = CGRect(x: 30, y: 480, width: 200, height: 200)
        iv1.backgroundColor = .black
        iv1.tintColor = .yellow
        iv1.image=UIImage(systemName: "sun.min.fill") //syntax to display an sf symbols in imageview
        iv1.contentMode = .scaleAspectFit
        iv1.alpha = 1
        self.view.addSubview(iv1)
        
        //scroll code
        slid2=UISlider()
        slid2.frame = CGRect(x: 30, y: 700, width: 180, height: 40)
        slid2.minimumValue = 0
        slid2.maximumValue = 1
        slid2.value = 0.5
        slid2.minimumTrackTintColor = .blue
        slid2.maximumTrackTintColor = .yellow
        slid2.thumbTintColor = .cyan
        slid2.backgroundColor = .purple
        
        slid2.addTarget(self, action: #selector(sliderMove2), for: .valueChanged)
        self.view.addSubview(slid2)
        
    }
    //for code
    @objc func sliderMove2(){
        
        let value1 : Float = slid2.value
        iv1.alpha = CGFloat(value1)
    }
}

