//
//  ConstantUtils.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 15/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

class ConstantUtils {
    // Using 'let' for constants unless they need to be mutable.
    static let homeDirectory = FileManager.default.homeDirectoryForCurrentUser
    static let implicitWait = 0.0  // Consider making it a computed property if needed.

    static var implicitWait: Double {
    get {
        // Implement the getter logic here.
        return 0.0
    }
    set {
        // Implement the setter logic here.
    }
}

}

