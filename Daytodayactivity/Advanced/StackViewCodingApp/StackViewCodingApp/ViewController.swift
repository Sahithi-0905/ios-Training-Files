//
//  ViewController.swift
//  StackViewCodingApp
//
//  Created by FCI on 02/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.displayStackView()
    }
    
    func displayStackView(){
        
        //image view
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        imageView.image = UIImage(systemName: "pencil.circle")
        
        //text label
        let textlabel = UILabel()
        textlabel.backgroundColor = UIColor.yellow
        textlabel.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
        textlabel.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        textlabel.text = "Hi"
        textlabel.textAlignment = .center
        
        //stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 16.0
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textlabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        //constraiints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        
        
    }


}

