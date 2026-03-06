//
//  APISetting.swift
//  Thmanyah
//
//  Created by Ahmed.Abdraboh on 06/03/2026.
//

import Foundation

enum EnvironmentVariables: String {
    case baseURL = "BASE_API_URL"
}

enum APISetting {
    // global variable from info.plist
    static var baseURL: String {
        getStringValueFromDict(key: .baseURL)
    }
}

func getStringValueFromDict(key: EnvironmentVariables) -> String {
    guard let value = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            fatalError("Missing \(key.rawValue) in Info.plist")
        }
        return value
}
