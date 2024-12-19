//
//  ViewController.swift
//  Task3Coding
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    var segcontrol: UISegmentedControl!
    var labelName: UILabel!
    var img: UIImageView!
    var text1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayAllFields()
    }

    func displayAllFields(){
        
        //segmented controll
        let segmentName = ["Hyderabad","Kerala","Taj Mahal"] as! [Any]
        
        segcontrol = UISegmentedControl(items: segmentName)
        segcontrol.frame=CGRect(x: 70, y: 100, width: 240, height: 32)
        segcontrol.backgroundColor = .blue
        segcontrol.selectedSegmentTintColor = .red
        segcontrol.addTarget(self, action: #selector(segmentedControllDisplay), for: .valueChanged)
        self.view.addSubview(segcontrol)
        
        //label
        labelName = UILabel()
        labelName.frame = CGRect(x: 70, y: 150, width: 100, height: 22)
        labelName.numberOfLines = 1
        self.view.addSubview(labelName)
        
        //image view
        img = UIImageView()
        img.frame = CGRect(x: 70, y: 200, width: 200, height: 200)
        img.contentMode = .scaleAspectFit
        self.view.addSubview(img)
        
        //text view
        text1 = UITextView()
        text1.frame = CGRect(x: 70, y: 450, width: 200, height: 200)
        text1.returnKeyType = .done
        text1.textAlignment = .center
        self.view.addSubview(text1)
        
    }
    @objc func segmentedControllDisplay(){
        
        let index:Int = segcontrol.selectedSegmentIndex
        
        if index==0{
            labelName.text="Hyderabad"
            img.image = UIImage(named:"hyd.jpeg" )
            self.view.backgroundColor = .orange
            do{
                let path = Bundle.main.path(forResource: "hyd", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                text1.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        else if index==1{
            labelName.text="Kerala"
            img.image = UIImage(named: "kerala.jpeg")
            self.view.backgroundColor = .white
            do{
                let path = Bundle.main.path(forResource: "kerala", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                text1.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        else {
            labelName.text="Taj Mahal"
            img.image = UIImage(named: "taj.jpeg")
            self.view.backgroundColor = .green
            do{
                let path = Bundle.main.path(forResource: "taj", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                text1.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    

}

