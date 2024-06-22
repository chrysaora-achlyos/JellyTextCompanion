//
//  UserDefaults+TextStorage.swift
//  JellyTextCompanion
//
//  Created by Dev Account on 6/20/24.
//

import Foundation
extension UserDefaults {
    private enum Key {
        static let text = "text"
    }
    var text: String {
        get {
            return string(forKey: Key.text) ?? ""
        }
        set {
            set(newValue, forKey: Key.text)
        }
    }
}
