//
//  TextFieldsElements.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 18/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


class TextFieldsElements: UITestBase {
    
    lazy var defaultPlaceholder: XCUIElement = {
        return app.buttons[""].firstMatch
       }()
    
}
