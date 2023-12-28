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
    /// Takes a screenshot of the current screen.
    func takeScreenshot()
    
    /// Puts the app in the background for a specified duration.
    /// - Parameter duration: The duration (in seconds) for which the app should be in the background.
    func backgroundApp(durationInSeconds duration: Double)
    
    /// Opens the app with the specified bundle identifier.
    /// - Parameter bundleIdentifier: The bundle identifier of the app to be opened.
    func openApp(bundleIdentifier: String)
}

extension Actions {
    func takeScreenshot() {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
    }
    
    func backgroundApp(durationInSeconds duration: Double) {
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        sleep(UInt32(duration))
        app.activate()
    }
    
    func openApp(bundleIdentifier: String) {
        guard let appURL = URL(string: "\(bundleIdentifier)://") else {
            print("Invalid bundle identifier: \(bundleIdentifier)")
            return
        }

        guard UIApplication.shared.canOpenURL(appURL) else {
            print("App with bundle identifier \(bundleIdentifier) not installed or not supported")
            return
        }

        UIApplication.shared.open(appURL, options: [:]) { success in
            if !success {
                print("Failed to open app with bundle identifier: \(bundleIdentifier)")
            }
        }
    }
}

