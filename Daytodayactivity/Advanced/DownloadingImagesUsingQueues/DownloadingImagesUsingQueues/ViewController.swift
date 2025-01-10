//
//  ViewController.swift
//  DownloadingImagesUsingQueues
//
//  Created by FCI on 04/12/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var img1:UIImageView!
    @IBOutlet var img2:UIImageView!
    @IBOutlet var img3:UIImageView!
    
    @IBOutlet var activityIndicatorView0:UIActivityIndicatorView!
    @IBOutlet var activityIndicatorView1:UIActivityIndicatorView!
    @IBOutlet var activityIndicatorView2:UIActivityIndicatorView!
    
    @IBOutlet var serialBtn:UIButton!
    @IBOutlet var concurentBtn:UIButton!
    
    private let serialDispatchQueue = DispatchQueue(label: "serial-dispatch-queue")
    private let concurrentDispatchQueue = DispatchQueue(label: "concurrent-dispatch-queue",attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions

    @IBAction func downloadSerial(_ sender: Any) {
        download(using: serialDispatchQueue)
    }
       
    @IBAction func downloadConcurrent(_ sender: Any) {
        download(using: concurrentDispatchQueue)
    }
    // MARK: - Helper Methods
        
        private func download(using dispatchQueue: DispatchQueue) {
            // Reset Image Views
            img1.image = nil
            img2.image = nil
            img3.image = nil
            
            // Define URLs
            let url0 = URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-0.jpg")
            let url1 = URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-1.jpg")
            let url2 = URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-2.jpg")
            
            // Show Activity Indicator Views
            activityIndicatorView0.startAnimating()
            activityIndicatorView1.startAnimating()
            activityIndicatorView2.startAnimating()
            
            dispatchQueue.async { [weak self] in
                guard let url = url0 else { return }//getting the image from url
                guard let data = try? Data(contentsOf: url) else { return }//getting the image in form of bytes
                
                let image = UIImage(data: data)//transforming bytes into image
                
                DispatchQueue.main.async {
                    self?.img1.image = image//displaying image to uiimage
                    self?.activityIndicatorView0.stopAnimating()
                }
            }
            
            dispatchQueue.async { [weak self] in
                guard let url = url1 else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self?.img2.image = image
                    self?.activityIndicatorView1.stopAnimating()
                }
            }
            
            dispatchQueue.async { [weak self] in
                guard let url = url2 else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self?.img3.image = image
                    self?.activityIndicatorView2.stopAnimating()
                }
            }
        }


}

