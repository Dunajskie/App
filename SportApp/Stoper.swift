//
//  Stoper.swift
//  SportApp
//
//  Created by Michał Dunajski on 16/02/2020.
//  Copyright © 2020 Michał Dunajski. All rights reserved.
//

import Foundation

class Stoperkurwa
{
    private var startTime:NSDate?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime{
            return -startTime.timeIntervalSinceNow
        }
        else
        {
            return 0
        }
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start(){
        startTime = NSDate()
    }
    func stop(){
           startTime = nil
    }
    
       
    
}
