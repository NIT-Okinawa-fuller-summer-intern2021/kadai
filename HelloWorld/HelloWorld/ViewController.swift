//
//  ViewController.swift
//  HelloWorld
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hellolabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        hellolabel.text = "Hello Swift!"
    }


}

