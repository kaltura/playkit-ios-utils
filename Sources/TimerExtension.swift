//
//  TimerExtension.swift
//  Pods
//
//  Created by Gal Orlanczyk on 04/09/2017.
//
//

import Foundation

public extension Timer {
    
    /// Create a timer that will call `block` after interval once.
    class func after(_ interval: TimeInterval, _ block: @escaping (Timer) -> Void) -> Timer {
        if #available(iOS 10, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: block)
            return timer
        } else {
            let fireDate: CFAbsoluteTime = CFAbsoluteTimeGetCurrent() + interval
            var timer: Timer!
            timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0) { _ in
                block(timer)
            }
            timer.start()
            return timer
        }
    }
    
    /// Create a timer that will call `block` every interval.
    class func every(_ interval: TimeInterval, _ block: @escaping (Timer) -> Void) -> Timer {
        if #available(iOS 10, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: block)
            return timer
        } else {
            let fireDate: CFAbsoluteTime = CFAbsoluteTimeGetCurrent() + interval
            var timer: Timer!
            timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0) { _ in
                block(timer)
            }
            timer.start()
            return timer
        }
    }
    
    /// starts the timer on the selected RunLoop (default is `.current`) with the provided modes.
    func start(runLoop: RunLoop = .main, modes: RunLoopMode...) {
        let modes = modes.isEmpty ? [.defaultRunLoopMode] : modes
        
        for mode in modes {
            runLoop.add(self, forMode: mode)
        }
    }
}
