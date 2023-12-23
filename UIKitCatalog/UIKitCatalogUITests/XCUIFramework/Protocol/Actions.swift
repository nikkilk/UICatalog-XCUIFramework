//
//  Actions.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 15/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


protocol Actions: UITestBase {
    func takeScreenshot()
    func backgroundApp(durationInSeconds duration: Double)
}


extension Actions {
    
    /// <#Description#>
    func takeScreenshot() {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
    }
    
    
    /// <#Description#>
    /// - Parameter duration: <#duration description#>
    func backgroundApp(durationInSeconds duration: Double) {
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        sleep(UInt32(duration))
        app.activate()
    }
    
    
    /// <#Description#>
    /// - Parameter bundleIdentifier: <#bundleIdentifier description#>
    func openApp(bundleIdentifier: String) {
        if let appURL = URL(string: "\(bundleIdentifier)://"), UIApplication.shared.canOpenURL(appURL)
        {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            print("App with bundle identifier \(bundleIdentifier) not installed or not supported")
        }
    }
    
    
}
