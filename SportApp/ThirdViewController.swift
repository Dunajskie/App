//
//  ThirdViewController.swift
//  SportApp
//
//  Created by Michał Dunajski on 14/02/2020.
//  Copyright © 2020 Michał Dunajski. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var intervals: [Int] = []
    var i = 0
    var timer = Timer()
    var fractions = 1
    var secondsVar = 0
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var seconds: UILabel!
    
    @IBOutlet weak var intervalsLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timeLabel.text = String(format: "%02d:%02d", secondsVar, fractions)
          
         progress.transform = progress.transform.scaledBy(x: 1, y: 5)
    }
    

    @IBAction func stepper(_ sender: Any) {
        seconds.text = String(stepperOutlet.value)
    }
    

    @IBAction func addButton(_ sender: Any) {
        intervals.append(Int(stepperOutlet!.value))
        intervalsLabel.text = intervalsLabel.text! + " " + String(intervals[i])
        i += 1
        
        secondsVar = intervals.last!

    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func startButton(_ sender: Any) {
        
             timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func countdown(){
           fractions -= 1
           if fractions < 1
                  {
                      secondsVar -= 1
                      fractions = 100
                  }
           
        
        
       }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        
        if i != 0
        {
            intervals.removeLast()
            i -= 1
            if i == 0
            {
                intervalsLabel.text = ""
                i = 0
            }
            else
            {
            intervalsLabel.text = ""
            for x in 0...i-1
            {
                intervalsLabel.text = intervalsLabel.text! + " " + String(intervals[x])
            }
            }
        }
        
    }
    
}
