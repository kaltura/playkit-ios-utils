//
//  PKUtils.swift
//  PlayKitUtils
//
//  Created by Nilit Danan on 7/21/20.
//

import Foundation

public class PKUtils {
    
    public static var referrer: String {
        var referrer: String = "app://"
        if let appId = Bundle.main.bundleIdentifier {
            referrer += appId
        } else {
            NSLog("The app's bundle identifier is not set")
            referrer += "bundleIdentifier_is_empty"
        }
        return referrer
    }
}
