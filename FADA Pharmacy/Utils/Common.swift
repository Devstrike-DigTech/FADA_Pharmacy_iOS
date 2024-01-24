//
//  Common.swift
//  FADA Pharmacy
//
//  Created by Richard Uzor on 24/01/2024.
//

import Foundation

public var IS_FIRST_TIME = "isFirstTime"

//public var isFirstTime: Bool = UserDefaults.standard.bool(forKey: IS_FIRST_TIME) ?? true

import SwiftUI
class DataStore: ObservableObject{
    @AppStorage(IS_FIRST_TIME) var isFirstTime: Bool = true
}
