//
//  FileParser.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 15/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

struct FileParser {
    /// Parses a plist file and returns the value for the specified key.
    /// - Parameters:
    ///   - filePath: The path to the plist file.
    ///   - key: The key for which to retrieve the value.
    /// - Returns: The value associated with the key.
    /// - Throws: An error if the file or key is not found.
    static func plistParser(filePath: String, forKey key: String) throws -> String {
        guard let plistPath = Bundle.main.path(forResource: filePath, ofType: "plist"),
              let plistData = FileManager.default.contents(atPath: plistPath),
              let plistDictionary = NSDictionary(data: plistData) as? [String: Any],
              let value = plistDictionary[key] as? String else {
            throw FileParserError.fileOrKeyNotFound("Failed to find file \(filePath) or key '\(key)' not found.")
        }
        return value
    }

    /// Parses a JSON file and returns the value for the specified key.
    /// - Parameters:
    ///   - filePath: The path to the JSON file.
    ///   - key: The key for which to retrieve the value.
    /// - Returns: The value associated with the key.
    /// - Throws: An error if the file, key, or JSON parsing fails.
    static func jsonParser(filePath: String, key: String) throws -> Any {
        guard let jsonPath = Bundle.main.path(forResource: filePath, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)),
              let jsonObject = try JSONSerialization.jsonObject(with: jsonData),
              let jsonDictionary = jsonObject as? [String: Any],
              let value = jsonDictionary[key] else {
            throw FileParserError.fileOrKeyNotFound("Failed to find file \(filePath), key '\(key)', or error parsing JSON.")
        }
        return value
    }
}

enum FileParserError: Error {
    case fileOrKeyNotFound(String)
}

