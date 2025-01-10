//
//  ViewController.swift
//  AlertView
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    @IBOutlet var b4: UIButton!
    @IBOutlet var b5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func b1click(){
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancle", style: .default, handler:{
            _ in
            print("cancle button clicked")
        }))
        
        alert.addAction(UIAlertAction(title: "Sign out", style: .default, handler: {(_: UIAlertAction) in
        }))
        
        //display alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func b2click(){
        
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancle", style: .default, handler:{
            _ in
            print("cancle button clicked")
        }))
        
        alert.addAction(UIAlertAction(title: "Sign out", style: .destructive, handler: {(_: UIAlertAction) in
        }))
        
        //display alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func b3click(){
        let alert = UIAlertController(title: "Alert", message: "You can always access your content by signing", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancle", style: .default, handler:{
            _ in
            print("cancle button clicked")
        }))
        
        alert.addAction(UIAlertAction(title: "Sign out", style: .destructive, handler: {(_: UIAlertAction) in
        }))
        
        //display alert
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func b4click(){
        
        let alertController = UIAlertController(title: "Add new tag", message: nil, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title:"Add",style: .default){(_) in
        
            if let textField = alertController.textFields?.first,
               let text = textField.text{
                print("Text==>"+text)
            }
        }
        alertController.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title:"cancel",style: .cancel) {(_) in}
        alertController.addTextField{ (textField) in
            textField.placeholder="Tag"
        }
        
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    @IBAction func b5click(){
        
        let alert = UIAlertController(title: "Title", message: "Please Select An Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Approved", style: .default, handler:{ (_) in
            print("Approve Button Clicked")
        }))
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler:{ (_) in
            print("Edit Button Clicked")
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler:{ (_) in
            print("Delete Button Clicked")
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler:{ (_) in
            print("Dismiss Button clicked")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }


}

