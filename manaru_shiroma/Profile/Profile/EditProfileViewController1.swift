//
//  EditProfileViewController1.swift
//  Profile
//
//  Created by fuller on 2021/09/08.
//

import UIKit

protocol EditProfileViewController1Delegate: AnyObject{
    func editProfile(name: String)
}

class EditProfileViewController1: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    

    @IBAction func endEditButton(_ sender: Any) {
        self.dismiss (animated: true, completion: {
        self.delegate?.editProfile(name: self.nameTextField.text ?? "")
    })
    
    }
    
    
    
    weak var delegate: EditProfileViewController1Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

}
