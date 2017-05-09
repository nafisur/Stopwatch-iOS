//
//  ViewController.swift
//  StopWatch
//
//  Created by Nafisur Ahmed on 09/05/17.
//  Copyright © 2017 Nafisur Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var timeLabel: UILabel!
   
    @IBOutlet weak var playBtn: UIButton!
    
    var timer = Timer()
    var time = 0
    var buttonState = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBtn.layer.cornerRadius = 15.0
        playBtn.layer.borderWidth = 2.0
        playBtn.layer.borderColor = UIColor.white.cgColor
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func playButtonTapped(_ sender: Any) {
    
        if buttonState {
            playBtn.setTitle("Pause", for: [])
            buttonState = false
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.addToTime), userInfo: nil, repeats: true)
           
        } else{
            playBtn.setTitle("Play", for: [])
            buttonState = true
            
            timer.invalidate()
           
        }
    }
    
    

    @IBAction func resetTapped(_ sender: Any) {
        timeLabel.text = "00"
    }
    
    
    @IBAction func stopTapped(_ sender: Any) {
    
        timer.invalidate()
        time = 0
        timeLabel.text = "00"
        
    }
    
    func addToTime() {
        time  = time + 1
        timeLabel.text = "\(time)"
    }
    
    
}
