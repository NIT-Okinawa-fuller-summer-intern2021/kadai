//
//  ViewController.swift
//  HelloWorld
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        helloLabel.text = "Hello Swift!"
        helloLabel.tintColor = .blue
    }


}

