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
    func waitUntilElementToExist(element: XCUIElement, timeout: Double)
    func waitUntilElementToNotExist(element: XCUIElement, timeout: Double)
}


extension Wait {
    
    /// Waits for the given XCUIElement to appear using XCTest's expectation
    /// - Parameters:
    ///   - element: The XCUIElement to monitor for appearance
    ///   - timeout: The maximum time in seconds to wait for the element to appear
    func waitUntilElementToExist(element: XCUIElement, timeout: Double) {
        expectation(for: NSPredicate(format: "exists==true"), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
    
    /// Waits for the given XCUIElement to disappear using XCTest's expectation
    /// - Parameters:
    ///   - element: The XCUIElement to monitor for disappearance
    ///   - timeout: The maximum time in seconds to wait for the element to disappear
    func waitUntilElementToNotExist(element: XCUIElement, timeout: Double) {
        expectation(for: NSPredicate(format: "exists==false"), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
}
