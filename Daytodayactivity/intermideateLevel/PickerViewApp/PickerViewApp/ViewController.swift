//
//  ViewController.swift
//  PickerViewApp
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,
                        UIPickerViewDataSource {  //protocols

    @IBOutlet var pv1: UIPickerView!
    @IBOutlet var label1: UILabel!
    
    var array1: [String] = []
    var array2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        array1 = ["iMac","Mini Mac", "Mac Book Pro"]
        array2 = ["iPhone","iPad"]
        //array3 = []
        
        pv1.delegate = self
        pv1.dataSource = self
    }
    
    //Pickeerview Protocl methods implementation here
    
    //num of components in a picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //num of rows in a component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0{
            
            return array1.count
        }
        else{
            
            return array2.count
        }
    }
    
    //3.display the arrayys in rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            
            return array1[row]
        }
        else{
            
            return array2[row]
        }
    }
    
    //4.when user select any row in component
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            
            label1.text = array1[row]
        }
        else{
            label1.text = array2[row]
            
        }
    }
    
    //5. row height
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
  
    //6. Row width
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 200
    }


}

