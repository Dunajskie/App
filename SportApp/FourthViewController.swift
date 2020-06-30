//
//  FourthViewController.swift
//  SportApp
//
//  Created by Michał Dunajski on 14/02/2020.
//  Copyright © 2020 Michał Dunajski. All rights reserved.
//

import UIKit





class FourthViewController: UIViewController {

    
    
    
    
    
   var timer = Timer()
    var (minutes, seconds, fractions) = (0, 0, 0)
    
    @IBOutlet weak var Time: UILabel!
    
    
    @IBOutlet weak var startOutlet: UIButton!
    
    
    @IBOutlet weak var resetOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOutlet.isHidden = true
        
    }
    
     
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FourthViewController.keepTimer), userInfo: nil, repeats: true)
        startOutlet.isHidden = true
         resetOutlet.isHidden = false
    }
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        startOutlet.isHidden = false
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        (minutes, seconds, fractions) = (0, 0, 0)
        Time.text = "00:00:00"
        startOutlet.isHidden = false
    }
    
    
    @objc func keepTimer() {
        
        fractions += 1
        
        if fractions > 99
        {
            seconds += 1
            fractions = 0
        }
        if seconds > 59
        {
            minutes += 1
            seconds = 0
        }
        
        Time.text = String (format: "%02d:%02d:%02d", minutes, seconds, fractions)
        
    }
    
    
    
    
    
}
