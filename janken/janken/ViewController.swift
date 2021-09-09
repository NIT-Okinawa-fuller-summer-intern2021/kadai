//
//  ViewController.swift
//  janken
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jankenImageView: UIImageView!
    @IBOutlet weak var jankenLabel: UILabel!
    @IBAction func changeJankenButton(_ sender: Any) {
        
        var newAnswerNumber = 0
        repeat{
            newAnswerNumber = Int.random(in: 0..<4)
            
        }while answerNumber == newAnswerNumber
        
        answerNumber = newAnswerNumber
        
        if answerNumber == 0{
            jankenLabel.text = "グー"
            jankenImageView.image = UIImage(named:"gu")
        
        }else if answerNumber == 1{
            jankenLabel.text = "チョキ"
            jankenImageView.image = UIImage(named:"choki")
        
        }else if answerNumber == 2{
            jankenLabel.text = "パー"
            jankenImageView.image = UIImage(named:"pa")
        
        }else {
            jankenLabel.text = "ハズれ"
            jankenImageView.image = nil
            
        }
    }
    var answerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

