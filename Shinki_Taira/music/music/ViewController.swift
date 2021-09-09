//
//  ViewController.swift
//  music
//
//  Created by fuller on 2021/09/08.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    var cymbalPlayer = AVAudioPlayer()
    
    
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    var guitarPlayer = AVAudioPlayer()
    
    
    let backMusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    var backMusicPlayer = AVAudioPlayer()
    
    
    
    @IBAction func cymbalButton(_ sender: Any) {
//        do {
//            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath)
//            cymbalPlayer.play()
            
//        } catch {
//            print("シンバルのエラー")
//        }
        
        soundPlayer(player: &cymbalPlayer, path: cymbalPath)
    
    }
    
    @IBAction func guitarButton(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath)
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        soundPlayer(player: &backMusicPlayer, path: backMusicPath, count: -1)
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        backMusicPlayer.stop()
        
    }
    
    
    
    func soundPlayer(player: inout AVAudioPlayer, path: URL, count: Int = 0) {
        do {
            player = try AVAudioPlayer(contentsOf: path)
            player.numberOfLoops = count
            player.play()
        } catch {
            print ("再生エラー")
        }
    }
    
}

