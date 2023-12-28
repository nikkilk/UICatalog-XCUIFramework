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
    /// Taps on the specified XCUIElement.
    /// - Parameters:
    ///   - element: The XCUIElement to tap.
    func tapOnElement(element: XCUIElement)

    /// Taps on the specified XCUIElement if it exists.
    /// - Parameters:
    ///   - element: The XCUIElement to tap.
    func tapOnElementIfExists(element: XCUIElement)

    /// Checks if the specified XCUIElement is present.
    /// - Parameters:
    ///   - element: The XCUIElement to check for existence.
    /// - Returns: True if the element is present, otherwise false.
    func isElementPresent(element: XCUIElement) -> Bool

    /// Sends text to the specified XCUIElement.
    /// - Parameters:
    ///   - element: The XCUIElement to send text to.
    ///   - text: The text to be sent.
    func sendText(element: XCUIElement, text: String)

    /// Simulates a continuous downward swipe until the specified XCUIElement becomes visible.
    /// - Parameters:
    ///   - element: The XCUIElement to monitor for visibility during the swipe.
    func swipeDownUntilElementVisible(element: XCUIElement)

    /// Simulates a continuous upward swipe until the specified XCUIElement becomes visible.
    /// - Parameters:
    ///   - element: The XCUIElement to monitor for visibility during the swipe.
    func swipeUpUntilElementVisible(element: XCUIElement)
}

extension ElementUtils {
    func tapOnElement(element: XCUIElement) {
        let elementExists = element.waitForExistence(timeout: ConstantUtils.implicitWait)
        XCTAssertTrue(elementExists, "Element \(element) not found")
        element.tap()
    }

    func tapOnElementIfExists(element: XCUIElement) {
        if element.waitForExistence(timeout: ConstantUtils.implicitWait) {
            element.tap()
        }
    }

    func isElementPresent(element: XCUIElement) -> Bool {
        return element.waitForExistence(timeout: ConstantUtils.implicitWait)
    }

    func sendText(element: XCUIElement, text: String) {
        tapOnElement(element: element)
        element.typeText(text)
    }

    func swipeDownUntilElementVisible(element: XCUIElement) {
        while !element.exists {
            app.swipeDown()
        }
    }

    func swipeUpUntilElementVisible(element: XCUIElement) {
        while !element.exists {
            app.swipeUp()
        }
    }
}

