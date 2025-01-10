//
//  ViewController.swift
//  PlayVideo
//
//  Created by FCI on 28/11/24.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func b1click(){
        
        let videoUrl  = URL(string:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        
        let player = AVPlayer(url: videoUrl!)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.present(playerViewController, animated: true)
        playerViewController.player!.play()
    }


}

