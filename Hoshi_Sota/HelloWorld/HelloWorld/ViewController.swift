//
//  ViewController.swift
//  HelloWorld
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var HelloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HelloLabel.text = "Hello Swift"
        HelloLabel.textColor = .blue
        // Do any additional setup after loading the view.
    }

}

