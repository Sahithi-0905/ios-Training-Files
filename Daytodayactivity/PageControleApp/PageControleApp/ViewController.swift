//
//  ViewController.swift
//  PageControleApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pageControle: UIPageControl!
    
    var pageControler2: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayPageControle()
    }
    
    @IBAction func pc1click(){
        
        let index:Int = pageControle.currentPage
        
        if index == 0{
            self.view.backgroundColor = .cyan
        }
        
        else if index == 1{
            self.view.backgroundColor = .orange
        }
        else if index == 2{
            self.view.backgroundColor = .white
        }
        else{
            self.view.backgroundColor = .black
        }
    }
    
    func displayPageControle(){
        
        pageControler2 = UIPageControl()
        pageControler2.frame = CGRect(x: 50, y: 500, width: 200, height: 30)
        pageControler2.backgroundColor = .cyan
        pageControler2.numberOfPages = 4
        pageControler2.currentPage = 0
        pageControler2.currentPageIndicatorTintColor = .red
        pageControler2.pageIndicatorTintColor = .black
        
        pageControler2.addTarget(self, action: #selector(disslayPc2), for: .valueChanged)
        
        self.view.addSubview(pageControler2)
        
    }
    
    @objc func disslayPc2(){
        let index:Int = pageControler2.currentPage
        
        if index == 0{
            self.view.backgroundColor = .cyan
        }
        
        else if index == 1{
            self.view.backgroundColor = .blue
        }
        else if index == 2{
            self.view.backgroundColor = .yellow
        }
        else{
            self.view.backgroundColor = .purple
        }
    }
    
    

}

