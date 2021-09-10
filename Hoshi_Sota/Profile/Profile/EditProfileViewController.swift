//
//  EditProfileViewController.swift
//  Profile
//
//  Created by fuller on 2021/09/08.
//

import UIKit

protocol EditprofileViewControllerDelegate: AnyObject{
    func editProfile(name : String,age: String)
}

class EditProfileViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        department = settingArray[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    
    

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var departmentSettingPicker: UIPickerView!
    
    
    @IBAction func endEditButton(_ sender: Any) {
        self.dismiss(animated: true, completion:{
            self.delegate?.editProfile(name: self.nameTextField.text ?? "", age:self.ageTextField.text ?? "" )
        })
        
    }
    
    let settingArray : [String] = ["機械","情報","メディア","生物"]
    let settingKey = "department_value"
    var department: String?
    
    
    weak var delegate: EditprofileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departmentSettingPicker.delegate = self
        departmentSettingPicker.dataSource = self
        
        let settings = UserDefaults.standard
        _ = settings.integer(forKey: settingKey)

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




extension ViewController: EditprofileViewControllerDelegate{
    func editProfile(name: String, age: String) {
        profileLabel.text = name
        ageprofileLabel.text = age
        departmentprofileLabel.text = department
    }
    
}
