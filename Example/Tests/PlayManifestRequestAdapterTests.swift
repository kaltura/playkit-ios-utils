//
//  PlayManifestRequestAdapterTests.swift
//  PlayKitUtils
//
//  Created by Gal Orlanczyk on 17/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import PlayKitUtils
import Foundation

class PlayManifestRequestAdapterTests: QuickSpec {
    
    override func spec() {
        describe("PlayManifestRequestAdapter Tests") {
            
            it("can adapt a url") {
                let url = URL(string: "http://cdnapi.kaltura.com/playManifest/applehttp/protocol/http/a.m3u8")!
                let requestAdapter = PlayManifestRequestAdapter(url: url, sessionId: "sessionId", clientTag: "clientTag", referrer: "referrer", playbackType: "playbackType")
                let adaptedUrl = requestAdapter.adapt()
                guard let urlComponents = URLComponents(url: adaptedUrl, resolvingAgainstBaseURL: false) else {
                    fail()
                    return
                }
                expect(urlComponents.queryItems?.contains(where: { $0.value == "sessionId" })).to(equal(true))
                expect(urlComponents.queryItems?.contains(where: { $0.value == "clientTag" })).to(equal(true))
                expect(urlComponents.queryItems?.contains(where: { $0.value == "referrer" })).to(equal(true))
                expect(urlComponents.queryItems?.contains(where: { $0.value == "playbackType" })).to(equal(true))
            }
            
            it("can not adapt a url without '/playManifest/'") {
                let url = URL(string: "http://cdnapi.kaltura.com/applehttp/protocol/http/a.m3u8")!
                let requestAdapter = PlayManifestRequestAdapter(url: url, sessionId: "sessionId", clientTag: "clientTag", referrer: "referrer", playbackType: "playbackType")
                let adaptedUrl = requestAdapter.adapt()
                expect(URLComponents(url: adaptedUrl, resolvingAgainstBaseURL: false)?.queryItems).to(beNil())
            }
        }
    }
}
