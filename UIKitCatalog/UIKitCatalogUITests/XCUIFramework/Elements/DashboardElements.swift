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
    
    private let dashboardLocators: [String: String]
    
    // Initialize dashboardLocators in the constructor
    override init() {
        dashboardLocators = try! FileParser.loadAndParseJson(filePath: "KPMobile/KaiserPermanenteUITests/XCUIFramework/Locators/Dashboard.json")
        super.init()
    }
    
    // Define a helper method to create XCUIElement properties
    private func createTextElement(for key: String) -> XCUIElement {
        return app.staticTexts[dashboardLocators[key] ?? ""].firstMatch
    }
    
    // Use the helper method to create properties for each UI element
    lazy var activityIndicatorsText: XCUIElement = createTextElement(for: "ActivityIndicators")
    lazy var alertViewsText: XCUIElement = createTextElement(for: "AlertViews")
    lazy var buttonsText: XCUIElement = createTextElement(for: "Buttons")
    lazy var datePickerText: XCUIElement = createTextElement(for: "DatePicker")
    lazy var pageControlText: XCUIElement = createTextElement(for: "PageControl")
    lazy var pickerViewText: XCUIElement = createTextElement(for: "PickerView")
    lazy var progressViewsText: XCUIElement = createTextElement(for: "ProgressViews")

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
