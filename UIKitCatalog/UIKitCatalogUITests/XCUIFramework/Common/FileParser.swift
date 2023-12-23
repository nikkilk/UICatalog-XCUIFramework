//
//  FileParser.swift
//  UIKitCatalogUITests
//
//  Created by Nikkil Krishnamurthy on 15/12/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest


struct FileParser {
    var jsonData: Data?
    
    
    /// <#Description#>
    /// - Parameter key: <#key description#>
    /// - Returns: <#description#>
    static func plistParser(filePath: String, forKey key:String) -> String {
        guard let value = Bundle.main.path(forResource: filePath, ofType: nil, inDirectory: filePath) else {
            fatalError("Could not find file \(filePath)")
        }
        return value
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - filePath: <#filePath description#>
    ///   - key: <#key description#>
    /// - Returns: <#description#>
    static func jsonParser(filePath: String, key:String) -> String? {
        do {
            // Read JSON data from the file
            let jsonData = try Data(contentsOf: (URL(fileURLWithPath: filePath)))
            // Parse JSON
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // Check if the parsed object is a dictionary
            guard let jsonDictionary = jsonObject as? [String: Any] else {
                    print("JSON data is not in the expected format (dictionary)")
                    return nil
            }
            // Retrieve value using the provided key and convert to string
            if let value = jsonDictionary[key] {
                return String(describing: value)
            } else {
                print("Key '\(key)' not found in the JSON dictionary")
                return nil
            }
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    /// <#Description#>
    /// - Parameter filePath: <#filePath description#>
    mutating func loadJson(filePath: String) {
        if let path = Bundle.main.path(forResource: filePath, ofType: "json"),
           let data = try?Data(contentsOf: URL(fileURLWithPath: path))
        {
            jsonData = data
        } else {
            print("Failed to load JSON file")
        }
    }
    
    
    /// <#Description#>
    func jsonParse() {
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData!, options: [])
            print("JSON data: ", json)
        } catch {
            print("Error parsing JSON: ", error.localizedDescription)
        }
    }
    
    
    /// <#Description#>
    /// - Parameter filePath: <#filePath description#>
    mutating func loadAndParseJson(filePath: String) {
        guard let path = Bundle.main.path(forResource: filePath, ofType: "json")
        else {
            print("JSON file not found")
            return
        } 
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            jsonData = data
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            // Process the parsed JSON data as needed
            print("Parsed JSON Data: ", json)
        } catch {
            print(("Error loading or parsing JSON: ", error.localizedDescription))
        }
    }
    
}
