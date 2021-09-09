//
//  ViewController.swift
//  Profile
//
//  Created by fuller on 2021/09/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    @IBAction func editButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "EditProfileViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as!EditProfileViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

