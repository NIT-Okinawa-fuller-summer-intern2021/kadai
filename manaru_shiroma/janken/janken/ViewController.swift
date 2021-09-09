//
//  ViewController.swift
//  janken
//
//  Created by fuller on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var janken: UIImageView!
    @IBOutlet weak var jankenlabel: UILabel!
    @IBAction func changejankenbutoon(_ sender: Any) {
    
    
    var newAnswerNumber = 0
    
    
        repeat{
        
            newAnswerNumber = Int.random(in: 0..<3)
            
        }while answerNumber == newAnswerNumber
        
        answerNumber=newAnswerNumber
        
        if answerNumber == 0{
            
            jankenlabel.text = "グー"
            janken.image = UIImage(named: "gu")
            
        }else if answerNumber == 1{
            
            jankenlabel.text = "チョキ"
            janken.image = UIImage(named: "choki")
            
            
        }else if answerNumber == 2{
            
            jankenlabel.text = "パー"
            janken.image = UIImage(named: "pa")
            
        }
    
    
    
    }
    
    var answerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

