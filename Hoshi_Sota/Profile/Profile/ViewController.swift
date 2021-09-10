//
//  ViewController.swift
//  Profile
//
//  Created by fuller on 2021/09/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageprofileLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var departmentprofileLabel: UILabel!
    
    @IBAction func editButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "EditProfileViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as!EditProfileViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    let settingKey = "department_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey : 10])
        
        // Do any additional setup after loading the view.
    }
    
    func displayUpdate() -> Int {
        
        let settings = UserDefaults.standard

        let departmentValue = settings.integer(forKey: settingKey)
        let remainCount = departmentValue
        
        departmentprofileLabel.text = settingKey
        
        return remainCount
        
    }


}

