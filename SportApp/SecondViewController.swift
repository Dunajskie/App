//
//  SecondViewController.swift
//  SportApp
//
//  Created by Michał Dunajski on 14/02/2020.
//  Copyright © 2020 Michał Dunajski. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seconds = Int(pickerData[row])
        firstSeconds = Int(pickerData[row])
        startoutlet.isHidden = false
    }
    
    
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    @IBOutlet weak var startoutlet: UIButton!
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var seconds: Int?
    var fractions = 100
    var pickerData: [String] = []
    var firstSeconds: Int?
    let progressPercent = Progress(totalUnitCount: 10)
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
    
        progress.transform = progress.transform.scaledBy(x: 1, y: 5)
        
        
            for j in 1...59{
                pickerData.append(String(j))
        }
        
        
    }
    
   
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
       // Number of columns of data
    
    
    
    @IBAction func starttimer(_ sender: Any) {
        
        progressPercent.completedUnitCount = 0
        
        
        
        
        seconds! -= 1
        startoutlet.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        picker.isHidden = true
        
       
        self.progress.setProgress(Float(self.progressPercent.fractionCompleted), animated: true)
        
    }
    
    @IBAction func stoptimer(_ sender: Any) {
        timer.invalidate()
        startoutlet.isHidden = false
    }
    
    @objc func countdown(){
        fractions -= 1
        
        self.progressPercent.completedUnitCount += 1
        if fractions < 1
        {
            seconds! -= 1
            fractions = 100
        }
        if timeLabel.text == "00:01"
        {
            timer.invalidate()
            timeLabel.text = "End of time"
            picker.isHidden = false
            startoutlet.isHidden = false
        }
        if (seconds! >= 0) && (fractions >= 0)
        {
        timeLabel.text = String (format: "%02d:%02d", seconds!, fractions)
        }
    }
    
    
    
    
    
}



