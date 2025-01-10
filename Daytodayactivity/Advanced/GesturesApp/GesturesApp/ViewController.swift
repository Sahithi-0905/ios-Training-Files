//
//  ViewController.swift
//  GesturesApp
//
//  Created by FCI on 02/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //tap gesture
       /* let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
        tap.numberOfTapsRequired = 1
        self.img.addGestureRecognizer(tap)*/
        
        //2.long press
        /*let longPressed: UILongPressGestureRecognizer=UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressed(_:)))
        
        longPressed.minimumPressDuration = 3
        self.img.addGestureRecognizer(longPressed)*/
        
        //3.rotation
        /*let rotation:UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotation(_:)))
        self.img.addGestureRecognizer(rotation)*/
        
        //4.pinch gesture
       /* let pinch: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:)))
        self.img.addGestureRecognizer(pinch)*/
        
        //5.pan gesture
        
        /*let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        self.img.addGestureRecognizer(pan)*/
        
        //6.swipe
        let rightSwipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipe.direction = .right //swipe right
        self.img.addGestureRecognizer(rightSwipe)
        
        let leftSwipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipe.direction = .left //swipe right
        self.img.addGestureRecognizer(leftSwipe)
        
        let upSwipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        upSwipe.direction = .up //swipe right
        self.img.addGestureRecognizer(upSwipe)
        
        let downSwipe : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        downSwipe.direction = .down //swipe right
        self.img.addGestureRecognizer(downSwipe)
        
    }
    
    /*@objc func handleTap(_ sender: UITapGestureRecognizer? = nil){
        
        self.view.backgroundColor = .yellow
    }*/
    
   /* @objc func handleLongPressed(_ sender : UILongPressGestureRecognizer? = nil){
        print("long")
        self.view.backgroundColor = .yellow
    }*/

    /*@objc func handleRotation(_ sender : UIRotationGestureRecognizer? = nil){
        
        sender?.view?.transform = (sender?.view?.transform.rotated(by: sender!.rotation))!
        
        sender!.rotation = 0
        
        printContent(sender?.view?.transform)
        
        
    }*/
    
    /*@objc func handlePinch(_ sender: UIPinchGestureRecognizer? = nil){
        sender?.view?.transform = (sender?.view?.transform.scaledBy(x: sender!.scale, y: sender!.scale))!
        sender?.scale = 1.0
    }*/
    
    /*@objc func handlePan(_ sender: UIPanGestureRecognizer? = nil){
        print("pan detected")
        let translation = sender?.translation(in: self.view)
        sender?.view!.center = CGPoint(x: (sender?.view!.center.x)! + translation!.x, y: (sender?.view!.center.y)! + translation!.y)
        
        sender?.setTranslation(CGPoint.zero, in: self.view)
        
    }*/
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer){
        
        switch sender.direction{
        case.right:
            self.view.backgroundColor = .red
        case.left:
            self.view.backgroundColor = .green
        case.up:
            self.view.backgroundColor = .blue
        case.down:
            self.view.backgroundColor = .brown
        default:
            break
        }
    
    }

}

