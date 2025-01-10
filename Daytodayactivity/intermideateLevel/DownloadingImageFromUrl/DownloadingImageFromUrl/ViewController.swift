//
//  ViewController.swift
//  DownloadingImageFromUrl
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var label2: UILabel!
    @IBOutlet var img2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.UsingTheDataStructureToDownloadImages()
        self.UsingTheUrlSessionApisToDownloadImages()
    }
    
    func UsingTheDataStructureToDownloadImages(){
        
        let url=URL(string: "https://i.imgur.com/OB0y6MR.jpg")!
        DispatchQueue.global().async{
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async{
                    self.img.image=UIImage(data: data)
                }
            }
        }
    }

    func UsingTheUrlSessionApisToDownloadImages(){
        
        let url=URL(string: "https://i.imgur.com/OB0y6MR.jpg")!
        let dataTask = URLSession.shared.dataTask(with: url){ (data, _, _) in
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async{
                    self.img2.image=UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
}

