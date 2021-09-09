//
//  ViewController.swift
//  Janken
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var JanlenLabel: UILabel!
    @IBOutlet weak var JankenImageView: UIImageView!
    @IBAction func ChangeJankenButton(_ sender: Any) {
    
        var newAnswerNumber = 0
    
    repeat {
    
        newAnswerNumber = Int.random(in: 0..<4)
    
    }while answerNumber == newAnswerNumber
    
    answerNumber = newAnswerNumber

    if answerNumber == 0{
        JanlenLabel.text = "グー"
        JankenImageView.image = UIImage(named:"gu")
    
    }else if answerNumber == 1{
        
        JanlenLabel.text = "チョキ"
        JankenImageView.image = UIImage(named:"choki")
    
    }else if answerNumber == 2{
        JanlenLabel.text = "パー"
        JankenImageView.image = UIImage(named:"pa")
    
    }else{
        JanlenLabel.text = "ハズレ"
        JankenImageView.image = nil
    }
  }
    
    var answerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

