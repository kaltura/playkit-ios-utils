//
//  TimerExtensionTests.swift
//  PlayKitUtils
//
//  Created by Gal Orlanczyk on 04/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import PlayKitUtils

class TimerExtensionTests: QuickSpec {
    override func spec() {
        describe("TimerExtension Tests") {
            var timer: Timer?
            
            afterEach {
                timer?.invalidate()
                timer = nil
            }
            
            it("can start an invocation after a certain time") {
                var value = 0
                timer = Timer.after(0.5) { (timer) in
                    value += 1
                    print("current value: \(value)")
                }
                expect(value).toEventually(equal(1))
            }
            
            it("can start a repeating timer with interval") {
                var value = 0
                timer = Timer.every(0.2) { (timer) in
                    value += 1
                    print("current value: \(value)")
                }
                // timeout is 1 then we will able to increase the value 4 times.
                expect(value).toEventually(equal(4), timeout: 1)
            }
        }
    }
}
