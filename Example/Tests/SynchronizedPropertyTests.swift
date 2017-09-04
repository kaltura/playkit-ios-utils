//
//  SynchronizedPropertyTests.swift
//  PlayKitUtils
//
//  Created by Gal Orlanczyk on 04/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import PlayKitUtils

class SynchronizedPropertyTests: QuickSpec {
    
    private enum TestEnum {
        case test1
        case test2
    }
    
    override func spec() {
        describe("SynchronizedProperty Tests") {
            
            context("enum synchronized property") {
                
                var synchronizedProperty: SynchronizedProperty<TestEnum>!
                
                beforeEach {
                    synchronizedProperty = SynchronizedProperty<TestEnum>(initialValue: .test1)
                    synchronizedProperty.onChange(handler: nil)
                }
                
                it("can get value") {
                    expect(synchronizedProperty.value).to(equal(TestEnum.test1))
                }
                
                it("can set value") {
                    synchronizedProperty.value = .test2
                    expect(synchronizedProperty.value).to(equal(TestEnum.test2))
                }
                
                it("can observe changes on value") {
                    synchronizedProperty.value = .test2
                    synchronizedProperty.onChange(handler: { (test) in
                        expect(test).to(equal(TestEnum.test2))
                    })
                }
            }
            
            context("int synchronized property") {
                let initialValue = 0
                var synchronizedProperty: SynchronizedProperty<Int>!
                
                beforeEach {
                    synchronizedProperty = SynchronizedProperty<Int>(initialValue: initialValue)
                    synchronizedProperty.onChange(handler: nil)
                }
                
                it("can get value") {
                    expect(synchronizedProperty.value).to(equal(initialValue))
                }
                
                it("can set value") {
                    let value = 1
                    synchronizedProperty.value = value
                    expect(synchronizedProperty.value).to(equal(value))
                }
                
                it("can observe changes on value") {
                    let value = 2
                    synchronizedProperty.value = value
                    synchronizedProperty.onChange(handler: { (test) in
                        expect(test).to(equal(2))
                    })
                }
            }
        }
    }
}
