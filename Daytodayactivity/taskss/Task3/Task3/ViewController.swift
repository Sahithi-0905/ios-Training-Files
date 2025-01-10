//
//  ViewController.swift
//  Task3
//
//  Created by FCI on 24/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var seg: UISegmentedControl!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func displayDetails(){
        let index:Int = seg.selectedSegmentIndex
        
        if index==0{
            
            labelName.text = String(describing: "Hyderabad")
            img.image = UIImage(named: "hyd.jpeg")
            seg.selectedSegmentTintColor = .orange
            do{
                let path = Bundle.main.path(forResource: "hyd", ofType: "txt")
                
                let str = try String(contentsOfFile: path!)
                text.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        
        else if index==1{
            labelName.text = String(describing: "Kerala")
            img.image = UIImage(named: "kerala.jpeg")
            seg.selectedSegmentTintColor = .white
            do{
                let path = Bundle.main.path(forResource: "kerala", ofType: "txt")
                
                let str = try String(contentsOfFile: path!)
                text.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        else {
            labelName.text = String(describing: "Taj Mahal")
            img.image = UIImage(named: "taj.jpeg")
            seg.selectedSegmentTintColor = .green
            do{
                let path = Bundle.main.path(forResource: "taj", ofType: "txt")
                
                let str = try String(contentsOfFile: path!)
                text.text = str
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }


}

