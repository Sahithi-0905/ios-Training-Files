//
//  ViewController.swift
//  Task7sharingApp
//
//  Created by FCI on 30/11/24.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var add:UIButton!
    @IBOutlet var share: UIButton!
    @IBOutlet var anyTxt: UITextField!
    @IBOutlet var url: UITextField!
    @IBOutlet var img: UIImageView!
    
   
    var textFieldLayer: CALayer!
    var imageViewLayer: CALayer!
    var buttonLayer: CALayer!

    var PhotoLibraryImagePicker1: UIImagePickerController!
    var cameraImagePicker2: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.'
        
    }
    
    @IBAction func displayAddBtn(){
        let alert = UIAlertController(title: "Select Any Option", message: "Please Select Any Option To Upload A Image", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler:{ (_) in
            print("Photo library Button Clicked")
            
            //var PhotoLibraryImagePicker1: UIImagePickerController!
            
            self.PhotoLibraryImagePicker1 = UIImagePickerController()
            self.PhotoLibraryImagePicker1.sourceType = .photoLibrary
            self.PhotoLibraryImagePicker1.delegate = self
            self.PhotoLibraryImagePicker1.allowsEditing = false
            
            self.present(self.PhotoLibraryImagePicker1, animated: true)
            
        }))
       
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler:{ (_) in
            print("camera Button Clicked")
            
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
            {
                self.cameraImagePicker2 = UIImagePickerController()
                self.cameraImagePicker2.delegate = self
                self.cameraImagePicker2.sourceType = .camera
                self.cameraImagePicker2.cameraDevice = .rear
                self.cameraImagePicker2.allowsEditing = true
                
                self.present(self.cameraImagePicker2, animated: true)
                
            }
            
            else {
                
                print("camera not found in Simulator")
                
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:{ (_) in
            print("Cancel Button clicked")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == PhotoLibraryImagePicker1 {
            
            print("selected Image Details: \(info)")
            
            let image1 = info [.originalImage] as! UIImage
            
            img.image = image1
            
            self.dismiss(animated: true, completion: nil)
            
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            if picker == PhotoLibraryImagePicker1 {
                
                self.dismiss(animated: true)
            }
            else {
                self.dismiss(animated: true)
                
            }
    }
    
    @IBAction func displayShare(){
        
        
        let text = anyTxt.text
        let image = img.image
        let myWebsite = URL(string: url.text!)
        
        let shareAll = [text as Any, image as Any, myWebsite!] as [Any]
        
        print(shareAll)
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
           
        self.present(activityViewController, animated: true)
    }


}

