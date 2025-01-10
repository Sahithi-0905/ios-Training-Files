//
//  ViewController.swift
//  AccessingPhotoLibraryAndCamera
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet var img: UIImageView!
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    
    var photoLibraryImagepicker1: UIImagePickerController!
    var cameraImagepicker2: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func b1click(){
        // open to photo library
        
        photoLibraryImagepicker1 = UIImagePickerController()
        photoLibraryImagepicker1.sourceType = .photoLibrary
        photoLibraryImagepicker1.delegate = self
        photoLibraryImagepicker1.allowsEditing = true
    }
    @IBAction func b2click(){
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            
            cameraImagepicker2 = UIImagePickerController()
            cameraImagepicker2.delegate = self
            cameraImagepicker2.sourceType = .camera
            cameraImagepicker2.cameraDevice = .rear
            cameraImagepicker2.allowsEditing = true
            
            self.present(cameraImagepicker2, animated: true)
        }
        
        else{
            
        }
        
    }
    @IBAction func b3click(){
        
        UIImageWriteToSavedPhotosAlbum(img.image!, self, #selector(image(_: didFinishSavingWithErors:contextInfo:)), nil)
        
    }
    
    @objc func image(_ image: UIImage,didFinishSavingWithErors error: Error?, contextInfo: UnsafeRawPointer){
        
        if let error = error{
            let ac=UIAlertController(title: "Save Error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(ac, animated: true)
        }
        
        else{
            let ac=UIAlertController(title: "Saved", message: "image Saved", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
            present(ac, animated: true)
        }
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if picker == photoLibraryImagepicker1{
            let image1 = info[.editedImage] as! UIImage
            img.image = image1
            self.dismiss(animated: true,completion: nil)
                       
        }
        else{
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if picker == photoLibraryImagepicker1{
            
            self.dismiss(animated: true)
        }
        else{
            
        }
    }

}

