//
//  TextFieldsTests.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 18/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


class TextFieldsTests: UITestBase {
    
    func test1() {
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).textFields["Placeholder text"].tap()
        
        let placeholderTextTextField = tablesQuery.children(matching: .cell).element(boundBy: 1).textFields["Placeholder text"]
        placeholderTextTextField.tap()
        placeholderTextTextField.tap()
        tablesQuery.children(matching: .other)["SECURE"].children(matching: .other)["SECURE"].tap()
        
    }
}
