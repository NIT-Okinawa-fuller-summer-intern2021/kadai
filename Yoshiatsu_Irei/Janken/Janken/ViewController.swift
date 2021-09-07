//
//  ViewController.swift
//  Janken
//
//  Created by Yoshiatsu Irei on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jankenImageView: UIImageView!
    @IBOutlet weak var jankenLabel: UILabel!
    @IBAction func changeJankenButoon(_ sender: Any) {
        // 新しいじゃんけんの結果を一時的に格納する変数を設ける
        var newAnswerNumber = 0

        // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
        // repeat は繰り返しを意味する
        repeat {
            // 0,1,2の数値をランダムに算出（乱数）
            newAnswerNumber = Int.random(in: 0..<4)

        // 前回と同じ結果のときは、再度、ランダムに数値を出す
        // 異なる結果のときは、repeat を抜ける
        } while answerNumber == newAnswerNumber
        
        // 新しいじゃんけんの結果を格納
        answerNumber = newAnswerNumber

        if answerNumber == 0 {
            
            // グー
            jankenLabel.text = "グー"
            jankenImageView.image = UIImage(named: "gu")
            
        } else if answerNumber == 1 {
            
            // チョキ
            jankenLabel.text = "チョキ"
            jankenImageView.image = UIImage(named: "choki")
            
        } else if answerNumber == 2 {
            
            // パー
            jankenLabel.text = "パー"
            jankenImageView.image = UIImage(named: "pa")
            
        }

    }
    
    // じゃんけん（数字）
    var answerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

