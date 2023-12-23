//
//  UITestBase.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 07/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


class UITestBase: XCTestCase {
    
    let app = XCUIApplication()
    
    
    ///Put setup code here. This method is called before the invocation of each test method in the class.
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure=false
        
        configureAppForUITesting()
        setupTestSuite()
        
        // Launch the app
        app.launch()
    }
    
    
    /// Put teardown code here. This method is called after the invocation of each test method in the class.
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Terminate the app
        app.terminate()
    }
    
    
    /// <#Description#>
    private func configureAppForUITesting() {
        // Let app delegate know that we're UI testing
        app.launchArguments += ["UI-Testing"]
    }
    
    
    /// <#Description#>
    private func setupTestSuite() {
        ConstantUtils.implicitWait = (FileParser.plistParser(filePath: "/Common/Config.plist", forKey: "ImplicitWait") as NSString).doubleValue
        ConstantUtils.implicitWait = (FileParser.jsonParser(filePath: "/Users/nikkilkrishnamurthy/Xcode/ios-uicatalog-master/UIKitCatalog/UIKitCatalogUITests/XCUIFramework/TestData/LoginData.json", key: "type")! as NSString).doubleValue
    }
    
    
    /// <#Description#>
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
}
