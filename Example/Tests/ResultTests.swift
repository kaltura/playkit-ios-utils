//
//  ResultTests.swift
//  PlayKitUtils
//
//  Created by Gal Orlanczyk on 04/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import PlayKitUtils

class ResultTests: QuickSpec {
    
    private enum TestErrorEnum: Error {
        case invalid
    }
    
    override func spec() {
        describe("Result Tests") {
            
            it("can have a result with success and failure") {
                let number = 100
                var result: Result<Int> = .success(number)
                if case let Result.success(value) = result {
                    expect(value).to(equal(number))
                } else {
                    fail("shouldn't get here")
                }
                result = .failure(TestErrorEnum.invalid)
                if case let Result.failure(error) = result {
                    expect(error as? TestErrorEnum).to(equal(TestErrorEnum.invalid))
                } else {
                    fail("shouldn't get here")
                }
            }
            
            it("can transform results from one type to another") {
                let result: Result<Int> = .success(100)
                let transformedResult: Result<Int64> = result.map { Int64($0) }
                if case let Result.success(value) = transformedResult {
                    expect(value).to(equal(Int64(100)))
                }
            }
        }
    }
}
