//
//  DashboardElements.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 18/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


class DashboardElements: UITestBase {
    
    lazy var activityIndicatorsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var alertViewsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var buttonsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var datePickerText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var pageControlText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var pickerViewText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var progressViewsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var searchText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var segmentedControlsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var slidersText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var stackViewsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var steppersText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var switchesText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var textFieldsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var textViewText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var toolbarsText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var webViewText: XCUIElement = app.staticTexts[""].firstMatch
    
    lazy var backButton: XCUIElement = app.buttons[""].firstMatch
}
