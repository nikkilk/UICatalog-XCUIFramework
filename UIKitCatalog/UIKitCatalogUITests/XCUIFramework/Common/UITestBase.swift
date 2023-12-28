//
//  UITestBase.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 07/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest

/// Base class for UI tests providing common setup and teardown methods.
class UITestBase: XCTestCase {
    
    /// The application under test.
    let app = XCUIApplication()
    
    /// Sets up the test environment before each test method is invoked.
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // In UI tests, stop immediately when a failure occurs.
        continueAfterFailure = false
        
        try configureAppForUITesting()
        try setupTestSuite()
        
        // Launch the app
        app.launch()
    }
    
    /// Tears down the test environment after each test method is invoked.
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Terminate the app
        app.terminate()
    }
    
    /// Configures the app for UI testing by adding launch arguments.
    private func configureAppForUITesting() throws {
        // Let app delegate know that we're UI testing
        app.launchArguments += ["UI-Testing"]
    }
    
    /// Sets up the test suite by loading configuration and test data.
    private func setupTestSuite() throws {
        do {
            ConstantUtils.implicitWait = try loadDoubleFromPlist(filePath: "/Common/Config.plist", key: "ImplicitWait")
            ConstantUtils.implicitWait = try loadDoubleFromJson(filePath: "/Users/nikkilkrishnamurthy/Xcode/ios-uicatalog-master/UIKitCatalog/UIKitCatalogUITests/XCUIFramework/TestData/LoginData.json", key: "type")
        } catch {
            throw TestError.configurationError("Failed to load configuration or test data: \(error)")
        }
    }
    
    /// Measures the launch performance of the application.
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    /// Loads a double value from a plist file.
    private func loadDoubleFromPlist(filePath: String, key: String) throws -> Double {
        guard let value = FileParser.plistParser(filePath: filePath, forKey: key) as NSString? else {
            throw TestError.dataLoadError("Failed to load double from plist.")
        }
        return value.doubleValue
    }
    
    /// Loads a double value from a JSON file.
    private func loadDoubleFromJson(filePath: String, key: String) throws -> Double {
        guard let value = FileParser.jsonParser(filePath: filePath, key: key) as NSString? else {
            throw TestError.dataLoadError("Failed to load double from JSON.")
        }
        return value.doubleValue
    }
}

/// Utility struct for constants used in tests.
struct ConstantUtils {
    static var implicitWait: Double = 0.0
}

/// Enum representing errors that can occur during testing.
enum TestError: Error {
    case configurationError(String)
    case dataLoadError(String)
}

