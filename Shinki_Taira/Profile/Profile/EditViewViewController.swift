//
//  EditViewViewController.swift
//  Profile
//
//  Created by fuller on 2021/09/08.
//

import UIKit

protocol EditProfileViewControllerDelegate: AnyObject {
    func editProfile(name: String)
    
}

class EditViewViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func endEditButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.delegate?.editProfile(name:
                self.nameTextField.text ?? "")
        })
    }
    
    weak var delegate: EditProfileViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
