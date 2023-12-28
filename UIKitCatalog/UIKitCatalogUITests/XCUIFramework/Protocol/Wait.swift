//
//  Wait.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 15/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest

protocol Wait: UITestBase {
    /// Waits for the given XCUIElement to appear using XCTest's expectation.
    /// - Parameters:
    ///   - element: The XCUIElement to monitor for appearance.
    ///   - timeout: The maximum time in seconds to wait for the element to appear. Defaults to `ConstantUtils.implicitWait`.
    func waitUntilElementToExist(element: XCUIElement, timeout: Double)

    /// Waits for the given XCUIElement to disappear using XCTest's expectation.
    /// - Parameters:
    ///   - element: The XCUIElement to monitor for disappearance.
    ///   - timeout: The maximum time in seconds to wait for the element to disappear. Defaults to `ConstantUtils.implicitWait`.
    func waitUntilElementToNotExist(element: XCUIElement, timeout: Double)
}

extension Wait {
    func waitUntilElementToExist(element: XCUIElement, timeout: Double = ConstantUtils.implicitWait) {
        let expectation = self.expectation(for: NSPredicate(format: "exists==true"), evaluatedWith: element, handler: nil)
        
        // Handle timeout errors
        XCTWaiter().wait(for: [expectation], timeout: timeout)
    }

    func waitUntilElementToNotExist(element: XCUIElement, timeout: Double = ConstantUtils.implicitWait) {
        let expectation = self.expectation(for: NSPredicate(format: "exists==false"), evaluatedWith: element, handler: nil)
        
        // Handle timeout errors
        XCTWaiter().wait(for: [expectation], timeout: timeout)
    }
}

