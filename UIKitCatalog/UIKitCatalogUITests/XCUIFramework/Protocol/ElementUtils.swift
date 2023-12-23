//
//  ElementUtils.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 07/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


protocol ElementUtils: UITestBase {
    func tapOnElement(element: XCUIElement)
    func tapOnElementIfExists(element: XCUIElement)
    func isElementPresent(element: XCUIElement)
    func sendText(element: XCUIElement, text: String)
    func swipeDownUntilElementVisible(element: XCUIElement)
    func swipeUPUntilElementVisible(element: XCUIElement)
}


extension ElementUtils {
    
    // MARK: - Tap
    
    /// <#Description#>
    /// - Parameter element: <#element description#>
    func tapOnElement(element: XCUIElement) {
        let elementExists = element.waitForExistence(timeout: ConstantUtils.implicitWait)
        if element.exists {
            element.tap()
        } else {
            XCTAssertTrue(elementExists, "\(element) not found")
        }
    }
    
    
    /// <#Description#>
    /// - Parameter element: <#element description#>
    func tapOnElementIfExists(element: XCUIElement) {
        let elementExists = element.waitForExistence(timeout: ConstantUtils.implicitWait)
        if elementExists {
            element.tap()
        }
    }
    
    
    // MARK: - Element
    
    /// <#Description#>
    /// - Parameter element: <#element description#>
    /// - Returns: <#description#>
    func isElementPresent(element: XCUIElement)-> Bool {
        if element.waitForExistence(timeout: ConstantUtils.implicitWait) {
            return true
        } else {
            return false
        }
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - element: <#element description#>
    ///   - text: <#text description#>
    func sendText(element: XCUIElement, text: String) {
        tapOnElement(element: element)
        element.typeText(text)
    }
    
    
    // MARK: - Swipe
    
    /// Simulates a continuous downward swipe until a specified XCUIElement becomes visible
    /// - Parameter element: The XCUIElement to monitor for visibility during the swipe
    func swipeDownUntilElementVisible(element: XCUIElement) {
        while !element.exists {
            app.swipeUp()
        }
    }
    
    
    /// Simulates a continuous upward swipe until a specified XCUIElement becomes visible
    /// - Parameter element: The XCUIElement to monitor for visibility during the swipe
    func swipeUPUntilElementVisible(element: XCUIElement) {
        while !element.exists {
            app.swipeDown()
        }
    }
}
