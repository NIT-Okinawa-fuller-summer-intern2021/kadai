//
//  ViewController.swift
//  janken
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jankenimage: UIImageView!
    @IBOutlet weak var jankenLabel: UILabel!
    
    @IBAction func changejankenbutoon(_ sender: Any) {
    
    
        var newAnswerNumber = 0
        
        repeat {
    
            newAnswerNumber = Int.random(in:0..<4)
    
        } while answerNumber == newAnswerNumber
    
        answerNumber = newAnswerNumber
    
        if answerNumber == 0 {
            jankenLabel.text = "グー"
            jankenimage.image = UIImage(named:"gu")
    
        } else if answerNumber == 1 {
            jankenLabel.text = "チョキ"
            jankenimage.image = UIImage(named:"choki")
    
        } else if answerNumber == 2 {
            jankenLabel.text = "パー"
            jankenimage.image = UIImage(named:"pa")
    
        }else {
            
            jankenLabel.text = "ハズレ"
            jankenimage.image = nil
            
        }
    }
    var answerNumber = 0 //じゃんけん（数字
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

